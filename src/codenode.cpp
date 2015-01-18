#include <symbol.h>
#include <treenode.h>
#include <codenode.h>
#include <messages.h>

//-----------------------------------------------------------------------------
class resource_manager_t
{
  symbol_type_t _type;
  int _cnt;

  typedef std::map<int, symbol_t *> rmap_t;
  rmap_t _free;
  rmap_t _used;

public:
  resource_manager_t(symbol_type_t type)
    : _type(type), _cnt(0) {}

  symbol_t *gen_resource()
  {
    if ( _free.size() > 0 )
    {
      symbol_t *ret = _free.begin()->second;
      _free.erase(_free.begin());
      return ret;
    }
    else
    {
      return new symbol_t(_type, _cnt++);
    }
  }
  void free(symbol_t *s) { _free[s->val()] = s; }
  void used(symbol_t *s) { _used[s->val()] = s; }
  void reset()
  {
    _free.clear();
    rmap_t::iterator i;
    for ( i = _used.begin(); i != _used.end(); i++ )
      free(i->second);
  }
  void get_used(symlist_t &list)
  {
    for ( rmap_t::iterator i = _used.begin(); i != _used.end(); i++ )
      list.push_back(i->second);
  }
};

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

  resource_manager_t temps;
  resource_manager_t svtemps;
  resource_manager_t args;

  codenode_t *head;
  codenode_t *tail;

  int lblcnt;

private:
  void check_dest(symbol_t *src);
  void check_src(symbol_t *src);

  symbol_t *gen_temp(uint32_t flags = 0);

  void append(
      codenode_type_t type,
      symbol_t *dest = NULL,
      symbol_t *src1 = NULL,
      symbol_t *src2 = NULL);

  symbol_t *generate(const treenode_t *tree, tree_ctx_t ctx = tree_ctx_t());

public:
  codefunc_engine_t(codefunc_t &_cf, ir_t &_ir)
    : cf(_cf), ir(_ir),
      temps(ST_TEMPORARY),
      svtemps(ST_SAVED_TEMPORARY),
      args(ST_ARGUMENT),
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
      INTERR(0);
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
      temps.used(sym);
      break;
    case ST_SAVED_TEMPORARY:
      svtemps.used(sym);
      break;
    case ST_ARGUMENT:
      args.used(sym);
      break;
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
      temps.free(sym);
      break;
    case ST_SAVED_TEMPORARY:
      svtemps.free(sym);
      break;
    case ST_LABEL:
      sym->set_val(lblcnt++);
      ir.labels.push_back(sym);
      break;
    case ST_ARGUMENT:
      INTERR(1079);
    default:
      break;
  }
}

//-----------------------------------------------------------------------------
inline symbol_t *codefunc_engine_t::gen_temp(uint32_t flags)
{
  return (flags & TCTX_SAVE) != 0 ? svtemps.gen_resource() : temps.gen_resource();
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
        append(CNT_MOV, dest, src1);
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

        symbol_t *base = gen_temp();
        append(CNT_LEA, base, tree->sym, NULL);

        symbol_t *dest;
        if ( (ctx.flags & TCTX_LVAL) != 0 )
        {
          dest = gen_temp();
          append(CNT_ADD, dest, base, idx);
        }
        else
        {
          symbol_t *loc = gen_temp();
          append(CNT_ADD, loc, base, idx);
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
          cf.ra.push_back(new symbol_t(ST_RETADDR));
        }

        symlist_t argvals;
        symlist_t arglocs;

        tree_iterator_t ti(tree->children[CALL_ARGS]);

        for ( ; *ti != NULL; ti++ )
          argvals.push_back(generate(*ti));

        int size = argvals.size();
        for ( int i = 0; i < size; i++ )
          arglocs.push_back(args.gen_resource());

        symlist_t::reverse_iterator val = argvals.rbegin();
        symlist_t::reverse_iterator loc = arglocs.rbegin();

        for ( ; val != argvals.rend() && loc != arglocs.rend(); val++, loc++ )
          append(CNT_ARG, *loc, *val);

        args.reset();

        symbol_t *f = tree->sym;
        if ( f->rt() != RT_VOID )
        {
          append(CNT_CALL, &ir.retval, f);

          symbol_t *temp = gen_temp(ctx.flags);
          append(CNT_MOV, temp, &ir.retval);
          return temp;
        }

        append(CNT_CALL, NULL, f);
        break;
      }
    case TNT_RET:
      {
        symbol_t *val = generate(tree->children[RET_EXPR]);
        if ( val != NULL )
          append(CNT_RET, &ir.retval, val);
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
    default:
      INTERR(1059);
  }

  temps.reset();
  svtemps.reset();
  return NULL;
}

//-----------------------------------------------------------------------------
void codefunc_engine_t::start(const treenode_t *root)
{
  generate(root);
  cf.code = head;
  temps.get_used(cf.temps);
  svtemps.get_used(cf.svtemps);
  args.get_used(cf.args);
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
