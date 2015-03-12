#ifndef RESOURCE_H
#define RESOURCE_H

#include <symbol.h>
#include <messages.h>

#define TEMPREGQTY 7
#define SVREGQTY   8
#define ARGREGQTY  4

//-----------------------------------------------------------------------------
class resource_manager_t
{
protected:
  symbol_type_t _type;
  int _cnt;

  typedef std::map<int, symbol_t *> rmap_t;
  rmap_t _free;
  rmap_t _used;

  symbol_t *get_first_available()
  {
    if ( _free.size() > 0 )
    {
      symbol_t *ret = _free.begin()->second;
      _free.erase(_free.begin());
      return ret;
    }
    return NULL;
  }

public:
  resource_manager_t(symbol_type_t type) : _type(type), _cnt(0) {}

  void free(symbol_t *s) { _free[s->val()] = s; }
  void use(symbol_t *s)  { _used[s->val()] = s; }

  virtual symbol_t *gen_resource() = 0;

  int count() const { return _used.size(); }

  void reset()
  {
    _free.clear();
    rmap_t::const_iterator i;
    for ( i = _used.begin(); i != _used.end(); i++ )
      free(i->second);
  }

  void get_used_resources(symvec_t &vec) const
  {
    rmap_t::const_iterator i;
    for ( i = _used.begin(); i != _used.end(); i++ )
      vec.push_back(i->second);
  }
};

//-----------------------------------------------------------------------------
class reg_manager_t : public resource_manager_t
{
  int _max;

public:
  reg_manager_t(symbol_type_t type, int max)
    : resource_manager_t(type), _max(max) {}

  virtual symbol_t *gen_resource()
  {
    symbol_t *ret = get_first_available();
    if ( ret == NULL && _cnt < _max )
      ret = new symbol_t(_type, _cnt++);
    return ret;
  }
};

//-----------------------------------------------------------------------------
class temp_manager_t : public reg_manager_t
{
public:
  temp_manager_t() : reg_manager_t(ST_TEMPORARY, TEMPREGQTY) {}
};

//-----------------------------------------------------------------------------
class svreg_manager_t : public reg_manager_t
{
public:
  svreg_manager_t() : reg_manager_t(ST_SAVED_TEMPORARY, SVREGQTY) {}
};

//-----------------------------------------------------------------------------
class argreg_manager_t : public reg_manager_t
{
public:
  argreg_manager_t() : reg_manager_t(ST_REG_ARGUMENT, ARGREGQTY) {}
};

//-----------------------------------------------------------------------------
class stack_manager_t : public resource_manager_t
{
public:
  stack_manager_t(symbol_type_t type) : resource_manager_t(type) {}

  virtual symbol_t *gen_resource()
  {
    symbol_t *ret = get_first_available();
    if ( ret == NULL )
      ret = new symbol_t(_type, _cnt++);
    return ret;
  }
};

//-----------------------------------------------------------------------------
class stktemp_manager_t : public stack_manager_t
{
public:
  stktemp_manager_t() : stack_manager_t(ST_STACK_TEMPORARY) {}
};

//-----------------------------------------------------------------------------
class stkarg_manager_t : public stack_manager_t
{
public:
  stkarg_manager_t() : stack_manager_t(ST_STACK_ARGUMENT) {}
};

//-----------------------------------------------------------------------------
class ra_manager_t : public resource_manager_t
{
  symbol_t *ra;

public:
  ra_manager_t() : resource_manager_t(ST_RETADDR)
    { ra = new symbol_t(_type); }

  virtual symbol_t *gen_resource() { return ra; }
};

//-----------------------------------------------------------------------------
class retval_manager_t : public reg_manager_t
{
public:
  retval_manager_t() : reg_manager_t(ST_RETVAL, 1) {}
};

#endif // RESOURCE_H
