#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<stdbool.h>

// add new symbol
// 

typedef enum Type { FUNC, INT_TYPE, CHAR_TYPE, INT_ARRAY, CHAR_ARRAY, VOID_TYPE, BOOL, ERROR, UNDECLARED, LT, GT, LEQ, GET, NOT, AND_EXP, OR_EXP, PLUS, IF_EXP, WHILE_EXP, MINUS, DIV, TIMES, RETURN_EXP, FUNC_CALL, ARRAY_LOOKUP, EQ, NE, ASSG, SYMBOL, STMT, FOR_EXP } Type;

typedef enum CodeType { ENTER, ASSIGN, VAR, INT_VAL, STR_VAL, PRO_CALL, LEAVE } CodeType;

typedef struct CodeNode {
    CodeType codeType;
    struct Symbol* src1;
    struct Symbol* src2;
    struct Symbol* dest;
    struct CodeNode* next;
    struct CodeNode* previous;
} CodeNode;

struct param {
    char* type;
    struct param* next;    
};

typedef struct VarWrapper {
    char* varName;
    int isArray;
    enum Type wrapperType;
    struct VarWrapper* next;
} VarWrapper;

typedef struct FuncWrapper {
    char* id;
    struct ParamWrapper* params;
    struct FuncWrapper* next;
} FuncWrapper;
 
typedef struct ParamWrapper {
   enum Type type;
   int isArray;
   char* id;
   struct ParamWrapper* next;
} ParamWrapper;

typedef struct ArgType {
    enum Type type;
    struct ArgType* next;
} ArgType;

typedef struct ReturnCheck {
    enum Type type;
    struct ReturnCheck* next;
} ReturnCheck;

typedef struct Symbol {
    char* id;
    int tmpVal;
    enum Type type;
    
    // used only for functions:
    // bool isVoid;
    enum Type returnType;
    int isExtern;
    int isDefined;
    struct ParamWrapper* params;
    struct Symbol* next;
} Symbol;

typedef struct TreeNode {
    int val;
    char* str;
    struct Symbol* symbol;
    enum Type type;
    enum Type returnType;
    struct TreeNode* next;
    struct TreeNode* paramList;
    struct TreeNode* children[4];
    Symbol* place;
    CodeNode* code;
    //int lineNumber;
} TreeNode;

// prototypes 
void addToTable( int isGlobal, char* id, enum Type type );
struct Symbol* declared( const char* id );
struct Symbol* declaredE( char* id );
struct VarWrapper* newWrapper( char* name, int isArray );
void addToTableA( int isGlobal, enum Type type, char* id);
void addToTableM( int isGlobal, VarWrapper* list, enum Type type );
void resetWrappers( VarWrapper* table );
void addToTableF( int isGlobal, struct Symbol* toAdd );
struct Symbol* newSymbol( int isExtern, enum Type type, char* id, ParamWrapper* paramList );
struct ParamWrapper* newParamWrapper(int isArray, enum Type type, char* id );
struct FuncWrapper* newFuncWrapper( char* id, struct ParamWrapper* params );
void addToTableFM( int isGlobal, int isExtern, enum Type returnType, struct FuncWrapper* funcs ); 
void checkFunction(enum Type type, char* id, ParamWrapper* paramList );
void checkTable( Symbol* table );
void addLocalParams( VarWrapper* var, enum Type type );
int checkArguments( Symbol* symbol, TreeNode* list );
struct ReturnCheck* newReturnCheck( TreeNode* expr );
void checkReturns( Symbol* func, ReturnCheck* list );
struct TreeNode* exprCheck( enum Type type, TreeNode* leftOp, TreeNode* rightOp );
struct Symbol* declaredL( char* id );
struct ArgType* newArgType( enum Type type );
struct TreeNode* newTreeNode( enum Type, TreeNode* left, TreeNode* lm, TreeNode* rm, TreeNode* right );
int checkIndex( TreeNode* node );
int assgCheck( TreeNode* expr );
int condCheck( TreeNode* expr );
void insertStmt( TreeNode** tree, TreeNode* node );
void insertFunc( TreeNode** ptr, TreeNode* func );
void printTree( TreeNode* tree );
