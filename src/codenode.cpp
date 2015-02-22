#include <symbol.h>
#include <treenode.h>
#include <codenode.h>
#include <messages.h>

//-----------------------------------------------------------------------------
struct tree_ctx_t
{
  uint32_t flags;
#define TCTX_LVAL 0x1
#define TCTX_SAVE 0x2
#define TCTX_IF   0x4

  symbol_t *endif;

  tree_ctx_t(symbol_t *_endif) : flags(TCTX_IF), endif(_endif) {}
  tree_ctx_t(uint32_t _flags = 0) : flags(_flags), endif(NULL) {}
};

//-----------------------------------------------------------------------------
class codefunc_engine_t
{
  codefunc_t &cf;
  ir_t &ir;

  codenode_t *head;
  codenode_t *tail;

  int lblcnt;

private:
  void check_dest(symbol_t *src);
  void check_src(symbol_t *src);

  symbol_t *gen_temp(uint32_t flags = 0);
  symbol_t *gen_argloc();

  void append(
      codenode_type_t type,
      symbol_t *dest = NULL,
      symbol_t *src1 = NULL,
      symbol_t *src2 = NULL);

  symbol_t *generate(const treenode_t *tree, tree_ctx_t ctx = tree_ctx_t());

public:
  codefunc_engine_t(codefunc_t &_cf, ir_t &_ir)
    : cf(_cf), ir(_ir),
      head(NULL), tail(NULL),
      lblcnt(0) {}

  void start(const treenode_t *root);
};

//-----------------------------------------------------------------------------
#define CNT_LOAD(sym)  (sym->base() == PRIM_INT ? CNT_LW : CNT_LB)
#define CNT_STORE(sym) (sym->base() == PRIM_INT ? CNT_SW : CNT_SB)

//-----------------------------------------------------------------------------
static bool has_call(const treenode_t *tree)
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
      INTERR(1081);
  }
}

//-----------------------------------------------------------------------------
void codefunc_engine_t::check_dest(symbol_t *sym)
{
  if ( sym == NULL )
    return;

  switch ( sym->type() )
  {
    case ST_TEMPORARY:
      cf.temps.use(sym);
      break;
    case ST_SAVED_TEMPORARY:
      cf.svregs.use(sym);
      break;
    case ST_REG_ARGUMENT:
      cf.regargs.use(sym);
      break;
    case ST_STACK_ARGUMENT:
      cf.stkargs.use(sym);
      break;
    case ST_STACK_TEMPORARY:
      cf.stktemps.use(sym);
      break;
    case ST_RETVAL:
      cf.retval.use(sym);
      break;
    case ST_RETADDR:
      INTERR(1082);
    default:
      break;
  }
}

//-----------------------------------------------------------------------------
void codefunc_engine_t::check_src(symbol_t *sym)
{
  if ( sym == NULL )
    return;

  switch ( sym->type() )
  {
    case ST_TEMPORARY:
      cf.temps.free(sym);
      break;
    case ST_SAVED_TEMPORARY:
      cf.svregs.free(sym);
      break;
    case ST_STACK_TEMPORARY:
      cf.stktemps.free(sym);
      break;
    case ST_RETVAL:
      cf.retval.free(sym);
      break;
    case ST_LABEL:
      sym->set_val(lblcnt++);
      ir.labels.push_back(sym);
      break;
    case ST_REG_ARGUMENT:
    case ST_STACK_ARGUMENT:
    case ST_RETADDR:
      INTERR(1079);
    default:
      break;
  }
}

//-----------------------------------------------------------------------------
symbol_t *codefunc_engine_t::gen_temp(uint32_t flags)
{
  symbol_t *temp;

  if ( (flags & TCTX_SAVE) == 0 )
  {
    // use a temporary
    temp = cf.temps.gen_resource();
    // use a saved reg if no temps left
    if ( temp == NULL )
      temp = cf.svregs.gen_resource();
  }
  else
  {
    // this temp MUST persist across a function call
    temp = cf.svregs.gen_resource();
  }

  // if all else fails, use the stack
  if ( temp == NULL )
    temp = cf.stktemps.gen_resource();

  return temp;
}

//-----------------------------------------------------------------------------
symbol_t *codefunc_engine_t::gen_argloc()
{
  symbol_t *argloc = cf.regargs.gen_resource();
  if ( argloc == NULL )
    argloc = cf.stkargs.gen_resource();
  return argloc;
}

//-----------------------------------------------------------------------------
void codefunc_engine_t::append(
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
symbol_t *codefunc_engine_t::generate(const treenode_t *tree, tree_ctx_t ctx)
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
        append(CNT_LI, dest, src1);
        return dest;
      }
    case TNT_STRCON:
      {
        std::string key(tree->str);
        symbol_t *str = ir.strings.get(key);
        if ( str == NULL )
        {
          str = new symbol_t(ST_STRCON, tree->str);
          ir.strings.insert(key, str);
        }
        symbol_t *dest = gen_temp(ctx.flags);
        append(CNT_LEA, dest, str);
        return dest;
      }
    case TNT_ASSG:
      {
        treenode_t *rhs = tree->children[RHS];
        treenode_t *lhs = tree->children[LHS];

        symbol_t *src1 = generate(rhs, has_call(lhs) ? TCTX_SAVE : 0);
        symbol_t *dest = generate(lhs, TCTX_LVAL);

        append(CNT_STORE(lhs->sym), dest, src1);
        break;
      }
    case TNT_SYMBOL:
      {
        symbol_t *sym = tree->sym;
        if ( (ctx.flags & TCTX_LVAL) != 0 )
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

        symbol_t *off;
        if ( tree->sym->base() == PRIM_INT )
        {
          off = gen_temp();
          append(CNT_SLL, off, idx, new symbol_t(ST_INTCON, WORDSIZE/2));
        }
        else
        {
          off = idx;
        }

        symbol_t *base = gen_temp();
        append(CNT_LEA, base, tree->sym, NULL);

        symbol_t *dest;
        if ( (ctx.flags & TCTX_LVAL) != 0 )
        {
          dest = gen_temp();
          append(CNT_ADD, dest, base, off);
        }
        else
        {
          symbol_t *loc = gen_temp();
          append(CNT_ADD, loc, base, off);
          dest = gen_temp(ctx.flags);
          append(CNT_LOAD(tree->sym), dest, loc);
        }
        return dest;
      }
    case TNT_CALL:
      {
        if ( !cf.has_call )
        {
          cf.has_call = true;
          cf.ra.use(cf.ra.gen_resource());
        }

        symvec_t argvals;
        symvec_t arglocs;

        for ( tree_iterator_t ti(tree->children[CALL_ARGS]); *ti != NULL; ti++ )
          argvals.push_back(generate(*ti));

        int size = argvals.size();
        for ( int i = 0; i < size; i++ )
          arglocs.push_back(gen_argloc());

        symvec_t::reverse_iterator val = argvals.rbegin();
        symvec_t::reverse_iterator loc = arglocs.rbegin();

        for ( ; val != argvals.rend() && loc != arglocs.rend(); val++, loc++ )
          append(CNT_ARG, *loc, *val);

        cf.regargs.reset();
        cf.stkargs.reset();

        symbol_t *f = tree->sym;
        if ( f->rt() != RT_VOID )
        {
          symbol_t *retval = cf.retval.gen_resource();
          append(CNT_CALL, retval, f);

          symbol_t *temp = gen_temp(ctx.flags);
          append(CNT_MOV, temp, retval);

          return temp;
        }

        append(CNT_CALL, NULL, f);
        break;
      }
    case TNT_RET:
      {
        symbol_t *val = generate(tree->children[RET_EXPR]);
        if ( val != NULL )
          append(CNT_RET, cf.retval.gen_resource(), val);
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

        symbol_t *src1 = generate(lhs, has_call(rhs) ? TCTX_SAVE : 0);
        symbol_t *src2 = generate(rhs);
        symbol_t *dest = gen_temp(ctx.flags);

        append(tnt2cnt(tree->type), dest, src1, src2);
        return dest;
      }
    case TNT_IF:
      {
        symbol_t *endif;
        symbol_t *cond_target;

        if ( (ctx.flags & TCTX_IF) != 0 )
          endif = ctx.endif;
        else
          endif = new symbol_t(ST_LABEL);

        treenode_t *elsetree = tree->children[IF_ELSE];
        if ( elsetree == NULL )
          cond_target = endif;
        else
          cond_target = new symbol_t(ST_LABEL);

        symbol_t *cond = generate(tree->children[IF_COND]);
        append(CNT_CNDJMP, cond_target, cond);

        tree_ctx_t ifctx(endif);
        generate(tree->children[IF_BODY], ifctx);

        if ( elsetree != NULL )
        {
          append(CNT_JUMP, endif);
          append(CNT_LABEL, NULL, cond_target);
          generate(elsetree, ifctx);
        }

        if ( (ctx.flags & TCTX_IF) == 0 )
          append(CNT_LABEL, NULL, endif);
        break;
      }
    case TNT_FOR:
      {
        generate(tree->children[FOR_INIT]);

        symbol_t *check = new symbol_t(ST_LABEL);
        append(CNT_LABEL, NULL, check);

        symbol_t *cond = generate(tree->children[FOR_COND]);
        if ( cond == NULL )
        {
          cond = gen_temp();
          append(CNT_LI, cond, new symbol_t(ST_INTCON, 1));
        }

        symbol_t *end = new symbol_t(ST_LABEL);
        append(CNT_CNDJMP, end, cond);

        generate(tree->children[FOR_BODY]);
        generate(tree->children[FOR_INC]);
        append(CNT_JUMP, check);

        append(CNT_LABEL, NULL, end);
        break;
      }
    case TNT_WHILE:
      {
        symbol_t *loop = new symbol_t(ST_LABEL);
        append(CNT_LABEL, NULL, loop);

        symbol_t *cond = generate(tree->children[WHILE_COND]);
        symbol_t *end  = new symbol_t(ST_LABEL);
        append(CNT_CNDJMP, end, cond);

        generate(tree->children[WHILE_BODY]);
        append(CNT_JUMP, loop);

        append(CNT_LABEL, NULL, end);
        break;
      }
    case TNT_PRINTF:
      {
        generate(tree->children[PRINTF_TREE]);
        break;
      }
    default:
      INTERR(1059);
  }

  cf.temps.reset();
  cf.svregs.reset();
  cf.stktemps.reset();
  cf.retval.reset();

  return NULL;
}

//-----------------------------------------------------------------------------
void codefunc_engine_t::start(const treenode_t *root)
{
  generate(root);
  cf.code = head;
}

//-----------------------------------------------------------------------------
void generate_ir(ir_t &ir, const treefuncs_t &functions)
{
  treefuncs_t::const_iterator i;
  for ( i = functions.begin(); i != functions.end(); i++ )
  {
    treefunc_t tf = *i;
    codefunc_t *cf = new codefunc_t(tf.sym);

    codefunc_engine_t e(*cf, ir);
    e.start(tf.tree);

    ir.funcs.push_back(cf);
  }
}
