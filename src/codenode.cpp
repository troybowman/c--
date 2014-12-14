#include <symbol.h>
#include <treenode.h>
#include <messages.h>
#include <codenode.h>

//-----------------------------------------------------------------------------
#define CNT_LOAD(sym)  (sym->base() == PRIM_INT ? CNT_LW : CNT_LB)
#define CNT_STORE(sym) (sym->base() == PRIM_INT ? CNT_SW : CNT_SB)

//-----------------------------------------------------------------------------
inline bool is_temp(symbol_t *sym)
{
  return sym == NULL ? false : sym->is_temp();
}

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
ir_engine_t::ir_engine_t(symbol_t *f, symtab_t *g, symtab_t *s, symlist_t *l)
{
  func    = f;
  gsyms   = g;
  strings = s;
  labels  = l;
  head    = NULL;
  tail    = head;
  tmpcnt  = 0;
  ASSERT(1055, f != NULL);
  ASSERT(1056, g != NULL);
  ASSERT(1057, s != NULL);
  ASSERT(1058, l != NULL);
}

//-----------------------------------------------------------------------------
symbol_t *ir_engine_t::gen_rval(uint32_t ctx)
{
  symbol_type_t type;
  if ( (ctx & CTX_SV_RVAL) != 0 )
    type = ST_SAVED_TEMPORARY;
  else
    type = ST_TEMPORARY;
  return new symbol_t(type);
}

//-----------------------------------------------------------------------------
void ir_engine_t::append(
    codenode_type_t type,
    symbol_t *dest,
    symbol_t *src1,
    symbol_t *src2)
{
  if ( is_temp(dest) )
    tmpcnt++;

  if ( tmpcnt > func->max_temps() )
    func->set_max_temps(tmpcnt);

  if ( is_temp(src1) )
    tmpcnt--;
  if ( is_temp(src2) )
    tmpcnt--;

  codenode_t *node = new codenode_t(type, dest, src1, src2);

  if ( head == NULL )
    head = tail = node;
  else
    tail = tail->next = node;
}

//-----------------------------------------------------------------------------
symbol_t *ir_engine_t::generate(treenode_t *tree, uint32_t ctx)
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
        symbol_t *dest = gen_rval(ctx);
        symbol_t *src1 = tree->type == TNT_CHARCON
                       ? new symbol_t(ST_IMMEDIATE_CHAR, tree->str)
                       : new symbol_t(tree->val);
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
        symbol_t *dest = gen_rval(ctx);
        append(CNT_LEA, dest, sym, NULL);
        return dest;
      }
    case TNT_ASSG:
      {
        treenode_t *rhs = tree->children[RHS];
        treenode_t *lhs = tree->children[LHS];

        symbol_t *src1 = generate(rhs, has_call(lhs) ? CTX_SV_RVAL : 0);
        symbol_t *dest = generate(lhs, CTX_LVAL);

        append(CNT_STORE(lhs->sym), dest, src1, NULL);
        break;
      }
    case TNT_SYMBOL:
      {
        symbol_t *sym = tree->sym;
        if ( (ctx & CTX_LVAL) != 0 )
          return sym;

        symbol_t *dest = gen_rval(ctx);

        append(CNT_LOAD(sym), dest, sym, NULL);
        return dest;
      }
    case TNT_ARRAY_LOOKUP:
      {
        treenode_t *idxtree = tree->children[AL_OFFSET];
        symbol_t *idx = generate(idxtree);

        symbol_t *base = new symbol_t(ST_TEMPORARY);
        append(CNT_LEA, base, tree->sym, NULL);

        symbol_t *dest;
        if ( (ctx & CTX_LVAL) != 0 )
        {
          dest = new symbol_t(ST_TEMPORARY);
          append(CNT_ADD, dest, base, idx);
        }
        else
        {
          dest = gen_rval(ctx);
          symbol_t *loc = new symbol_t(ST_TEMPORARY);
          append(CNT_ADD, loc, base, idx);
          append(CNT_LOAD(tree->sym), dest, loc, NULL);
        }
        return dest;
      }
    case TNT_ARG:
      {
        treenode_t *cur  = tree->children[SEQ_CUR];
        treenode_t *next = tree->children[SEQ_NEXT];

        symbol_t *arg  = generate(cur);
        symbol_t *dest = new symbol_t(ST_ANONYMOUS);
        append(CNT_ARG, dest, arg, NULL);

        generate(next);
        break;
      }
    case TNT_CALL:
      {
        generate(tree->children[CALL_ARGS]);

        symbol_t *f = tree->sym;
        if ( f->rt() != RT_VOID )
        {
          symbol_t *ret = new symbol_t(ST_ANONYMOUS);
          append(CNT_CALL, ret, f, NULL);

          symbol_t *temp = gen_rval(ctx);
          append(CNT_MOV, temp, ret, NULL);
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
        {
          symbol_t *ret = new symbol_t(ST_ANONYMOUS);
          append(CNT_RET, ret, retval, NULL);
          return ret;
        }
        else
        {
          append(CNT_RET, NULL, NULL, NULL);
          break;
        }
      }
    default:
      INTERR(1059);
  }

  tmpcnt = 0;
  return NULL;
}

//-----------------------------------------------------------------------------
void ir_engine_t::generate()
{
  generate(func->tree());
  func->set_code(head);
}
