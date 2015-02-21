#include <vector>
#include <symbol.h>
#include <treenode.h>

//-----------------------------------------------------------------------------
// builtin function names
#define BI_PRINT_STRING "_print_string"
#define BI_PRINT_INT    "_print_int"
#define BI_PRINT_CHAR   "_print_char"

#define FMTS 's' // %s for strings
#define FMTD 'd' // %d for ints
#define FMTC 'c' // %c for chars

#define EMPTYSTRING "\"\""

//-----------------------------------------------------------------------------
bool validate_printf_decl(const symbol_t &func, return_type_t rt, bool is_extern);

//-----------------------------------------------------------------------------
treenode_t *process_printf_call(symbol_t *printf, treenode_t *args, int line);

//-----------------------------------------------------------------------------
void build_print_functions(symbol_t *printf, symtab_t &gsyms);

//-----------------------------------------------------------------------------
struct printf_arg_t
{
  int type;
#define PF_ARG_STR    0
#define PF_ARG_INT    1
#define PF_ARG_CHAR   2
  const treenode_t *node;
  printf_arg_t(int _type, const treenode_t *_node)
    : type(_type), node(_node) {}
};

typedef std::vector<printf_arg_t> printf_args_t;

//-----------------------------------------------------------------------------
enum printf_res_t
{
  PRINTF_OK,
  PRINTF_NOARGS,
  PRINTF_STRCON,
  PRINTF_NUMARGS,
  PRINTF_BADARG,
};
