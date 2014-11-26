#include <stdarg.h>

#include <treenode.h>
#include <messages.h>

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
    case TNT_EMPTY:
    case TNT_ERROR:
      break;
    case TNT_INTCON:
      val = va_arg(va, int);
      break;
    case TNT_STRCON:
      str = va_arg(va, char *);
      break;
    case TNT_SYMBOL:
      sym = va_arg(va, symbol_t *);
      ASSERT(1019, sym != NULL);
      ASSERT(1026, sym->type != ST_UNKNOWN);
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
      ASSERT(1020, children[LHS] != NULL);
      ASSERT(1021, children[RHS] != NULL);
      break;
    case TNT_ARRAY_LOOKUP:
      children[AL_BASE] = va_arg(va, treenode_t *);
      children[AL_IDX]  = va_arg(va, treenode_t *);
      ASSERT(1022, children[AL_BASE] != NULL);
      ASSERT(1023, children[AL_IDX] != NULL);
      break;
    case TNT_FOR:
      children[FOR_INIT]  = va_arg(va, treenode_t *);
      children[FOR_CHECK] = va_arg(va, treenode_t *);
      children[FOR_INC]   = va_arg(va, treenode_t *);
      children[FOR_BODY]  = va_arg(va, treenode_t *);
    case TNT_STMT:
      children[STMT_CUR]  = va_arg(va, treenode_t *);
      children[STMT_NEXT] = va_arg(va, treenode_t *);
      ASSERT(1024, children[STMT_CUR] != NULL);
      break;
    default:
      INTERR(0);
  }
}

//-----------------------------------------------------------------------------
bool treenode_t::is_int_compat()
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
    // we can only have arrays of its or chars, so array lookups are always good
    case TNT_ARRAY_LOOKUP:
    // report error nodes as compatible to avoid cascading error messages
    case TNT_ERROR:
      return true;
    case TNT_SYMBOL:
      return sym->type == ST_PRIMITIVE;
    default:
      return false;
  }
}
