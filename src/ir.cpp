#include <ir.h>
#include <treenode.h>
#include <logger.h>

#define CNT_LOAD(sym)  (sym->base() == PRIM_INT ? CNT_LW : CNT_LB)
#define CNT_STORE(sym) (sym->base() == PRIM_INT ? CNT_SW : CNT_SB)

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
      f.temps.use(sym);
      break;
    case ST_SVTEMP:
      f.svregs.use(sym);
      break;
    case ST_REGARG:
      f.regargs.use(sym);
      break;
    case ST_STKARG:
      f.stkargs.use(sym);
      break;
    case ST_STKTEMP:
      f.stktemps.use(sym);
      break;
    case ST_RETVAL:
      f.retval.use(sym);
      break;
    case ST_RETADDR:
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
      f.temps.free(sym);
      break;
    case ST_SVTEMP:
      f.svregs.free(sym);
      break;
    case ST_STKTEMP:
      f.stktemps.free(sym);
      break;
    case ST_RETVAL:
      f.retval.free(sym);
      break;
    case ST_LABEL:
      sym->set_val(lblcnt++);
      ir.labels.push_back(sym);
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
symref_t ir_engine_t::gen_temp(uint32_t flags)
{
  symref_t temp;

  if ( (flags & TCTX_SAVE) == 0 )
  {
    // use a temporary
    temp = f.temps.gen_resource();
    // use a saved reg if no temps left
    if ( temp == NULL )
      temp = f.svregs.gen_resource();
  }
  else
  {
    // this temp must persist across a function call
    temp = f.svregs.gen_resource();
  }

  // if all else fails, use the stack
  if ( temp == NULL )
    temp = f.stktemps.gen_resource();

  ASSERT(1110, temp != NULL);
  return temp;
}

//-----------------------------------------------------------------------------
symref_t ir_engine_t::gen_argloc()
{
  symref_t argloc = f.regargs.gen_resource();

  if ( argloc == NULL )
    argloc = f.stkargs.gen_resource();

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
        symref_t str = ir.strings.get(key);
        if ( str == NULL )
        {
          str = symref_t(new symbol_t(ST_STRCON, tree->str()));
          ir.strings.insert(key, str);
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
        symref_t idx = generate(idxtree);

        symref_t off;
        if ( tree->sym()->base() == PRIM_INT )
        {
          // multiply by sizeof(int)
          off = gen_temp();
          append(CNT_SLL, off, idx, symref_t(new symbol_t(ST_INTCON, WORDSIZE/2)));
        }
        else
        {
          off = idx;
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
        if ( !f.has_call )
        {
          f.has_call = true;
          f.ra.use(f.ra.gen_resource());
        }

        symvec_t argvals;
        symvec_t arglocs;

        for ( const_tree_iterator_t ti(tree->children[CALL_ARGS]); *ti != NULL; ti++ )
        {
          symref_t argval = generate(*ti, has_call(ti.next()) ? TCTX_SAVE : 0);
          argvals.push_back(argval);
        }

        for ( size_t i = 0; i < argvals.size(); i++ )
          arglocs.push_back(gen_argloc());

        symvec_t::reverse_iterator val = argvals.rbegin();
        symvec_t::reverse_iterator loc = arglocs.rbegin();

        for ( ; val != argvals.rend() && loc != arglocs.rend(); val++, loc++ )
          append(CNT_ARG, *loc, *val);

        f.regargs.reset();
        f.stkargs.reset();

        symref_t sym = tree->sym();
        if ( sym->base() != PRIM_VOID )
        {
          symref_t retval = f.retval.gen_resource();
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
          append(CNT_RET, f.retval.gen_resource(), val);
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
        {
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
      {
        symref_t val = generate(tree->children[RHS]);
        symref_t neg = gen_temp(ctx.flags);
        append(CNT_SUB, neg, f.zero, val);
        return neg;
      }
    case TNT_NOT:
    case TNT_BNOT:
      {
        symref_t val = generate(tree->children[RHS]);
        symref_t no  = gen_temp(ctx.flags);
        if ( tree->type () == TNT_NOT )
          append(CNT_XOR, no, val, symref_t(new symbol_t(ST_INTCON, 1)));
        else
          append(CNT_NOT, no, val);
        return no;
      }
    default:
      INTERR(1059);
  }

  f.temps.reset();
  f.svregs.reset();
  f.stktemps.reset();
  f.retval.reset();

  return NULLREF;
}

//-----------------------------------------------------------------------------
void ir_engine_t::start(const treenode_t *root)
{
  generate(root);
  f.code = head;
}

//-----------------------------------------------------------------------------
void generate_ir(ir_t &ir, const stx_trees_t &trees)
{
  stx_trees_t::const_iterator i;
  for ( i = trees.begin(); i != trees.end(); i++ )
  {
    const stx_tree_t &st = **i;
    ir_func_t *f = new ir_func_t(st.sym);

    ir_engine_t e(*f, ir);
    e.start(st.root);

    ir.funcs.push_back(f);
  }
}
