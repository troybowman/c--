#include <symbol.h>
#include <treenode.h>
#include <codenode.h>
#include <messages.h>

//-----------------------------------------------------------------------------
#define CNT_LOAD(sym)  (sym->base() == PRIM_INT ? CNT_LW : CNT_LB)
#define CNT_STORE(sym) (sym->base() == PRIM_INT ? CNT_SW : CNT_SB)

//-----------------------------------------------------------------------------
static bool has_call(treenode_t *tree)
{
  if ( tree == NULL )
    return false;
  if ( tree->type == TNT_CALL )
    return true;

  for ( int i = 0; i < 4; i++ )
    if ( has_call(tree->children[i]) )
      return true;

  return false;
}

//-----------------------------------------------------------------------------
void ir_engine_t::check_dest(symbol_t *sym)
{
  if ( sym == NULL )
    return;

  switch ( sym->type() )
  {
    case ST_TEMPORARY:
      temps.add_used(sym);
      break;
    case ST_SAVED_TEMPORARY:
      svtemps.add_used(sym);
      break;
    case ST_ARGUMENT:
      args.add_used(sym);
      break;
    default:
      break;
  }
}

//-----------------------------------------------------------------------------
void ir_engine_t::check_src(symbol_t *sym)
{
  if ( sym == NULL )
    return;

  switch ( sym->type() )
  {
    case ST_TEMPORARY:
      temps.free(sym);
      break;
    case ST_SAVED_TEMPORARY:
      svtemps.free(sym);
      break;
    case ST_ARGUMENT:
      INTERR(1079);
    default:
      break;
  }
}

//-----------------------------------------------------------------------------
ir_engine_t::ir_engine_t(symbol_t *f, symtab_t *s, symlist_t *l, symbol_t *r)
  : temps(ST_TEMPORARY), svtemps(ST_SAVED_TEMPORARY), args(ST_ARGUMENT)
{
  func     = f;
  strings  = s;
  labels   = l;
  retloc   = r;
  head     = NULL;
  tail     = head;
  ASSERT(1055, f != NULL);
  ASSERT(1056, s != NULL);
  ASSERT(1057, l != NULL);
  ASSERT(1058, r != NULL);
}

//-----------------------------------------------------------------------------
symbol_t *ir_engine_t::gen_temp(ir_ctx_t ctx)
{
  switch ( ctx )
  {
    case IRCTX_SV_RVAL:
      return svtemps.gen_resource();
    case IRCTX_NONE:
      return temps.gen_resource();
    default:
      INTERR(1080);
  }
}

//-----------------------------------------------------------------------------
void ir_engine_t::append(
    codenode_type_t type,
    symbol_t *dest,
    symbol_t *src1,
    symbol_t *src2)
{
  check_dest(dest);
  check_src(src1);
  check_src(src2);

  codenode_t *node = new codenode_t(type, dest, src1, src2);

  if ( head == NULL )
    head = tail = node;
  else
    tail = tail->next = node;
}

//-----------------------------------------------------------------------------
symbol_t *ir_engine_t::generate(treenode_t *tree, ir_ctx_t ctx)
{
  if ( tree == NULL )
    return NULL;

  switch ( tree->type )
  {
    case TNT_STMT:
      {
        generate(tree->children[SEQ_CUR]);
        generate(tree->children[SEQ_NEXT]);
        break;
      }
    case TNT_INTCON:
    case TNT_CHARCON:
      {
        symbol_t *dest = gen_temp(ctx);
        symbol_t *src1 = tree->type == TNT_CHARCON
                       ? new symbol_t(ST_IMMEDIATE_CHAR, tree->str)
                       : new symbol_t(ST_IMMEDIATE_INT, tree->val);
        append(CNT_MOV, dest, src1, NULL);
        return dest;
      }
    case TNT_STRCON:
      {
        std::string key(tree->str);
        symbol_t *sym = strings->get(key);
        if ( sym == NULL )
        {
          sym = new symbol_t(ST_STRCON, tree->str);
          strings->insert(key, sym);
        }
        symbol_t *dest = gen_temp(ctx);
        append(CNT_LEA, dest, sym, NULL);
        return dest;
      }
    case TNT_ASSG:
      {
        treenode_t *rhs = tree->children[RHS];
        treenode_t *lhs = tree->children[LHS];

        symbol_t *src1 = generate(rhs, has_call(lhs) ? IRCTX_SV_RVAL : IRCTX_NONE);
        symbol_t *dest = generate(lhs, IRCTX_LVAL);

        append(CNT_STORE(lhs->sym), dest, src1, NULL);
        break;
      }
    case TNT_SYMBOL:
      {
        symbol_t *sym = tree->sym;
        if ( ctx == IRCTX_LVAL )
          return sym;

        symbol_t *dest = gen_temp(ctx);

        append(CNT_LOAD(sym), dest, sym, NULL);
        return dest;
      }
    case TNT_ARRAY_LOOKUP:
      {
        treenode_t *idxtree = tree->children[AL_OFFSET];
        symbol_t *idx = generate(idxtree);

        symbol_t *base = gen_temp();
        append(CNT_LEA, base, tree->sym, NULL);

        symbol_t *dest;
        if ( ctx == IRCTX_LVAL )
        {
          dest = gen_temp();
          append(CNT_ADD, dest, base, idx);
        }
        else
        {
          symbol_t *loc = gen_temp();
          append(CNT_ADD, loc, base, idx);
          dest = gen_temp(ctx); // TODO
          append(CNT_LOAD(tree->sym), dest, loc, NULL);
        }
        return dest;
      }
    case TNT_ARG:
      {
        treenode_t *cur  = tree->children[SEQ_CUR];
        treenode_t *next = tree->children[SEQ_NEXT];

        symbol_t *argval = generate(cur);
        symbol_t *argloc = args.gen_resource();
        append(CNT_ARG, argloc, argval, NULL);

        generate(next);
        break;
      }
    case TNT_CALL:
      {
        generate(tree->children[CALL_ARGS]);
        args.reset();

        symbol_t *f = tree->sym;
        if ( f->rt() != RT_VOID )
        {
          append(CNT_CALL, retloc, f, NULL);

          symbol_t *temp = gen_temp(ctx);
          append(CNT_MOV, temp, retloc, NULL);
          return temp;
        }
        else
        {
          append(CNT_CALL, NULL, f, NULL);
          break;
        }
      }
    case TNT_RET:
      {
        symbol_t *retval = generate(tree->children[RET_EXPR]);
        if ( retval != NULL )
          append(CNT_RET, retloc, retval, NULL);
        else
          append(CNT_RET, NULL, NULL, NULL);
        break;
      }
    default:
      INTERR(1059);
  }

  temps.reset();
  svtemps.reset();
  return NULL;
}

//-----------------------------------------------------------------------------
ir_func_t *ir_engine_t::generate()
{
  generate(func->tree());
  return new ir_func_t(func, head, temps.get_used(),
                       svtemps.get_used(), args.get_used());
}

//-----------------------------------------------------------------------------
void generate(ir_t *ir, const symlist_t &functions)
{
  symlist_t::const_iterator i;
  for ( i = functions.begin(); i != functions.end(); i++ )
  {
    ir_engine_t e(*i, ir->strings, ir->labels, ir->retloc);
    ir_func_t *irf = e.generate();
    ir->funcs.push_back(irf);
  }
}
