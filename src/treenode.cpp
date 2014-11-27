#include <stdarg.h>

#include <treenode.h>
#include <messages.h>
#include <symbol.h>

//-----------------------------------------------------------------------------
treenode_t::treenode_t(treenode_type_t _type, ...)
  : type(_type)
{
  children[0] = NULL;
  children[1] = NULL;
  children[2] = NULL;
  children[3] = NULL;

  va_list va;
  va_start(va, _type);
  switch ( _type )
  {
    case TNT_ERROR:
      break;
    case TNT_INTCON:
      val = va_arg(va, int);
      break;
    case TNT_STRCON:
    case TNT_CHARCON:
      str = va_arg(va, char *);
      ASSERT(0, str!= NULL);
      break;
    case TNT_SYMBOL:
      sym = va_arg(va, symbol_t *);
      ASSERT(1014, sym != NULL);
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
      children[LHS] = va_arg(va, treenode_t *);
      children[RHS] = va_arg(va, treenode_t *);
      ASSERT(1015, children[LHS] != NULL);
      ASSERT(1016, children[RHS] != NULL);
      break;
    case TNT_ARRAY_LOOKUP:
      children[AL_BASE]   = va_arg(va, treenode_t *);
      children[AL_OFFSET] = va_arg(va, treenode_t *);
      ASSERT(1017, children[AL_BASE] != NULL);
      ASSERT(1018, children[AL_OFFSET] != NULL);
      break;
    case TNT_FOR:
      children[FOR_INIT]  = va_arg(va, treenode_t *);
      children[FOR_CHECK] = va_arg(va, treenode_t *);
      children[FOR_INC]   = va_arg(va, treenode_t *);
      children[FOR_BODY]  = va_arg(va, treenode_t *);
      break;
    case TNT_STMT:
      children[STMT_CUR]  = va_arg(va, treenode_t *);
      children[STMT_NEXT] = va_arg(va, treenode_t *);
      // stmt nodes can point to nothing - it's how we identify empty functions
      break;
    case TNT_CALL:
      children[CALL_SYM]  = va_arg(va, treenode_t *);
      children[CALL_ARGS] = va_arg(va, treenode_t *);
      ASSERT(1023, children[CALL_SYM] != NULL);
      break;
    default:
      INTERR(1020);
  }
}

//-----------------------------------------------------------------------------
treenode_t::~treenode_t()
{
  if ( type == TNT_CHARCON || type == TNT_STRCON )
    free(str);
  for ( int i = 0; i < 4; i++ )
    delete children[i];
}

//-----------------------------------------------------------------------------
bool treenode_t::is_int_compat() const
{
  switch ( type )
  {
    // all arithmetic expressions resolve to int, and thus are int compatible
    case TNT_PLUS:
    case TNT_MINUS:
    case TNT_MULT:
    case TNT_DIV:
    // integer constants and char constants are of course int compatible
    case TNT_INTCON:
    case TNT_CHARCON:
    // we can only have arrays of ints or chars, so array lookups are always good
    case TNT_ARRAY_LOOKUP:
    // report error nodes as compatible to avoid cascading error messages
    case TNT_ERROR:
      return true;
    case TNT_SYMBOL:
      return sym->type == ST_PRIMITIVE;
    case TNT_CALL:
    {
      symbol_t *sym = children[CALL_SYM]->sym;
      return sym->func.rt_type != RT_VOID;
    }
    default:
      return false;
  }
}
