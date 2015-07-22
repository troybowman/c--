#include <treenode.h>
#include <logger.h>

#define INIT_CHILDREN() memset(children, 0, sizeof(children))

//-----------------------------------------------------------------------------
treenode_t::treenode_t(treenode_type_t type, ...) : _type(type)
{
  INIT_CHILDREN();

  va_list va;
  va_start(va, type);
  switch ( type )
  {
    case TNT_ERROR:
      break;
    case TNT_INTCON:
      _val = va_arg(va, int);
      break;
    case TNT_STRCON:
    case TNT_CHARCON:
      // we own this pointer now. it will be freed in the destructor
      _str = va_arg(va, char *);
      ASSERT(1037, _str != NULL);
      break;
    case TNT_ASSG:
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
    case TNT_PEQ:
    case TNT_MEQ:
    case TNT_TEQ:
    case TNT_DEQ:
      children[LHS] = va_arg(va, treenode_t *);
      children[RHS] = va_arg(va, treenode_t *);
      ASSERT(1015, children[LHS] != NULL);
      ASSERT(1016, children[RHS] != NULL);
      break;
    case TNT_NOT:
    case TNT_NEG:
    case TNT_BNOT:
      children[LHS] = va_arg(va, treenode_t *);
      children[RHS] = va_arg(va, treenode_t *);
      ASSERT(1053, children[LHS] == NULL);
      ASSERT(1054, children[RHS] != NULL);
      break;
    case TNT_FOR:
      children[FOR_INIT] = va_arg(va, treenode_t *);
      children[FOR_COND] = va_arg(va, treenode_t *);
      children[FOR_INC]  = va_arg(va, treenode_t *);
      children[FOR_BODY] = va_arg(va, treenode_t *);
      break;
    case TNT_STMT:
    case TNT_ARG:
      children[SEQ_CUR]  = va_arg(va, treenode_t *);
      children[SEQ_NEXT] = va_arg(va, treenode_t *);
      break;
    case TNT_RET:
      children[RET_EXPR]  = va_arg(va, treenode_t *);
      break;
    case TNT_IF:
      children[IF_COND] = va_arg(va, treenode_t *);
      children[IF_BODY] = va_arg(va, treenode_t *);
      children[IF_ELSE] = va_arg(va, treenode_t *);
      ASSERT(1051, children[IF_COND] != NULL);
      break;
    case TNT_WHILE:
      children[WHILE_COND] = va_arg(va, treenode_t *);
      children[WHILE_BODY] = va_arg(va, treenode_t *);
      ASSERT(1074, children[WHILE_COND] != NULL);
      break;
    default:
      INTERR(1020);
  }
  va_end(va);
}

//-----------------------------------------------------------------------------
treenode_t::treenode_t(symref_t ref, treenode_type_t type, ...) : _type(type)
{
  INIT_CHILDREN();

  putref(_sym, ref);
  ASSERT(1113, sym() != NULL);

  va_list va;
  va_start(va, type);
  switch ( _type )
  {
    case TNT_SYMBOL:
      break;
    case TNT_ARRAY_LOOKUP:
      children[AL_OFFSET] = va_arg(va, treenode_t *);
      ASSERT(1018, children[AL_OFFSET] != NULL);
      break;
    case TNT_CALL:
      children[CALL_ARGS] = va_arg(va, treenode_t *);
      ASSERT(1038, sym()->is_func());
      break;
    case TNT_PRINTF:
      children[PRINTF_TREE] = va_arg(va, treenode_t *);
      ASSERT(1100, sym()->is_printf());
      ASSERT(1099, children[PRINTF_TREE] != NULL);
      break;
    default:
      INTERR(0);
  }
  va_end(va);
}

//-----------------------------------------------------------------------------
treenode_t::~treenode_t()
{
  switch ( _type )
  {
    case TNT_SYMBOL:
    case TNT_ARRAY_LOOKUP:
    case TNT_CALL:
    case TNT_PRINTF:
      sym().~symref_t();
      break;
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
