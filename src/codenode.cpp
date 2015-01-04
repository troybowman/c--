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
static codenode_type_t tnt2cnt(treenode_type_t type)
{
  switch ( type )
  {
    case TNT_PLUS:  return CNT_ADD;
    case TNT_MINUS: return CNT_SUB;
    case TNT_DIV:   return CNT_DIV;
    case TNT_MULT:  return CNT_MUL;
    case TNT_OR:    return CNT_OR;
    case TNT_AND:   return CNT_AND;
    case TNT_LT:    return CNT_SLT;
    case TNT_GT:    return CNT_SGT;
    case TNT_GEQ:   return CNT_SGE;
    case TNT_LEQ:   return CNT_SLE;
    case TNT_EQ:    return CNT_SEQ;
    case TNT_NEQ:   return CNT_SNE;
    default:
      INTERR(0);
  }
}

//-----------------------------------------------------------------------------
void ir_engine_t::check_dest(symbol_t *sym)
{
  if ( sym == NULL )
    return;

  switch ( sym->type() )
  {
    case ST_TEMPORARY:
      temps.used(sym);
      break;
    case ST_SAVED_TEMPORARY:
      svtemps.used(sym);
      break;
    case ST_ARGUMENT:
      args.used(sym);
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
#ifndef NDEBUG
  static int lblcnt = 0;
#endif
  switch ( sym->type() )
  {
    case ST_TEMPORARY:
      temps.free(sym);
      break;
    case ST_SAVED_TEMPORARY:
      svtemps.free(sym);
      break;
    case ST_LABEL:
#ifndef NDEBUG
      sym->set_val(lblcnt++);
#endif
      labels.push_back(sym);
      break;
    case ST_ARGUMENT:
      INTERR(1079);
    default:
      break;
  }
}

//-----------------------------------------------------------------------------
inline symbol_t *ir_engine_t::gen_temp(uint32_t flags)
{
  return (flags & CTX_SAVE) != 0 ? svtemps.gen_resource() : temps.gen_resource();
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
symbol_t *ir_engine_t::generate(const treenode_t *tree, ir_ctx_t ctx)
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
        symbol_t *dest = gen_temp(ctx.flags);
        symbol_t *src1 = tree->type == TNT_CHARCON
                       ? new symbol_t(ST_CHARCON, tree->str)
                       : new symbol_t(ST_INTCON, tree->val);
        append(CNT_MOV, dest, src1);
        return dest;
      }
    case TNT_STRCON:
      {
        std::string key(tree->str);
        symbol_t *sym = strings.get(key);
        if ( sym == NULL )
        {
          sym = new symbol_t(ST_STRCON, tree->str);
          strings.insert(key, sym);
        }
        symbol_t *dest = gen_temp(ctx.flags);
        append(CNT_LEA, dest, sym);
        return dest;
      }
    case TNT_ASSG:
      {
        treenode_t *rhs = tree->children[RHS];
        treenode_t *lhs = tree->children[LHS];

        symbol_t *src1 = generate(rhs, has_call(lhs) ? CTX_SAVE : 0);
        symbol_t *dest = generate(lhs, CTX_LVAL);

        append(CNT_STORE(lhs->sym), dest, src1);
        break;
      }
    case TNT_SYMBOL:
      {
        symbol_t *sym = tree->sym;
        if ( (ctx.flags & CTX_LVAL) != 0 )
          return sym;

        symbol_t *dest;
        if ( sym->is_array() )
        {
          dest = gen_temp();
          append(CNT_LEA, dest, sym);
        }
        else
        {
          dest = gen_temp(ctx.flags);
          append(CNT_LOAD(sym), dest, sym);
        }
        return dest;
      }
    case TNT_ARRAY_LOOKUP:
      {
        treenode_t *idxtree = tree->children[AL_OFFSET];
        symbol_t *idx = generate(idxtree);

        symbol_t *base = gen_temp();
        append(CNT_LEA, base, tree->sym, NULL);

        symbol_t *dest;
        if ( (ctx.flags & CTX_LVAL) != 0 )
        {
          dest = gen_temp();
          append(CNT_ADD, dest, base, idx);
        }
        else
        {
          symbol_t *loc = gen_temp();
          append(CNT_ADD, loc, base, idx);
          dest = gen_temp(ctx.flags);
          append(CNT_LOAD(tree->sym), dest, loc);
        }
        return dest;
      }
    case TNT_CALL:
      {
        symlist_t argvals;
        symlist_t arglocs;

        tree_iterator_t ti(tree->children[CALL_ARGS]);

        for ( ; ti.cur() != NULL; ti++ )
          argvals.push_back(generate(ti.cur()));

        int size = argvals.size();
        for ( int i = 0; i < size; i++ )
          arglocs.push_back(args.gen_resource());

        symlist_t::reverse_iterator val = argvals.rbegin();
        symlist_t::reverse_iterator loc = arglocs.rbegin();

        for ( ; val != argvals.rend() && loc != arglocs.rend(); val++, loc++ )
          append(CNT_ARG, *loc, *val);

        args.reset();

        symbol_t *f = tree->sym;
        if ( f->rt() != RT_VOID )
        {
          append(CNT_CALL, &retloc, f);

          symbol_t *temp = gen_temp(ctx.flags);
          append(CNT_MOV, temp, &retloc);
          return temp;
        }

        append(CNT_CALL, NULL, f);
        break;
      }
    case TNT_RET:
      {
        symbol_t *retval = generate(tree->children[RET_EXPR]);
        if ( retval != NULL )
          append(CNT_RET, &retloc, retval);
        else
          append(CNT_RET);
        break;
      }
    case TNT_PLUS:
    case TNT_MINUS:
    case TNT_DIV:
    case TNT_MULT:
    case TNT_OR:
    case TNT_AND:
    case TNT_LT:
    case TNT_GT:
    case TNT_GEQ:
    case TNT_LEQ:
    case TNT_EQ:
    case TNT_NEQ:
      {
        treenode_t *lhs = tree->children[LHS];
        treenode_t *rhs = tree->children[RHS];

        symbol_t *src1 = generate(lhs, has_call(rhs) ? CTX_SAVE : 0);
        symbol_t *src2 = generate(rhs);
        symbol_t *dest = gen_temp(ctx.flags);

        append(tnt2cnt(tree->type), dest, src1, src2);
        return dest;
      }
    case TNT_IF:
      {
        symbol_t *endif = (ctx.flags & CTX_IF) != 0
                         ? ctx.endif
                         : new symbol_t(ST_LABEL);

        treenode_t *elsetree = tree->children[IF_ELSE];

        symbol_t *cond_target = elsetree == NULL
                              ? endif
                              : new symbol_t(ST_LABEL);

        symbol_t *cond = generate(tree->children[IF_COND]);
        append(CNT_CNDJMP, cond_target, cond);

        ir_ctx_t ifctx(endif);
        generate(tree->children[IF_BODY], ifctx);

        if ( elsetree != NULL )
        {
          append(CNT_JUMP, endif);

          append(CNT_LABEL, NULL, cond_target);
          generate(elsetree, ifctx);
        }

        if ( (ctx.flags & CTX_IF) == 0 )
          append(CNT_LABEL, NULL, endif);
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
  generate(func.tree);
  return new ir_func_t(func.sym, head, *temps.get_union(),
                       *svtemps.get_union(), *args.get_union());
}

//-----------------------------------------------------------------------------
void generate(ir_t &ir, const treefuncs_t &functions)
{
  treefuncs_t::const_iterator i;
  for ( i = functions.begin(); i != functions.end(); i++ )
  {
    treefunc_t tf = *i;
    ir_engine_t e(tf, ir.strings, ir.labels, ir.retloc);
    ir_func_t *irf = e.generate();
    ir.funcs.push_back(irf);
  }
}
