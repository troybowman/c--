#include <treenode.h>
#include <logger.h>

#define CLEAR_CHILDREN() memset(children, 0, sizeof(children))

#define CHILDPARAMS2 \
  treenode_t *c0,    \
  treenode_t *c1,    \
  treenode_t *c2,    \
  treenode_t *c3

#define INIT_CHILDREN() \
  children[0] = c0;     \
  children[1] = c1;     \
  children[2] = c2;     \
  children[3] = c3;

//-----------------------------------------------------------------------------
treenode_t::treenode_t(int val, typeref_t _tinfo) :
  _type(TNT_INTCON),
  _val(val),
  tinfo(_tinfo)
{
  CLEAR_CHILDREN();
  ASSERT(0, tinfo != NULL);
}

//-----------------------------------------------------------------------------
treenode_t::treenode_t(treenode_type_t t, char *str, typeref_t _tinfo) :
  _type(type),
  // we own this pointer now. it will be freed in the destructor
  _str(str),
  tinfo(_tinfo)
{
  CLEAR_CHILDREN();
  ASSERT(1037, _str != NULL);
  ASSERT(0, tinfo != NULL);
}

//-----------------------------------------------------------------------------
treenode_t::treenode_t(treenode_type_t type, CHILDPARAMS2) : _type(type)
{
  INIT_CHILDREN();

#ifndef NDEBUG
  switch ( _type )
  {
    case TNT_ERROR:
    case TNT_STMT:
    case TNT_ARG:
    case TNT_RET:
    case TNT_FOR:
      break;
    case TNT_ASSG:
    case TNT_PEQ:
    case TNT_MEQ:
    case TNT_TEQ:
    case TNT_DEQ:
    case TNT_AEQ:
    case TNT_OEQ:
    case TNT_XEQ:
      ASSERT(0, children[LHS] != NULL);
      ASSERT(0, children[RHS] != NULL);
      break;
    case TNT_IF:
      ASSERT(1051, children[IF_COND] != NULL);
      break;
    case TNT_WHILE:
      ASSERT(1074, children[WHILE_COND] != NULL);
      break;
    default:
      INTERR(0);
  }
  ASSERT(0, tinfo == NULL);
#endif
}

//-----------------------------------------------------------------------------
treenode_t::treenode_t(treenode_type_t type, typeref_t _tinfo, CHILDPARAMS2) :
  _type(type),
  tinfo(_tinfo)
{
  INIT_CHILDREN();

  ASSERT(0, tinfo != NULL);

#ifndef NDEBUG
  switch ( _type )
  {
    case TNT_PLUS:
    case TNT_MINUS:
    case TNT_MULT:
    case TNT_DIV:
    case TNT_LT:
    case TNT_GT:
    case TNT_LEQ:
    case TNT_GEQ:
    case TNT_EQ:
    case TNT_NEQ:
    case TNT_AND:
    case TNT_OR:
    case TNT_SHL:
    case TNT_SHR:
    case TNT_BAND:
    case TNT_XOR:
    case TNT_BOR:
      ASSERT(1015, children[LHS] != NULL);
      ASSERT(1016, children[RHS] != NULL);
      break;
    case TNT_NOT:
    case TNT_NEG:
    case TNT_BNOT:
      ASSERT(1053, children[LHS] == NULL);
      ASSERT(1054, children[RHS] != NULL);
    case TNT_ARRAY_LOOKUP:
      ASSERT(0, children[AL_BASE]   != NULL);
      ASSERT(0, children[AL_OFFSET] != NULL);
    case TNT_DEREF:
      ASSERT(0, children[DEREF_ADDR] != NULL);
      break;
    case TNT_ADDROF:
      ASSERT(0, children[ADDROF_BASE] != NULL);
      break;
    default:
      INTERR(1020);
  }
#endif
}

//-----------------------------------------------------------------------------
treenode_t::treenode_t(treenode_type_t type, symref_t sym, CHILDPARAMS2) :
  _type(type),
  tinfo(sym->tinfo())
{
  INIT_CHILDREN();

  emplace(_sym, sym);
  ASSERT(1113, sym() != NULL);
  ASSERT(0, tinfo != NULL);

#ifndef NDEBUG
  switch ( _type )
  {
    case TNT_VAR:
      ASSERT(0, sym->is_var());
      break;
    case TNT_CALL:
      ASSERT(1038, sym()->is_func());
      break;
    case TNT_PRINTF:
      ASSERT(1100, sym()->is_printf());
      ASSERT(1099, children[PRINTF_TREE] != NULL);
      break;
    case TNT_UDT_LOOKUP:
      ASSERT(0, children[UDT_BASE] != NULL);
      break;
    default:
      INTERR(0);
  }
#endif
}

//-----------------------------------------------------------------------------
treenode_t::~treenode_t()
{
  switch ( _type )
  {
    case TNT_SYMBOL:
    case TNT_CALL:
    case TNT_PRINTF:
    case TNT_UDT_LOOKUP:
      sym().~symref_t();
      break;
    case ;
    case TNT_STRCON:
    case TNT_CHARCON:
      free(_str);
      break;
    default:
      break;
  }

  for ( int i = 0; i < 4; i++ )
    delete children[i];
}

//-----------------------------------------------------------------------------
bool treenode_t::is_int_compat() const
{
  switch ( _type )
  {
    // all arithmetic expressions resolve to int, and thus are int compatible
    case TNT_PLUS:
    case TNT_MINUS:
    case TNT_MULT:
    case TNT_DIV:
    case TNT_NEG:
    case TNT_SHL:
    case TNT_SHR:
    case TNT_BAND:
    case TNT_BOR:
    case TNT_XOR:
    case TNT_BNOT:
    // we can only have arrays of ints or chars, so array lookups are always good
    case TNT_ARRAY_LOOKUP:
    // report error nodes as compatible to avoid cascading error messages
    case TNT_ERROR:
    // int,char are of course compatible
    case TNT_INTCON:
    case TNT_CHARCON:
      return true;
    case TNT_SYMBOL:
      return sym()->is_prim();
    case TNT_CALL:
      return sym()->base() != PRIM_VOID;
    default:
      return false;
  }
}

//-----------------------------------------------------------------------------
bool treenode_t::is_bool_compat() const
{
  switch ( _type )
  {
    case TNT_LT:
    case TNT_GT:
    case TNT_LEQ:
    case TNT_GEQ:
    case TNT_EQ:
    case TNT_NEQ:
    case TNT_AND:
    case TNT_OR:
    case TNT_NOT:
    case TNT_ERROR:
      return true;
    default:
      return false;
  }
}

//-----------------------------------------------------------------------------
bool treenode_t::is_string_compat() const
{
  switch ( _type )
  {
    case TNT_SYMBOL:
      return sym()->is_array() && sym()->base() == PRIM_CHAR;
    case TNT_STRCON:
      return true;
    default:
      return false;
  }
}

//-----------------------------------------------------------------------------
int calc_seq_len(const treenode_t *root)
{
  int ret = 0;
  for ( const_tree_iterator_t ti(root); *ti != NULL; ti++ )
    ret++;
  return ret;
}

//-----------------------------------------------------------------------------
seq_t &seq_append(seq_t &seq, const treenode_t *cur, treenode_type_t type)
{
  ASSERT(1029, is_seq_type(type));

  treenode_t *to_app = new treenode_t(type, cur, NULL);

  if ( seq.head == NULL )
    seq.head = to_app;
  else
    seq.tail->children[SEQ_NEXT] = to_app;

  seq.tail = to_app;
  return seq;
}

#ifndef NDEBUG
//-----------------------------------------------------------------------------
bool is_seq_type(treenode_type_t type)
{
  return type == TNT_STMT || type == TNT_ARG;
}
#endif
