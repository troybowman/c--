#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<stdbool.h>

// add new symbol
// 

typedef enum Type { FUNC, INT_TYPE, CHAR_TYPE, INT_ARRAY, CHAR_ARRAY, VOID_TYPE, BOOL, ERROR, UNDECLARED, LT, GT, LEQ, GET, NOT, AND_EXP, OR_EXP, PLUS, IF_EXP, WHILE_EXP, MINUS, DIV, TIMES, RETURN_EXP, FUNC_CALL, ARRAY_LOOKUP, EQ, NE, ASSG, SYMBOL, STMT, FOR_EXP, NEG, INT_CONSTANT } Type;

typedef enum CodeType { ENTER, ASSIGN, VAR, INT_VAL, CHAR_VAL, STR_VAL, PRO_CALL, LEAVE, PLUS_GEN, LT_GEN, IF_EVAL, ELSE_LABEL, END_LABEL, J_END_LABEL, RETURN_GEN, FOR_BEGIN, FOR_EVAL, FOR_END, MINUS_GEN, NEG_GEN, TIMES_GEN, WHILE_EVAL, WHILE_END, AND_GEN, OR_GEN, EQ_GEN, NE_GEN, GT_GEN, GET_GEN, LEQ_GEN, DIV_GEN, WHILE_BEGIN, EXPR_ASSIGN, SP_ASG } CodeType;

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
    int size;
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
   struct ParamWrapper* prev;
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
    int stackSpace;
    // used only for functions:
    // bool isVoid;
    int lookup;
    int usedByProc;
    int offset;
    int paramOffset;
    char* tmpChar;
    char* tmpString;
    enum Type returnType;
    int isExtern;
    int isDefined;
    int charArrayLookup;
    struct ParamWrapper* params;
    struct Symbol* next;
    struct Symbol* prev;
} Symbol;

typedef struct TreeNode {
    int val;
    char* str;
    struct Symbol* symbol;
    enum Type type;
    int charArrayLookup;
    enum Type returnType; 
    struct TreeNode* next;
    //struct TreeNode* prev;
    struct TreeNode* paramList;
    struct TreeNode* children[4];
    char* tmpString;
    int offset;
    int lookup;
    int paramOffset;
    char* tmpChar;
    Symbol* place;
    CodeNode* code;
    //int lineNumber;
} TreeNode;

// prototypes 
void addToTable( int isGlobal, char* id, enum Type type, int size );
struct Symbol* declared( const char* id );
struct Symbol* declaredE( char* id );
struct VarWrapper* newWrapper( char* name, int isArray, int size );
void addToTableA( int isGlobal, enum Type type, char* id, int size );
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
void localData( enum Type type, VarWrapper* var );
struct Symbol* newLabel( char* id, enum Type type, int size );
Symbol* newParamPlace( Symbol* list, Symbol* toAdd );
int codeGenParams( Symbol* list, ParamWrapper* types );
void codeGenLHS( Symbol* dest, Type type );
Type  codeGenRHS( Symbol* src2 );
void setUpData( void );
int calculateExprSpace(CodeNode** node, int localStack);
void plusGen( Symbol* src1, Symbol* src2, Symbol* dest );
void loadOperand( Symbol* operand, int reg );
ParamWrapper* reverse( ParamWrapper* list );
char* newIfLabel(void);
char* newEndLabel(void);
char* newForLabel(void);
char* newWhileLabel(void);
void assgGen(Symbol* thing);
