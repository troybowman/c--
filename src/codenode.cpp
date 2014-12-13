#include <symbol.h>
#include <treenode.h>
#include <messages.h>
#include <codenode.h>

//-----------------------------------------------------------------------------
static inline bool is_temp(symbol_t *sym)
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
static inline codenode_type_t cntload(const symbol_t &sym)
{
  return sym.base() == PRIM_INT ? CNT_LW : CNT_LB;
}

static inline codenode_type_t cntstore(const symbol_t &sym)
{
  return sym.base() == PRIM_INT ? CNT_SW : CNT_SB;
}

//-----------------------------------------------------------------------------
ir_engine_t::it_engine_t(symlist_t *_functions) : functions(_functions)
{
  head = NULL;
  tail = head;
  tmpcnt = 0;
  strings = new symtab_t();
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
    codenode_type_t *type,
    symbol_t *dest,
    symbol_t *src1,
    symbol_t *src2)
{
  if ( is_temp(dest) )
    tmpcnt++;

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
    case TNT_ASSG:
      {
        treenode_t *rhs = tree->children[RHS];
        treenode_t *lhs = tree->children[LHS];

        symbol_t *src1 = generate(rhs, has_call(lhs) ? CTX_SV_TEMP : 0);
        symbol_t *dest = generate(lhs, CTX_LVAL);

        append(cntstore(*lhs->sym), dest, src1, NULL);
      }
      break;
    case TNT_SYMBOL:
      {
        symbol_t *sym = tree->sym;
        if ( (ctx & CTX_LVAL) != 0 )
          return sym;

        symbol_t *dest = gen_rval(ctx);

        append(cntload(*sym), dest, sym, NULL);
        return dest;
      }
    case TNT_ARRAY_LOOKUP:
      {
        symbol_t *base = new symbol_t(ST_TEMPORARY);
        append(CNT_LEA, base, tree->sym, NULL);

        treenode_t *idxtree = tree->children[AL_LOOKUP];
        symbol_t *idx = generate(idxtree, 0);

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
          append(cntload(*tree->sym), dest, loc, NULL);
        }
        return dest;
      }
    default:
      INTERR(0);
  }
}

