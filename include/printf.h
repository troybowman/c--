#include <vector>
#include <parser.h>

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
bool validate_printf_decl(const symbol_t &func, primitive_t rt, bool is_extern);

//-----------------------------------------------------------------------------
treenode_t *process_printf_call(symref_t printf, treenode_t *args, int line);

//-----------------------------------------------------------------------------
void build_print_functions(symref_t printf, symtab_t &gsyms);

//-----------------------------------------------------------------------------
struct format_arg_t
{
  symref_t func;
  const treenode_t *expr;

  format_arg_t(symref_t _func, const treenode_t *_expr)
    : func(_func), expr(_expr) {}
};

typedef std::vector<format_arg_t> format_args_t;
