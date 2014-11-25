#include <stdarg.h>

#include <treenode.h>
#include <messages.h>

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
      ASSERT(1019, children[STMT_CUR] != NULL);
    default:
      INTERR(1020);
  }
}
