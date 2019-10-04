#include "ir.h"
#include "treenode.h"
#include "logger.h"
#include "parser.h"

#define CNT_LOAD(sym)  (sym->base() == PRIM_INT ? CNT_LW : CNT_LB)
#define CNT_STORE(sym) (sym->base() == PRIM_INT ? CNT_SW : CNT_SB)

//-----------------------------------------------------------------------------
symref_t resource_manager_t::get_first_available()
{
  if ( _free.size() > 0 )
  {
    symref_t ret = _free.begin()->second;
    _free.erase(_free.begin());
    return ret;
  }
  return NULLREF;
}

//-----------------------------------------------------------------------------
void resource_manager_t::reset()
{
  _free.clear();
  resource_map_t::const_iterator i;
  for ( i = _used.begin(); i != _used.end(); i++ )
    free(i->second);
}

//-----------------------------------------------------------------------------
void resource_manager_t::get_used_resources(symvec_t &vec) const
{
  resource_map_t::const_iterator i;
  for ( i = _used.begin(); i != _used.end(); i++ )
    vec.push_back(i->second);
}

//-----------------------------------------------------------------------------
// manage available registers
class reg_manager_t : public resource_manager_t
{
  int _max;

public:
  reg_manager_t(symbol_type_t type, int max)
    : resource_manager_t(type), _max(max) {}

  virtual symref_t gen_resource()
  {
    symref_t ret = get_first_available();
    if ( ret == NULL && _cnt < _max )
      ret = symref_t(new symbol_t(_type, _cnt++));
    return ret;
  }
};

//-----------------------------------------------------------------------------
// manage stack resources
class stack_manager_t : public resource_manager_t
{
public:
  stack_manager_t(symbol_type_t type) : resource_manager_t(type) {}

  virtual symref_t gen_resource()
  {
    symref_t ret = get_first_available();
    if ( ret == NULL )
      ret = symref_t(new symbol_t(_type, _cnt++));
    return ret;
  }
};

//-----------------------------------------------------------------------------
// return address location and zero register
class fixed_resource_t : public resource_manager_t
{
  symref_t sym;

public:
  fixed_resource_t(symbol_type_t _type)
    : resource_manager_t(_type), sym(new symbol_t(_type)) {}

  virtual symref_t gen_resource() { return sym; }
};

//-----------------------------------------------------------------------------
ir_func_t::ir_func_t(symref_t s) : sym(s), code(NULL), has_call(false)
{
  store[ST_STKTEMP] = new stack_manager_t(ST_STKTEMP);
  store[ST_STKARG]  = new stack_manager_t(ST_STKARG);
  store[ST_TEMP]    = new reg_manager_t(ST_TEMP,   TEMPREGQTY);
  store[ST_SVTEMP]  = new reg_manager_t(ST_SVTEMP, SVREGQTY);
  store[ST_REGARG]  = new reg_manager_t(ST_REGARG, ARGREGQTY);
  store[ST_RETVAL]  = new reg_manager_t(ST_RETVAL, 1);
  store[ST_RETADDR] = new fixed_resource_t(ST_RETADDR);
  store[ST_ZERO]    = new fixed_resource_t(ST_ZERO);
}

//-----------------------------------------------------------------------------
ir_func_t::~ir_func_t()
{
  delete code;
  resource_store_t::iterator i;
  for ( i = store.begin(); i != store.end(); i++ )
    delete i->second;
}

//-----------------------------------------------------------------------------
static bool has_call(const treenode_t *tree)
{
  if ( tree == NULL )
    return false;
  if ( tree->type() == TNT_CALL )
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
    case TNT_SHL:   return CNT_SLLV;
    case TNT_SHR:   return CNT_SRLV;
    case TNT_XOR:   return CNT_XOR;
    case TNT_BAND:  return CNT_AND;
    case TNT_BOR:   return CNT_OR;
    case TNT_BNOT:  return CNT_NOT;
    case TNT_PEQ:   return CNT_ADD;
    case TNT_MEQ:   return CNT_SUB;
    case TNT_TEQ:   return CNT_MUL;
    case TNT_DEQ:   return CNT_DIV;
    case TNT_AEQ:   return CNT_AND;
    case TNT_OEQ:   return CNT_OR;
    case TNT_XEQ:   return CNT_XOR;
    default:
      INTERR(1081);
  }
}

//-----------------------------------------------------------------------------
void ir_engine_t::check_dest(symref_t sym)
{
  if ( sym == NULL )
    return;

  switch ( sym->type() )
  {
    case ST_TEMP:
    case ST_SVTEMP:
    case ST_REGARG:
    case ST_STKARG:
    case ST_STKTEMP:
    case ST_RETVAL:
      f->use(sym);
      break;
    case ST_RETADDR:
    case ST_ZERO:
      INTERR(1082);
    default:
      break;
  }
}

//-----------------------------------------------------------------------------
void ir_engine_t::check_src(symref_t sym)
{
  if ( sym == NULL )
    return;

  switch ( sym->type() )
  {
    case ST_TEMP:
    case ST_SVTEMP:
    case ST_STKTEMP:
    case ST_RETVAL:
      f->free(sym);
      break;
    case ST_LABEL:
      sym->set_val(lblcnt++);
      ir->labels.push_back(sym);
      break;
    case ST_REGARG:
    case ST_STKARG:
    case ST_RETADDR:
      INTERR(1079);
    default:
      break;
  }
}

//-----------------------------------------------------------------------------
symref_t ir_engine_t::gen_temp(tree_ctx_t::flags_t flags)
{
  symref_t temp;

  if ( (flags & TCTX_SAVE) == 0 )
  {
    // use a temporary
    temp = f->gen_resource(ST_TEMP);
    // use a saved reg if no temps left
    if ( temp == NULL )
      temp = f->gen_resource(ST_SVTEMP);
  }
  else
  {
    // this temp must persist across a function call
    temp = f->gen_resource(ST_SVTEMP);
  }

  // if all else fails, use the stack
  if ( temp == NULL )
    temp = f->gen_resource(ST_STKTEMP);

  ASSERT(1110, temp != NULL);
  return temp;
}

//-----------------------------------------------------------------------------
symref_t ir_engine_t::gen_argloc()
{
  symref_t argloc = f->gen_resource(ST_REGARG);

  if ( argloc == NULL )
    argloc = f->gen_resource(ST_STKARG);

  ASSERT(1111, argloc != NULL);
  return argloc;
}

//-----------------------------------------------------------------------------
void ir_engine_t::append(
    codenode_type_t type,
    symref_t dest,
    symref_t src1,
    symref_t src2)
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
symref_t ir_engine_t::generate(const treenode_t *tree, tree_ctx_t ctx)
{
  if ( tree == NULL )
    return NULLREF;

  switch ( tree->type() )
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
        symref_t dest = gen_temp(ctx.flags);
        symref_t src1 = tree->type() == TNT_CHARCON
                      ? symref_t(new symbol_t(ST_CHARCON, tree->str()))
                      : symref_t(new symbol_t(ST_INTCON, tree->val()));
        append(CNT_LI, dest, src1);
        return dest;
      }
    case TNT_STRCON:
      {
        std::string key(tree->str());

        symref_t str = ir->strings.get(key);
        if ( str == NULL )
        {
          str = symref_t(new symbol_t(ST_STRCON, tree->str()));
          ir->strings.insert(key, str);
        }

        symref_t dest = gen_temp(ctx.flags);
        append(CNT_LEA, dest, str);

        return dest;
      }
    case TNT_ASSG:
      {
        treenode_t *rhs = tree->children[RHS];
        treenode_t *lhs = tree->children[LHS];

        symref_t src1 = generate(rhs, has_call(lhs) ? TCTX_SAVE : 0);
        symref_t dest = generate(lhs, TCTX_LVAL);

        append(CNT_STORE(lhs->sym()), dest, src1);
        break;
      }
    case TNT_PEQ:
    case TNT_MEQ:
    case TNT_TEQ:
    case TNT_DEQ:
    case TNT_AEQ:
    case TNT_OEQ:
    case TNT_XEQ:
      {
        treenode_t *rhs = tree->children[RHS];
        treenode_t *lhs = tree->children[LHS];

        symref_t src1 = generate(lhs, has_call(rhs) ? TCTX_SAVE : 0);
        symref_t src2 = generate(rhs);
        symref_t temp = gen_temp();

        append(tnt2cnt(tree->type()), temp, src1, src2);

        symref_t dest = generate(lhs, TCTX_LVAL);
        append(CNT_STORE(lhs->sym()), dest, temp);

        break;
      }
    case TNT_SYMBOL:
      {
        symref_t sym = tree->sym();
        if ( (ctx.flags & TCTX_LVAL) != 0 )
          return sym;

        symref_t dest = gen_temp(ctx.flags);
        append(sym->is_array() ? CNT_LEA : CNT_LOAD(sym), dest, sym);

        return dest;
      }
    case TNT_ARRAY_LOOKUP:
      {
        treenode_t *idxtree = tree->children[AL_OFFSET];
        symref_t off = generate(idxtree);

        if ( tree->sym()->base() == PRIM_INT )
        {
          // multiply by sizeof(int)
          symref_t m_off = gen_temp();
          append(CNT_SLL, m_off, off, symref_t(new symbol_t(ST_INTCON, WORDSIZE/2)));
          off = m_off;
        }

        symref_t base = gen_temp();
        append(CNT_LEA, base, tree->sym());

        symref_t dest;
        if ( (ctx.flags & TCTX_LVAL) != 0 )
        {
          dest = gen_temp();
          append(CNT_ADD, dest, base, off);
        }
        else
        {
          symref_t loc = gen_temp();
          append(CNT_ADD, loc, base, off);
          dest = gen_temp(ctx.flags);
          append(CNT_LOAD(tree->sym()), dest, loc);
        }
        return dest;
      }
    case TNT_CALL:
      {
        f->set_has_call();

        symvec_t argvals;
        symvec_t arglocs;

        for ( const_tree_iterator_t ti(tree->children[CALL_ARGS]); *ti != NULL; ti++ )
          argvals.push_back(generate(*ti, has_call(ti.next()) ? TCTX_SAVE : 0));

        for ( size_t i = 0; i < argvals.size(); i++ )
          arglocs.push_back(gen_argloc());

        symvec_t::reverse_iterator val = argvals.rbegin();
        symvec_t::reverse_iterator loc = arglocs.rbegin();

        for ( ; val != argvals.rend() && loc != arglocs.rend(); val++, loc++ )
          append(CNT_ARG, *loc, *val);

        f->reset(ST_REGARG);
        f->reset(ST_STKARG);

        symref_t sym = tree->sym();
        if ( sym->base() != PRIM_VOID )
        {
          symref_t retval = f->gen_resource(ST_RETVAL);
          append(CNT_CALL, retval, sym);

          symref_t temp = gen_temp(ctx.flags);
          append(CNT_MOV, temp, retval);

          return temp;
        }

        append(CNT_CALL, NULLREF, sym);
        break;
      }
    case TNT_RET:
      {
        symref_t val = generate(tree->children[RET_EXPR]);
        if ( val != NULL )
          append(CNT_RET, f->gen_resource(ST_RETVAL), val);
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
    case TNT_SHL:
    case TNT_SHR:
    case TNT_BAND:
    case TNT_BOR:
    case TNT_XOR:
      {
        treenode_t *lhs = tree->children[LHS];
        treenode_t *rhs = tree->children[RHS];

        symref_t src1 = generate(lhs, has_call(rhs) ? TCTX_SAVE : 0);
        symref_t src2 = generate(rhs);
        symref_t dest = gen_temp(ctx.flags);

        append(tnt2cnt(tree->type()), dest, src1, src2);
        return dest;
      }
    case TNT_IF:
      {
        symref_t endif;
        symref_t cond_target;

        if ( (ctx.flags & TCTX_IF) != 0 )
          endif = ctx.endif;
        else
          endif = symref_t(new symbol_t(ST_LABEL));

        treenode_t *elsetree = tree->children[IF_ELSE];
        if ( elsetree == NULL )
          cond_target = endif;
        else
          cond_target = symref_t(new symbol_t(ST_LABEL));

        symref_t cond = generate(tree->children[IF_COND]);
        append(CNT_CNDJMP, cond_target, cond);

        tree_ctx_t ifctx(endif);
        generate(tree->children[IF_BODY], ifctx);

        if ( elsetree != NULL )
        {
          append(CNT_JUMP, endif);
          append(CNT_LABEL, NULLREF, cond_target);
          generate(elsetree, ifctx);
        }

        if ( (ctx.flags & TCTX_IF) == 0 )
          append(CNT_LABEL, NULLREF, endif);

        break;
      }
    case TNT_FOR:
      {
        generate(tree->children[FOR_INIT]);

        symref_t check(new symbol_t(ST_LABEL));
        append(CNT_LABEL, NULLREF, check);

        symref_t cond = generate(tree->children[FOR_COND]);
        if ( cond == NULL )
        { // if the for loop has an empty condition, assume it's true (just like gcc)
          cond = gen_temp();
          append(CNT_LI, cond, symref_t(new symbol_t(ST_INTCON, 1)));
        }

        symref_t end(new symbol_t(ST_LABEL));
        append(CNT_CNDJMP, end, cond);

        generate(tree->children[FOR_BODY]);
        generate(tree->children[FOR_INC]);
        append(CNT_JUMP, check);

        append(CNT_LABEL, NULLREF, end);
        break;
      }
    case TNT_WHILE:
      {
        symref_t loop(new symbol_t(ST_LABEL));
        append(CNT_LABEL, NULLREF, loop);

        symref_t cond = generate(tree->children[WHILE_COND]);
        symref_t end(new symbol_t(ST_LABEL));
        append(CNT_CNDJMP, end, cond);

        generate(tree->children[WHILE_BODY]);
        append(CNT_JUMP, loop);

        append(CNT_LABEL, NULLREF, end);
        break;
      }
    case TNT_PRINTF:
      {
        generate(tree->children[PRINTF_TREE]);
        break;
      }
    case TNT_NEG:
    case TNT_NOT:
    case TNT_BNOT:
      {
        symref_t val = generate(tree->children[RHS]);
        symref_t no  = gen_temp(ctx.flags);

        if ( tree->type() == TNT_NEG )
          append(CNT_SUB, no, f->gen_resource(ST_ZERO), val);
        else if ( tree->type () == TNT_NOT )
          append(CNT_XOR, no, val, symref_t(new symbol_t(ST_INTCON, 1)));
        else
          append(CNT_NOT, no, val);

        return no;
      }
    default:
      INTERR(1059);
  }

  f->reset(ST_TEMP);
  f->reset(ST_SVTEMP);
  f->reset(ST_STKTEMP);
  f->reset(ST_RETVAL);

  return NULLREF;
}

//-----------------------------------------------------------------------------
void ir_engine_t::start(const treenode_t *root)
{
  generate(root);
  f->code = head;
}

//-----------------------------------------------------------------------------
void generate_ir(ir_t *out, parse_results_t &pres)
{
  out->gsyms.swap(pres.gsyms);

  for ( size_t i = 0, size = pres.trees.size(); i < size; i++ )
  {
    const stx_tree_t &st = *pres.trees[i];
    ir_func_t *f = new ir_func_t(st.sym);

    ir_engine_t e(f, out);
    e.start(st.root);

    out->funcs.push_back(f);
  }
}
