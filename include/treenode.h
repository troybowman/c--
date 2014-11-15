struct treenode_t;

enum treenode_type_t
{
  TNT_EMPTY,
};

struct treenode_t
{
  treenode_type_t type;
  treenode_t(treenode_type_t _type) : type(_type) {}
};

