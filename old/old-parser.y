%{
#ifndef TABLE_H
  #define TABLE_H
  #include "table.h"
#endif
#ifndef TRAVERSAL_C
  #define TRAVERSAL_C
  #include "traversal.c"
#endif
  #include<stdio.h>
  #include<stdlib.h>
  #define YYDEBUG 1
  extern int yylineno;
  //extern void traverse( TreeNode* current );

  // global symbol table
  Symbol* gTable;
  
  // local symbol table
  Symbol* lTable;

  // current 
  Symbol* currTable = NULL;
  // handles multiple declarations on one line
  VarWrapper* decList = NULL;

  // handles function parameters
  ParamWrapper* paramList = NULL;

  // handles multiple prototypes on one line
  FuncWrapper* prototypes = NULL;
  
  // handles types of args passed to functions
  /*ArgType* argList = NULL;
  ArgType* tempList = NULL;*/
  TreeNode* argList = NULL;

  // the statement tree for string of stmts within functions
  TreeNode* stmtTree = NULL;

  // global syntax tree
  TreeNode* syntaxTree = NULL;
  
  // keeps track of return statements within functions
  ReturnCheck* returnList = NULL;
 
  int tableCheck = 0;
  // stores space needed for function code gen
  int stackSpace = 1;
  int paramSpace = -1;
  int exprSpace = 1; 
%}

%union {
    int con;
    char* id;
    enum Type type; 
    Symbol* list;
    VarWrapper* wrapper;
    ParamWrapper* pWrapper;
    FuncWrapper* fWrapper;
    ArgType* argType;
    ReturnCheck* rCheck;
    TreeNode* treeNode;
    char* stringCon;
    char* charCon;
}

%type <type> Type CHAR INT VOID Unary_Op
%type <wrapper> Var_Decl Mult_Decl
%type <id>  ID
%type <con> INT_CON 
%type <pWrapper> Parm_Types Mult_Types Params
%type <fWrapper> Mult_Params
/*%type <argType> ID_Expr Mult_Expr*/
%type <treeNode> Expr ID_Expr Mult_Expr Assg Stmt Mult_Stmt Func Func_Body Prog Op_Else For_Params Op_Assg Op_Expr
%type <charCon> CHAR_CON
%type <stringCon> STRING_CON
%start Prog

%token WHILE RETURN CHAR INT VOID EXTERN IF ELSE FOR EQUALS NOT_EQUAL LT_EQUAL GT_EQUAL
%token AND OR ID INT_CON CHAR_CON STRING_CON ERROR_TOKEN

%left OR
%left AND
%left EQUALS NOT_EQUAL
%left '<' LT_EQUAL '>' GT_EQUAL
%left '+' '-'
%left '*' '/'
%right UNARY

%%

Prog	    : Prog Dcl ';'
	    | Prog error ';'		{ yyerrok; }
	    | Prog Func			{ insertFunc(&syntaxTree, $2); $$ = syntaxTree; /*printf("---new func---\n"); printTree(syntaxTree);*/ }
	    | /* empty */		{ $$ = NULL }
	    ;

Dcl	    : Type Var_Decl Mult_Decl				{ addToTableM(1, $2, $1); 
								  if ( $3 != NULL ) {
									addToTableM(1, $3, $1); 
								  }
								  decList = NULL; 
								  $3 = NULL; /*resetWrappers(decList);*/ }
	    | EXTERN Type ID '(' Parm_Types ')' Mult_Params     { addToTableF(1, newSymbol(1, $2, $3, $5)); 
								  if ( $7 != NULL ) {
								      addToTableFM(1, 1, $2, $7);
								  }
								  prototypes = NULL;  }   
	    | Type ID '(' Parm_Types ')' Mult_Params		{ addToTableF(1, newSymbol(0, $1, $2, $4));
								  if ( $6 != NULL ) 
								      addToTableFM(1, 0, $1, $6);
								  prototypes = NULL;  }
	    | EXTERN VOID ID '(' Parm_Types ')' Mult_Params	{ addToTableF(1, newSymbol(1, $2, $3, $5));
								  if ( $7 != NULL )
								      addToTableFM(1, 1, $2, $7);
								  prototypes = NULL;  }
	    | VOID ID '(' Parm_Types ')' Mult_Params		{ addToTableF(1, newSymbol(0, $1, $2, $4));
								  if ( $6 != NULL )
								      addToTableFM(1, 0, $1, $6);
								  prototypes = NULL;  }
	    ;

Mult_Decl   : Mult_Decl ',' Var_Decl	       { $3->next = decList;
						 decList = $3; 
						 $$ = decList; } 
	    
	    | /* empty */ { $$ = NULL; }
            ;

Mult_Params : Mult_Params ',' ID '(' Parm_Types ')' { FuncWrapper* new = newFuncWrapper($3, $5); 
						      new->next = prototypes; 
						      prototypes = new; 
						      $$ = prototypes; }     
	    | /* empty */ { $$ = NULL; }
	    ;

Var_Decl    : ID '[' INT_CON ']'	{ /*if ( strcmp($1, "j") == 0 ) $1 = "_j";*/ $$ = newWrapper($1, 1, $3); /*stackSpace += $3*/ } 
	    | ID 			{ /*if ( strcmp($1, "j") == 0 ) $1 = "_j";*/ $$ = newWrapper($1, 0, 1); /*stackSpace += 1;*/ }
            ;
  
Type	    : CHAR	{ $$ = $1; }
	    | INT	{ $$ = $1; }
	    ;

Parm_Types  : VOID                          { $$ = NULL; } 
	    | Type ID '[' ']' Mult_Types    { ParamWrapper* new = newParamWrapper(1, $1, $2); 
					      new->next = $5; 
					      //if ( $5 != NULL ) {$5->prev = new;}
					      $$ = new; 
					      $5 = NULL; 
					      paramList = NULL; }
	    | Type ID Mult_Types 	    { 
						ParamWrapper* new = newParamWrapper(0, $1, $2);
						new->next = $3;
						//if ( $3 != NULL ) {$3->prev = new;} 
						$$ = new; $3 = NULL; 
						paramList = NULL; }
	    ;

Mult_Types  : Mult_Types ',' Type ID '[' ']'  { ParamWrapper* new = newParamWrapper(1, $3, $4); new->next = paramList; paramList = new; $$ = paramList; } 
	    | Mult_Types ',' Type ID 	      { ParamWrapper* new = newParamWrapper(0, $3, $4); new->next = paramList; paramList = new; $$ = paramList; }	
	    | /* empty */		      { $$ = NULL; }
	    ;

Func	    : Type ID Params { checkFunction($1, $2, $3); stackSpace = 1; paramSpace = -1; } Func_Body		{ checkReturns(declared($2), returnList); 
										  		  returnList = NULL; 
							  			  		  //printf("***local table***\n"); 
										  		  //checkTable( lTable );
												  Symbol* func = declared($2);
												  func->stackSpace = stackSpace;
										  		  $5->symbol = func;
										  		  $5->returnType = $1;
										  		  $$ = $5;
												  //localData(lTable);
										  		  lTable = NULL;
												  stackSpace = 0;
												  exprSpace = 0; 
										  		  /*checkTable( gTable )*/ }
	    | VOID ID Params { checkFunction($1, $2, $3); stackSpace = 1; paramSpace = -1; } Func_Body		{ checkReturns(declared($2), returnList); 
												  returnList = NULL;
												  //checkTable(lTable);
										  		  lTable = NULL;
												  Symbol* func = declared($2);
												  func->stackSpace = stackSpace;
										  		  $5->symbol = func;
										  		  $5->returnType = VOID_TYPE;
										  		  $$ = $5;
												  stackSpace = 0;
												  exprSpace = 0; }
	    | Type ID error Func_Body			{ yyerrok; }
	    | VOID ID error Func_Body			{ yyerrok; }
	    | Type ID Params error			{ yyerrok; }
	    | VOID ID Params error			{ yyerrok; }
	    ;

Func_Body   : '{' Func_Decls Mult_Stmt '}'		{ $$ = newTreeNode(FUNC, $3, NULL, NULL, NULL); stmtTree = NULL; }
	

Params	    : '(' Parm_Types ')'	{ $$ = $2; }
	    ;

Func_Decls  : Func_Decls Type Var_Decl Mult_Decl ';'		{ addToTableM(0, $3, $2);
								  if ( $4 != NULL ) {
								      addToTableM(0, $4, $2);
								  }
								  decList = NULL;
								  $4 = NULL; }
	    | Func_Decls Type error Mult_Decl ';'		{ yyerrok; }
	    | /* empty */
	    ;

Mult_Stmt   : Stmt Mult_Stmt			{ //printf("assg: %d, lc: %s, rc: %d\n", $2->type, $2->children[0]->symbol->id, $2->children[1]->val); 
						  /*$$ = $1; insertStmt(&stmtTree, $2);*/ insertStmt(&stmtTree, $1); $$ = stmtTree; }
	    | /* empty */			{ $$ = NULL; }
	    ;

Stmt	    : IF '(' Expr ')' Stmt Op_Else      { if ( !(condCheck($3)) ) {
					              $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
						      printf("Error, line %d: Invalid conditional expression.\n", yylineno);
						  }
						  else if ( condCheck($3) == ERROR )
						      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
						  else {
						      $$ = newTreeNode(IF_EXP, $3, $5, $6, NULL); 
						  } }
	    | WHILE '(' Expr ')' Stmt		{ if ( !(condCheck($3)) ) {
						      printf("Error, line %d: Invalid conditional statement.\n", yylineno);
						      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
						  }
						  else if ( condCheck($3) == ERROR )
						      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
						  else {
						      $$ = newTreeNode(WHILE_EXP, $3, $5, NULL, NULL);
						  } }
	    | FOR '(' For_Params ')' Stmt	{ if ( $3->type == ERROR ) 
						      $$ = $3;
						  else {
						      $3->children[3] = $5;
						      $$ = $3;
						  } }
	    | FOR '(' error ')' Stmt		{ yyerrok; }
	    | RETURN Op_Expr ';'	        { /*printf("%d\n", $2);*/ ReturnCheck* new = newReturnCheck($2);
						  new->next = returnList;
						  returnList = new;
						  $$ = newTreeNode(RETURN_EXP, $2, NULL, NULL, NULL); }	
	    | Assg ';' 				{ $$ = $1; }
	    | error ';' 			{ /*printf("assg error\n");*/ yyerrok; }
	    | ID '(' ID_Expr ')' ';'		{ Symbol* func = declared($1);
						  //printf("--------lst chance: %s\n", $3->symbol->id);
						  if ( func == NULL ) {
						      printf("Error, line %d: Function %s is not defined.\n", yylineno, $1);
						      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL); 
						  }
						  else {
						      if ( func->returnType != VOID_TYPE ) {
						          printf("Error, line %d: Function %s is called as a statement but does not have return type VOID.\n", yylineno, $1);
						          $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
						      }
						      else {
						          if( !(checkArguments(func, $3)) ) {
							      //printf("hhherrrrrreee\n"); 
							      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
						 	  else {
							      TreeNode* new = newTreeNode(FUNC_CALL, NULL, NULL, NULL, NULL);
							      new->returnType = func->returnType;
							      //TreeNode* ptr;
							      //for (ptr = $3; ptr != NULL; ptr = ptr->next) {
							        //  printf("param in %s: %d\n", func->id, ptr->type);
							     // }
							      new->paramList = $3;
							      new->symbol = func;
							      $$ = new;
							  }
						      }
						  }  }
	    | '{' Mult_Stmt '}'			 { $$ = $2; stmtTree = NULL; }
	    | ';'				 { $$ = NULL; }	
	    ;


Op_Else	    : ELSE Stmt		{ $$ = $2; }
	    | /* empty */	{ $$ = NULL; }
	    ;

For_Params  : Op_Assg ';' Op_Expr ';' Op_Assg { if ( $3 == NULL ) 
						    $$ = newTreeNode(FOR_EXP, $1, $3, $5, NULL);
						else if ( !(condCheck($3)) ) {
						    printf("Error, line %d: Invalid conditional expression.\n", yylineno);
						    $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
						}
						else
						    $$ = newTreeNode(FOR_EXP, $1, $3, $5, NULL); }
	    ;					

Op_Assg	    : Assg	  	{ $$ = $1 }
	    | /* empty */	{ $$ = NULL }
	    ;

Op_Expr	    : Expr 		{ $$ = $1 }
            | /* empty */	{ $$ = NULL }
	    ;

ID_Expr     : Expr Mult_Expr    { /*ArgType* new = newArgType($1); new->next = $2; $$ = new; $2 = NULL; argList = NULL;*/ 
				  $1->next = $2;
				  //if ( $2 != NULL ) {$2->prev = $1;}
				  //if ( $1 != NULL ) {
				    //  printf("---expr arg Tree---\n");
				      //printf("type: %d\n", $1->type);
				      //printf("symbol: %s\n", $1->symbol->id);
				 // }
				  //if ( $2 == NULL )
				    //  printf("only one param\n"); 
				  $$ = $1; 
				  $2 = NULL; 
				  argList = NULL; }
	    | /* empty */	{ $$ = NULL; }
	    ;

Mult_Expr   : Mult_Expr ',' Expr { /*ArgType* new = newArgType($3); new->next = argList; argList = new; $$ = argList;*/
				   $3->next = argList; /*if(argList != NULL) {argList->prev = $3;}*/ argList = $3; $$ = argList; }  
	    | /* empty */       { $$ = NULL; }
	    ;

Assg	    : ID '[' Expr ']' '=' Expr			{ Symbol* new = declaredE($1);
							  if ( $3->type == ERROR ) {
							      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else if ( new == NULL ) {
							     printf("Error, line %d: Variable %s has not been declared.\n", yylineno, $1);
							     $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else if ( new->type == UNDECLARED ) {
							     /* do nothing to avoid cascadng error statements */
							     $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else if ( new->type != CHAR_ARRAY && new->type != INT_ARRAY ) {
							     printf("Error, line %d: Variable %s is not an array: %d\n", yylineno, new->id, new->type);
							     $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else if ( !(checkIndex($3)) ) {
							     printf("Error, line %d: Expression for array index is not an integer.\n", yylineno);
							     $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else if ( !(assgCheck($6)) ) {
							     printf("Error, line %d: Incompatible operand types for assignment.\n", yylineno);
							     $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL); 
							     /* ignore it */
							  }
							  else if ( assgCheck($6) == ERROR ) 
							     $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  else {
							     TreeNode* var = newTreeNode(SYMBOL, NULL, NULL, NULL, $3);
							     new->lookup = $3->val;
							     var->lookup = $3->val;
							     var->symbol = new;
							     if ( !(new->usedByProc) && declaredL($1) && !(new->isDefined) ) {
								new->usedByProc = 1; 
								if ( new->type == CHAR_ARRAY ) {
								    int cs = new->stackSpace;
								    while ( cs%4 != 0 ) {
									cs++;
								    }
								    new->offset = cs + stackSpace - 1;
								    stackSpace += cs;
								}
								else {
								    new->offset = 4*(new->stackSpace) + stackSpace -1;
								    stackSpace += 4*(new->stackSpace);
								}
								//printf("variable size: %d\n", new->stackSpace);
								//stackSpace += new->stackSpace;
							     }
						             var->offset = new->offset;
							     $$ = newTreeNode(ASSG, var, $6, NULL, NULL); 
							  } }
	    | ID '=' Expr				{ Symbol* new = declaredE($1); /*checkTable(gTable); printf("print this\n");*/
                                                          if ( new == NULL ) {
                                                             printf("Error, line %d: Variable %s has not been declared.\n", yylineno, $1);
							     $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
						 	  else if ( new->type == UNDECLARED ) {
							     $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else if ( new->type == CHAR_ARRAY || new->type == INT_ARRAY ) {
							      printf("Error, line %d: Incompatible operand types for assignment.\n", yylineno);
							      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else if ( new->type == CHAR_TYPE || new->type == INT_TYPE ) {
                                                             if ( !(assgCheck($3)) /*$3 != CHAR_TYPE && $3 != INT_TYPE && $3 != ERROR*/ ) {
							         printf("Error, line %d: Incompatible operand types for assignment.\n", yylineno);
								 $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);	  
							     }
							     else if ( assgCheck($3) == ERROR )
								 $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							     else {
								 TreeNode* var = newTreeNode(SYMBOL, NULL, NULL, NULL, NULL);
								 //var->type = new->type;
								 var->symbol = new;
								 if ( !(new->usedByProc) && declaredL($1) && !(new->isDefined) ) {
								     new->usedByProc = 1;
								     new->offset = stackSpace;
								     //printf("offset for %s set to %d\n", new->id, stackSpace);
							             stackSpace += new->stackSpace;
								 }
								 if ( declaredL($1) ) {
								     var->offset = new->offset;
								     //printf("offset set for treenode with %s set to %d\n", new->id, var->offset); 
								 }
								 $$ = newTreeNode(ASSG, var, $3, NULL, NULL);
							     } 
							  }
							  else {
                                                              $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							      printf("Error, line %d: Incompatible operand types for assignment.\n", yylineno);
    							  } /*checkTable(gTable);*/ }
	    ;

Expr	    : Expr '+' Expr				{ $$ = exprCheck(PLUS, $1, $3); }
	    | Expr '-' Expr				{ $$ = exprCheck(MINUS, $1, $3); }
	    | Expr '*' Expr				{ $$ = exprCheck(TIMES, $1, $3); }
	    | Expr '/' Expr				{ $$ = exprCheck(DIV, $1, $3); }
	    | Expr EQUALS Expr				{ $$ = exprCheck(EQ, $1, $3); }
	    | Expr NOT_EQUAL Expr			{ $$ = exprCheck(NE, $1, $3); }
	    | Expr LT_EQUAL Expr			{ $$ = exprCheck(LEQ, $1, $3); }
	    | Expr '<' Expr				{ $$ = exprCheck(LT, $1, $3); }
	    | Expr GT_EQUAL Expr			{ $$ = exprCheck(GET, $1, $3); }
	    | Expr '>' Expr			        { $$ = exprCheck(GT, $1, $3); }		
	    | Expr AND Expr				{ $$ = exprCheck(AND_EXP, $1, $3); }
	    | Expr OR Expr 				{ $$ = exprCheck(OR_EXP, $1, $3); }
	    | Unary_Op ID '[' Expr ']' 		        { //printf("rule matched, %s: %d\n", $2, $4); 
							  if ( $4->type == ERROR )
							      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  else if ( !(checkIndex($4)) /*$4 != CHAR_TYPE && $4 != INT_TYPE*/ ) {
							      printf("Error, line %d: Expression for array index is not an integer.\n", yylineno);
							      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else {
							  Symbol* array = declaredE($2);
							  if ( array == NULL ) {
						 	      printf("Error, line %d: variable %s not declared.\n", yylineno, $2);
							      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else if ( array->type == UNDECLARED ) {
							      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else { 
							      if ( $1 == 5 || $1 == NEG ) {
							          TreeNode* new = newTreeNode(ARRAY_LOOKUP, NULL, NULL, NULL, $4);
								  new->lookup = $4->val;
								  //array->lookup = $3->val; 
								  new->symbol = array;
								  //new->symbolType = array->type;
								  if ( !(array->usedByProc) && declaredL($2) && !(array->isDefined) ) {
								      array->usedByProc = 1;
								      if ( array->type == CHAR_ARRAY ) {
									  int cs = array->stackSpace;
									  while ( cs%4 != 0 ) {
									      cs++;
									  }
									  array->offset = stackSpace + cs;
								      	  stackSpace += cs;
								      } 
								      else  {
								          array->offset = 4*(array->stackSpace) + stackSpace;
								          stackSpace += 4*(array->stackSpace);
								      } //printf("variable stackSpace: %d\n", array->stackSpace); 
								      //stackSpace += array->stackSpace;
								  }
								  if ( declaredL($2) ) {
								      new->offset = array->offset;
								  } 
								  if ( array->type == CHAR_ARRAY )
								      new->charArrayLookup = 1;
								  else
								      new->charArrayLookup = 2;
								  if ( $1 == NEG ) {
								      TreeNode* neg = newTreeNode(NEG, new, NULL, NULL, NULL);
								      $$ = neg;
								  }
								  else 
								      $$ = new;
							      }
							      else {
								  printf("Error, line %d: incompatible boolean operand.\n", yylineno);
								  $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);	
						              }  	  /*$$ = declared($2)->type;*/
						  	  } 
							  } }		
	    | Unary_Op ID '(' ID_Expr ')'		{ Symbol* func = declaredE($2);
							  if ( func == NULL ) {
							     printf("Error: function %s has not been defined.\n", $2);
							     /* note: this allows functions that have not been formally defined(i.e. with curly braces) to still be called */
							     $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else if ( func->type == UNDECLARED ) {
							     //printf(" this is bad....\n");
							     $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
						   	  } else  {
							      if ( func->returnType == VOID_TYPE ) {
								  printf("Error, line %d: Function %s called within expression but has return type void.\n", yylineno, $2);
							          $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);	
							      } else {
								  if ( $1 == 5 || $1 == NEG ) { 
								      TreeNode* new = newTreeNode(FUNC_CALL, NULL, NULL, NULL, NULL);
								      new->returnType = func->returnType;
								      new->symbol = func;
							  	      if ( !(checkArguments(func, $4)) ) {
									  //printf(" come onnnnnnn-------\n");
							                  $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
								      }
								      else { 
									  new->paramList = $4;
									  if ( $1 == NEG ) {
									      TreeNode* neg = newTreeNode(NEG, new, NULL, NULL, NULL);
									      $$ = neg;
									  }
									  else 
			              				              $$ = new;
								      }
								  }
								  else {
							              
								      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
								      printf("Error, line %d: incompatible boolean operand.\n", yylineno);
								  }
									
										
							      }	   
							  } } 
	    | Unary_Op ID				{ Symbol* id = declaredE($2); //printf("%s: type: %d\n", id->id, id->type);
							  //printf("found symbol: %s\n", id->id);
							  if ( id == NULL ) {
							      printf("Error, line %d: Variable %s not declared.\n", yylineno, $2);
							      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  } 
							  else if ( id->type == UNDECLARED ) {
							      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  }
							  else { 
							      if ( $1 == 5 || $1 == NEG ) {
								  TreeNode* new = newTreeNode(SYMBOL, NULL, NULL, NULL, NULL);
							          new->symbol = id;  
								  if ( !(id->usedByProc) && declaredL($2) && !(id->isDefined) ) {
								      id->usedByProc = 1;
								      id->offset = stackSpace;
								      stackSpace += 4*(id->stackSpace);
								  }
								  if ( declaredL($2) ) {
								      new->offset = id->offset;
								  }
								  new->lookup = 0;
								  if ( $1 == NEG ) {
								      TreeNode* neg = newTreeNode(NEG, new, NULL, NULL, NULL);
								      $$ = neg;
								  }
								  else
								      $$ = new;
								  //printf("made a symbol tree node\n");
								  //printf("symbol: %s\n", new->symbol->id);
							      }
							      else {
							     	  printf("Error, line %d: incompatible boolean operand.\n", yylineno);
								  $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							      }
							  } }
	    | Unary_Op '(' Expr ')' %prec UNARY		{ if ( $1 == 5 || $1 == NEG ) {
							      if ( $1 == NEG ) {
								  TreeNode* neg = newTreeNode(NEG, $3, NULL, NULL, NULL);
								  $$ = neg;
							      } 
							      else
							          $$ = $3; 
							  } else { 
							      if ( $3->type == OR_EXP || $3->type == AND_EXP || $3->type == GT || $3->type == LT || $3->type == LEQ
									|| $3->type == GET || $3->type == NOT ) 
							          $$ = newTreeNode(NOT, NULL, $3, NULL, NULL);
							      else if ( $3->type == ERROR ) 
							 	  $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							      else {
								  printf("Error, line %d: incompatible boolean operand.\n", yylineno);
								  $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							      } 
							  } }
	    | Unary_Op INT_CON %prec UNARY		{ if ( $1 == 5 || $1 == NEG ) { 
							      TreeNode* new = newTreeNode(INT_TYPE, NULL, NULL, NULL, NULL);
							      new->val = $2;
							      if ( $1 == NEG ) {
								  TreeNode* neg = newTreeNode(NEG, new, NULL, NULL, NULL);
								  $$ = neg;
							      }
							      else
							          $$ = new; 
							  } else { 
							      printf("Error, line %d: incompatible boolean operand.\n", yylineno); 
							      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL); 
							  } }
	    | error Unary_Op INT_CON %prec UNARY	{ yyerrok; /*printf("intcon expr error\n");*/ }
	    | Unary_Op CHAR_CON %prec UNARY		{ if ( $1 == 5 || $1 == NEG ) { 
							      TreeNode* new = newTreeNode(CHAR_TYPE, NULL, NULL, NULL, NULL); 
							      new->tmpChar = $2;
							      if ( $1 == NEG ) {
								  TreeNode* neg = newTreeNode(NEG, new, NULL, NULL, NULL);
								  $$ = neg;
							      }
							      else 
							          $$ = new;
							  } else { 
							      printf("Error, line %d: incompatible boolean operand.\n", yylineno); 
						              $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  } }
	    | error Unary_Op CHAR_CON %prec UNARY	{ yyerrok; /*printf("charcon expr error\n");*/ }
	    | Unary_Op STRING_CON %prec UNARY           { if ( $1 == 5 ) { 
							      TreeNode* new = newTreeNode(CHAR_ARRAY, NULL, NULL, NULL, NULL);
							      new->tmpString = $2;
							      $$ = new;
							  } else { 
							      printf("Error, line %d: incompatible boolean operand.\n", yylineno); 
							      $$ = newTreeNode(ERROR, NULL, NULL, NULL, NULL);
							  } }
	    | error Unary_Op STRING_CON %prec UNARY	{ yyerrok; /*printf("stringcon expr error\n");*/ }
	    ;

Unary_Op    : Unary_Op '!' { $$ = BOOL; } 
	    | Unary_Op '-' { $$ = NEG; }
	    | /* empty */  { $$ = 5; }
	    ;

%%

int main ( void ) {
    yydebug = 0;
    printf("# code generation start\n");
    printf(".data\n");
    yyparse();
    //printf("before traverse\n");
    //checkTable(gTable);
    //printf("this far");
    traverse(syntaxTree);
    //checkTable(gTable);
    generateCode(syntaxTree->code);
    //printCode(syntaxTree->code);
    return 0;
}

int yyerror( char *s ) {
    fprintf(stderr, "%s, line %d\n", s, yylineno);
    return 1;
}

void addLocalParams(VarWrapper* var, enum Type type ) {
    if ( var == NULL )
	return;
    Symbol* p;
    for (; var != NULL; var = var->next ) {
    	for ( p = lTable; p != NULL; p = p->next ) {
    	    if ( strcmp(var->varName, p->id) == 0 ) {
		printf("Error, line %d: multiple parameters with same name\n", yylineno);
		return;
	    }
	}
	struct Symbol* new = (struct Symbol*)malloc(sizeof(struct Symbol));
	new->id = var->varName;
        if ( var->isArray && type == CHAR_TYPE )
	    new->type = CHAR_ARRAY;
	else if ( type == CHAR_ARRAY ) {
	    new->type = CHAR_ARRAY;
	}
	else if ( var->isArray == 0 && type == CHAR_TYPE )
	    new->type = CHAR_TYPE;
	else if ( var->isArray == 0 && type == INT_TYPE )
	    new->type = INT_TYPE;
	else
	    new->type = INT_ARRAY;
	//new->stackSpace = size;
	new->isDefined = 1;
	new->offset = paramSpace;
	paramSpace--;
	new->next = lTable;
	lTable = new;
    }
}

// add new symbol to a given table
void addToTable ( int isGlobal, char* id, enum Type type, int size ) {
    if ( isGlobal ){
	if ( declared(id) ) {
	printf("Error, line %d: Variable %s is declared twice.\n", yylineno, id);
	return;
    }
    }
    else {
	if ( declaredL(id) ) {
	    printf("Error, line %d: Variable %s is declared twice.\n", yylineno, id);
  	    return;
	}
    }
    //printf("heloooooo\n");
    struct Symbol* newSymbol = (struct Symbol *)malloc(sizeof(struct Symbol));
    newSymbol->id = id;
    newSymbol->stackSpace = size;
    newSymbol->type = type;
    newSymbol->next = currTable;
    currTable = newSymbol;
    //newSymbol->offset = 
    if ( isGlobal == 1 ) {
        currTable->next = gTable;
	gTable = currTable;
    }
    else {
	currTable->next = lTable;
	lTable = currTable;
	// add to global for code gen
	//struct Symbol* new = newLabel(id, newSymbol->type, size); //(struct Symbol *)malloc(sizeof(struct Symbol));
	//new->next = gTable;
	//gTable = new;
    }
    currTable = NULL;
    //if ( table )
      //  printf("table not empty: %s\n", table->id);
    //printf("added to table: %s, type: %d\n", newSymbol->id, newSymbol->type);
} // end function addToTable

// adds array declaration to symbol table
void addToTableA( int isGlobal, enum Type type, char* id, int size ) {
    if ( isGlobal ) {
	if ( declared(id) ) {
        printf("Error, line %d: Variable %s declared twice\n", yylineno, id);
        return;
    }
    }
    else {
	if ( declaredL(id) ) {
	    printf("Error, line %d: Variable %s declared twice.\n", yylineno, id);
	    return;
        }
    }
    struct Symbol* newSymbol = (struct Symbol *)malloc(sizeof(struct Symbol));
    newSymbol->id = id;
    if ( type == CHAR_TYPE )
	newSymbol->type = CHAR_ARRAY;
    else if ( type == INT_TYPE )
	newSymbol->type = INT_ARRAY;  
    newSymbol->stackSpace = size;
    newSymbol->next = currTable;
    currTable = newSymbol;
    if ( isGlobal ) {
        currTable->next = gTable;
	gTable = currTable;
    }
    else {
	currTable->next = lTable;
	lTable = currTable;
	// add to global table for when we generate mips code
	//struct Symbol* new= newLabel(id, newSymbol->type, size); //(struct Symbol *)malloc(sizeof(struct Symbol));
	//new->next = gTable;
	//gTable = new;
    }
    currTable = NULL;
    //printf("added to table: %s, type: %d\n", newSymbol->id, newSymbol->type);
} // end function addToTable

void addToTableM( int isGlobal, VarWrapper* list, enum Type type ) {
    //printf("made it to add\n");
    //Symbol* t;
    //printf("inside addto tableM: ");
    //currTable = gTable;
    //for ( t = currTable; t != NULL; t = t->next ) {
	//printf("%s, ", t->id);
    //}
    //printf("\n");

    VarWrapper* p;
    for ( p = list; p != NULL; p = p->next ) {
	//printf("%s\n", p->varName);
       // printf("adding var to table: id: %s,   isArray: %d\n", p->varName, p->isArray);
        //printf("-------\n");
	if ( p->isArray == 0 ) {
            //printf("this should print\n");
	    addToTable(isGlobal, p->varName, type, list->size);
	    //printf("okay so far\n");
	}
        else
	    addToTableA(isGlobal, type, p->varName, list->size);
    }
}



void addToTableF( int isGlobal, Symbol* toAdd ) {
   
   if ( declared(toAdd->id) ) {
       printf("Error, line %d: Multiple definitions of function %s.\n", yylineno, toAdd->id);
       return;
   }
   toAdd->next = currTable;
   currTable = toAdd;
   //printf("FUNC added to table: %s, return type: %d, isExtern: %d\n", toAdd->id, toAdd->returnType, toAdd->isExtern);
   ParamWrapper* p;
   //printf("%s's param list: ", toAdd->id);
   for ( p = toAdd->params; p != NULL; p = p->next ) {
 	//printf("%d isArray: %d, ", p->type, p->isArray);
   } 
   //printf("\n");
   if ( isGlobal ) {
	currTable->next = gTable;
	gTable = currTable;
   }
   else {
	currTable->next = lTable;
	lTable = currTable;
   }
   currTable = NULL;
}

void addToTableFM( int isGlobal, int isExtern, enum Type returnType, FuncWrapper* funcs ) {
    FuncWrapper* p;
    for ( p = funcs; p != NULL; p = p->next ) {
	if ( declared(p->id) ) {
	    printf("Error, line %d: Multiple definitions of function %s\n", yylineno, p->id);
	return;
	}
        Symbol* new = newSymbol(isExtern, returnType, p->id, p->params);
 	new->next = currTable;
	currTable = new;
    }
    if ( isGlobal ) {
	currTable->next = gTable;
	gTable = currTable;
    }
    else {
	currTable->next = lTable;
	lTable = currTable;
    }
    currTable = NULL;
}

void checkTable( Symbol* table ) {
   //printf("check table call");
   //if ( table == NULL )
	//printf("null table\n");
   if ( tableCheck >= 0 ) {
    printf("TABLE START:\n");
    for ( ; table != NULL; table = table->next ) {
	printf("Symbol: %s\n", table->id);
	if ( table->id == NULL )
	    printf("wtf\n");
	printf("Type: %d\n", table->type);
	if ( table->tmpVal != 0 )
	    printf("tmpVal: %d\n", table->tmpVal);
	printf("stack space: %d\n", table->stackSpace);
	if ( table->returnType != 0 )
	    printf("Return type: %d\n", table->returnType);
	if ( table->tmpChar != NULL )
	    printf("tmp char: %s\n", table->tmpChar);
	if ( table->tmpString != NULL )
	    printf("tmp string: %s\n", table->tmpString);
	printf("Is Extern: %d\n", table->isExtern);
	if ( table->params != NULL ) {
	printf("Parameters: ");
	ParamWrapper* par;
	for ( par = table->params; par != NULL; par = par->next ) {
	    printf("type: %d isArray: %d || ", par->type, par->isArray);
	}
	}
        printf("\n--------------");
	printf("\n");
    }    
   }
    tableCheck++;
}

struct FuncWrapper* newFuncWrapper( char* id, struct ParamWrapper* params ) {
    struct FuncWrapper* new = (struct FuncWrapper *)malloc(sizeof(struct FuncWrapper)); 
    new->id = id;
    new->params = params;
    return new;
}

// check if symbol has already been declared
struct Symbol* declared( const char* id) {
    struct Symbol* p;
    for ( p = lTable; p != NULL; p = p->next ) {
        //printf("%s, ", p->id); 
        if ( strcmp(p->id, id) == 0 )
            return p;
    }
    for ( p = gTable; p != NULL; p = p->next) {
	if ( strcmp(p->id, id) == 0 )
	    return p;
    }
    // handle undeclared vaiables by putting them into table with "UNDECLARED" type
    //p = (Symbol*)malloc(sizeof(Symbol));
    //p->type = UNDECLARED;
    //p->next = gTable;
    //gTable = p;
    return NULL;
    //printf("\n");
    //return NULL;

} // end function declared              

struct Symbol* declaredE( char* id) {
    struct Symbol* p;
    for ( p = lTable; p != NULL; p = p->next ) {
        //printf("%s, ", p->id); 
        if ( strcmp(p->id, id) == 0 )
            return p;
    }
    for ( p = gTable; p != NULL; p = p->next) {
	if ( strcmp(p->id, id) == 0 )
	    return p;
    }
    // handle undeclared vaiables by putting them into table with "UNDECLARED" type
    p = (Symbol*)malloc(sizeof(Symbol));
    p->id = id;
    p->type = UNDECLARED;
    p->next = gTable;
    gTable = p;
    return NULL;
    //printf("\n");
    //return NULL;
}

struct Symbol* declaredL( char* id ) {
    struct Symbol* p;
    for ( p = lTable; p != NULL; p = p->next ) {
        //printf("%s, ", p->id); 
        if ( strcmp(p->id, id) == 0 )
            return p;
    }
    return NULL;
}

void checkFunction(enum Type type, char* id, ParamWrapper* paramList ) {
    //printf("checking function %s...\n", id);
    Symbol* check = declared(id);
    if ( check == NULL ) {
	Symbol* f = newSymbol(0, type, id, paramList);
        f->isDefined = 1;
	//f->params = paramList;
	//if ( paramList == NULL )
	addToTableF(1, f);
        //printf("function %s added to global table\n", id);
	for (; paramList != NULL; paramList = paramList->next ) {
            //printf("paramter added to local table: %s, type: %d\n.", paramList->id, paramList->type);
	    addLocalParams(newWrapper(paramList->id, paramList->isArray, 1), paramList->type);
	    //addToTableM(0, newWrapper(paramList->id, paramList->isArray), paramList->type);
	    //printf("parameter within %s: %s, type: %d, isArray: %d\n", id, paramList->id, paramList->type, paramList->isArray);
	}
	return;
    }
    if ( check->type != FUNC ) {
	printf("Error, line %d: variable %s is declared twice.\n", yylineno, id);
        return;
    }
    //printf("%d\n", check->isExtern);
    if ( check->isExtern ) {
	printf("Error: cannot have formal defintion of external function %s.\n", id);
	return;
    }
    if ( check->returnType != type ) {
	printf("Error: conflicting Definitions for function %s\n", id);
	return;
    }
    if ( check->isDefined == 1 ) {
	printf("Error: multiple definitions of function %s\n", id);
	//return;
    }
    check->isDefined = 1;
    ParamWrapper* p1 = check->params;
    ParamWrapper* p2 = paramList;
    //printf("param check for %s:\n", id);
    if ( (p1 == NULL && p2 != NULL) || (p1 != NULL && p2 == NULL) ) {
	printf("Error: conflicting parameter types for function %s\n", id);
	while ( p1 != NULL || p2 != NULL ) {
	    if ( p2 != NULL )
	        addLocalParams(newWrapper(p2->id, p2->isArray, 1), p2->type);
	    if ( p1 != NULL )
	        p1 = p1->next;
	    if ( p2 != NULL )
	        p2 = p2->next;
	}
	return;
    }
    while ( p1 != NULL && p2 != NULL ) {
	//printf("type within table: %d, within new definition: %d\n", p1->type, p2->type);
	//printf("is array in table: %d, is array in new definition: %d\n", p1->isArray, p2->isArray);
	if ( p1->type != p2->type ) {
            //printf("%s: %d, %s: %d.\n", p1->id, p1->type, p2->id, p2->type);
	    printf("Error: parameter %s has conflicting type for definition of function %s\n", p2->id, id);
	    //return;
	}
	else if ( p1->isArray != p2->isArray ) {
	    printf("Error: parameter %s has conflicting type for definition of function %s\n", p2->id, id);
	    //return;
	}
	//printf("adding args to local table...\n");
	addLocalParams(newWrapper(p2->id, p2->isArray, 1), p2->type); 
	p1 = p1->next;
	p2 = p2->next; 
    }
    if ( p2 != p1 ) {
	//if ( p2->next != NULL ) {
	  //  printf("Error, parameter %s conflicts with definiton of function %s.\n", p2->next->id, id);
            //addToTableM(0, newWrapper(p2->id, p2->isArray), p2->type);
	    //return;
        //}
	printf("Error: conflicting number of parameters in definition of function %s\n", id);
	return;
    }
    //printf("function %s defined correctly\n", id);
}

    

struct Symbol* newSymbol( int isExtern, enum Type type, char* id, ParamWrapper* paramList ) {
    struct Symbol* new = (struct Symbol *)malloc(sizeof(struct Symbol));
    new->id = id;
    new->type = FUNC;
    new->isExtern = isExtern;
    new->params = paramList;
    new->returnType = type;
    new->next = NULL;
    return new;
}

struct VarWrapper* newWrapper( char* name, int isArray, int size ) {
    VarWrapper* new = (VarWrapper *)malloc(sizeof(VarWrapper));
    new->varName = name;
    new->isArray = isArray;
    new->size = size;
    return new;
}

struct ParamWrapper* newParamWrapper( int isArray, enum Type type, char* id ) {
    ParamWrapper* new = (ParamWrapper *)malloc(sizeof(ParamWrapper));
    new->isArray = isArray;
    if ( type == CHAR_TYPE && isArray )
	new->type = CHAR_ARRAY;
    else if ( type == CHAR_TYPE && isArray == 0 )
	new->type = CHAR_TYPE;
    else if ( type == INT_TYPE && isArray )
	new->type = INT_ARRAY;
    else if ( type == INT_TYPE && isArray == 0 )
	new->type = INT_TYPE;
    else 
    	new->type = type;
    new->id = id;
    return new;
}

int checkArguments( Symbol* symbol, TreeNode* list ) {
   //if ( symbol == NULL )
	//return;
   //printf("in check params--> param: %s, type: %d\n", list->symbol->id, list->symbol->type);
   
   if ( (list == NULL && symbol->params != NULL) || (list != NULL && symbol->params == NULL) ) {
	printf("Error, line %d: Invalid number of arguments for function %s.\n", yylineno, symbol->id);
	return 0;
   }
   ParamWrapper* p = symbol->params;
   while ( list != NULL && p != NULL ) {
	
	switch ( list->type ) {
	    case INT_TYPE:
	    case CHAR_TYPE:
	    case NEG:
		if ( p->type == CHAR_TYPE || p->type == INT_TYPE ) {
		    /* do nothing, types are compatible */
		}
		else {
		    printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
                    return 0;
		}
		break;
	    case INT_ARRAY:
	        if ( p->type != INT_ARRAY ) {
		    printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
		    return 0;
		}
		break;
	    case CHAR_ARRAY:
		if ( p->type != CHAR_ARRAY ) {
		    printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
		    return 0;
		}
		break;
	    case SYMBOL:
		switch ( list->symbol->type ) {
		    case INT_TYPE:
		    case CHAR_TYPE:
			if ( p->type == CHAR_TYPE || p->type == INT_TYPE ) {
                    	    /* do nothing, types are compatible */
                   	}
                	else {
                    	    printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
                            return 0;
                	}
                        break;
		    case CHAR_ARRAY:
			if ( p->type != CHAR_ARRAY ) {
			    printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
			    return 0;
			}
			break;
		    case INT_ARRAY:
			if ( p->type != INT_ARRAY ) {
			    printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
			    return 0;
			}
			break;
		    default:
			return 0;
		}
		break;
	    case FUNC_CALL:
	        switch ( list->returnType ) {
		    case INT_TYPE:
		    case CHAR_TYPE:
			if ( p->type != CHAR_TYPE && p->type != INT_TYPE ) {
			    printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
			    return 0;
			}
			break; 
		    case VOID_TYPE:
			if ( p->type != VOID_TYPE ) {
			    printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
			    return 0;
			}
			break;
		    default:
			break;
		}
		break;
	    case MINUS:
	    case PLUS:
	    case DIV:
	    case TIMES:
	        if ( p->type != CHAR_TYPE && p->type != INT_TYPE ) {
		    printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
		    return 0;
		}
		break;
	    case UNDECLARED:
	    case ERROR:
		if ( 1 ) {
		    /* do nothing */
		}
		break;
	    case ARRAY_LOOKUP:
		if ( p->type != CHAR_TYPE && p->type != INT_TYPE ) {
		    printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
                    return 0;
                }
                break;
	    default:
		printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
		return 0;
	}

        /*
	if ( (list->type == CHAR_TYPE || list->type == INT_TYPE) && (p->type == CHAR_TYPE || p->type == INT_TYPE) ) {
	    // do nothing, types are compatible 
	}
        else {
	    if ( list->type != p->type && list->type != UNDECLARED ) {
	        printf("Error, line %d: Incompatible argument types for function %s.\n", yylineno, symbol->id);
		return 0;
	    }
	}
	*/
	p = p->next;
	list = list->next;
	
   }
   if ( p != NULL || list != NULL ) {
	printf("Error, line %d: Invalid number of arguments for function %s.\n", yylineno, symbol->id);
	return 0;
   }
   return 1;
   
}

void checkReturns( Symbol* func, ReturnCheck* list ) {
  //  printf("in check returns\n");
    //printf("return type for %s: %d\n", func->id, func->returnType);
    //if ( func == NULL )
//	printf("func is null\n");
//	return;
    //printf("in return check: %d\n", list->type);
    if ( func->returnType != VOID_TYPE ) {
	if ( list == NULL )
	    printf("Error, line %d: function %s must contain a return statement that returns a value\n", yylineno, func->id);
        for(; list != NULL; list = list->next ) {
	    //printf("%d\n", list->type);
	    if ( list->type == CHAR_TYPE || list->type == INT_TYPE || list->type == ERROR ) {
	        /* types match under int/char compatibility */
	    }
	    else 
	        printf("Error, line %d: conflicting types for return statement in function %s.\n", yylineno, func->id);
	}
    }
    else {
	//printf("func returns void\n");
	for(; list != NULL; list = list->next ) {
	    if ( list->type != VOID_TYPE )
	        printf("Error, line %d: conflicting types for return statement in function %s.\n", yylineno, func->id);
	}
    }
}

TreeNode* exprCheck( enum Type type, TreeNode* leftOp, TreeNode* rightOp ) {
    
    switch ( type ) {
        case PLUS:
	case MINUS:
	case DIV:
	case TIMES:
	case EQ:
	case NE:
	case LT:
	case GT:
	case LEQ:
	case GET:
	    switch ( leftOp->type ) {
		case PLUS:
		case MINUS:
		case DIV:
		case TIMES:
		case CHAR_TYPE:
		case INT_TYPE:
		case ARRAY_LOOKUP:
		case FUNC_CALL:
		case NEG:
		    break;
		case SYMBOL:
		    switch ( leftOp->symbol->type ) {
			case INT_TYPE:
			case CHAR_TYPE:
			    break;
			case UNDECLARED:
			    return newTreeNode(ERROR, NULL, NULL, NULL, NULL);
			default:
			    printf("Error, line %d: Incompatible operand types.\n", yylineno);
			    return newTreeNode(ERROR, NULL, NULL, NULL, NULL);
		    }
		    break;
		case UNDECLARED:
		case ERROR:
	            return newTreeNode(ERROR, NULL, NULL, NULL, NULL);
		    break;
		default:
		    printf("Error, line %d: Incompatible operand types.\n", yylineno);
		    return newTreeNode(ERROR, NULL, NULL, NULL, NULL);	
	    }
	    switch ( rightOp->type ) {
		case PLUS:
		case MINUS:
		case DIV:
		case TIMES:
		case CHAR_TYPE:
		case INT_TYPE:
		case ARRAY_LOOKUP:
		case FUNC_CALL:
		case NEG:
		    break;
		case SYMBOL:
		    switch ( rightOp->symbol->type ) {
			case INT_TYPE:
			case CHAR_TYPE:
			    break;
			case UNDECLARED:
			    return newTreeNode(ERROR, NULL, NULL, NULL, NULL);
			default:
			    printf("Error, line %d: Incompatible operand types.\n", yylineno);
			    return newTreeNode(ERROR, NULL, NULL, NULL, NULL);
		    }
		    break;
		case UNDECLARED:
		case ERROR:
		    return newTreeNode(ERROR, NULL, NULL, NULL, NULL);
		    break;
		default:
		    printf("Error, line %d: Incompatible operand types.\n", yylineno);
		    return newTreeNode(ERROR, NULL, NULL, NULL, NULL);	
	    }
	    break;
	case AND_EXP:
	case OR_EXP:
	case NOT:
	    switch ( leftOp->type ) {
		case AND_EXP:
		case OR_EXP:
		case NOT:
		case LT:
		case GT:
		case LEQ:
		case GET:
		case EQ:
		case NE:
		    break;
		case UNDECLARED:
		case ERROR:
		    return newTreeNode(ERROR, NULL, NULL, NULL, NULL);
		    break;
		default:
		    printf("Error, line %d: Incompatible operand types.\n", yylineno);
		    return newTreeNode(ERROR, NULL, NULL, NULL, NULL);	
	    }
	    switch ( rightOp->type ) {
		case AND_EXP:
		case OR_EXP:
		case NOT:
		case LT:
		case GT:
		case LEQ:
		case GET:
		case NE:
		case EQ:
		    break;
		case UNDECLARED:
		case ERROR:
		    return newTreeNode(ERROR, NULL, NULL, NULL, NULL);
		    break;
		default:
		    printf("Error, line %d: Incompatible operand types.\n", yylineno);
		    return newTreeNode(ERROR, NULL, NULL, NULL, NULL);	
	    }
	default: 
	    break;
    }
    TreeNode* node = newTreeNode(type, leftOp, NULL, NULL, rightOp);
    node->offset = exprSpace;
    //stackSpace++;
    exprSpace++;
    return node;
}

struct ReturnCheck* newReturnCheck ( TreeNode* expr ) {
    ReturnCheck* new = (ReturnCheck *)malloc(sizeof(ReturnCheck));
    if ( expr == NULL ) {
	new->type = VOID_TYPE;
	return new;
    }
    switch ( expr->type ) {
        case INT_TYPE:
	case CHAR_TYPE:
	case PLUS:
	case MINUS:
	case TIMES:
	case DIV:
	case ARRAY_LOOKUP:
	    new->type = INT_TYPE;
	    break;
	case FUNC_CALL:
	    new->type = expr->returnType;
	    break;
	case ERROR:
	    new->type = ERROR;
	    break;
	case SYMBOL:
	    //printf("this: %d\n", expr->symbol->type);
	    new->type = expr->symbol->type;
	    break;
	default:
	    //printf("this doesnt print\n");
	    new->type = expr->type;
    }
    return new;
} 

 
struct ArgType* newArgType( enum Type type ) {
    struct ArgType* new = (ArgType *)malloc(sizeof(ArgType));
    new->type = type;
    return new;
}

struct TreeNode* newTreeNode ( enum Type type, TreeNode* left, TreeNode* lm, TreeNode* rm, TreeNode* right ) {
    struct TreeNode* new = (TreeNode *)malloc(sizeof(TreeNode));
    new->type = type;
    new->children[0] = left;
    new->children[1] = lm;
    new->children[2] = rm;
    new->children[3] = right;
    return new;
}

int checkIndex( TreeNode* node ) {
    switch ( node->type ) {
	case INT_TYPE:
	case CHAR_TYPE:
	case PLUS:
	case MINUS:
	case TIMES:
	case DIV:
	case ERROR:
	case UNDECLARED:
	case FUNC_CALL:
	case ARRAY_LOOKUP:
	    return 1;
	    break;
	case SYMBOL:
	    switch ( node->symbol->type ) {
		case INT_TYPE:
		case CHAR_TYPE:
		    return 1;
		    break;
		case UNDECLARED:
		    return ERROR;
		    break;
		default:
		    return 0;
	    }
	    break;
	default:
	    return 0;
    }
}

void resetWrappers( VarWrapper * head )
{
    VarWrapper* willy = head; 
    VarWrapper* next;
    while ( willy ) {
        next = willy->next;  
        free ( willy );
	willy = next;
    }
    head = NULL;
}

int assgCheck( TreeNode* expr ) {

    switch ( expr->type ) {
        case INT_TYPE:
	case CHAR_TYPE:
	case PLUS:
	case MINUS:
	case TIMES:
	case DIV:
	case ARRAY_LOOKUP:
	case NEG:
	    return 1;
	    break;
	case SYMBOL:
	    switch ( expr->symbol->type ) {
		case INT_TYPE:
		case CHAR_TYPE:
		    return 1;
		    break;
		case UNDECLARED:
		    return ERROR;
		    break;
		default:
		    return 0;
	    }
	    break;
	case FUNC_CALL:
	    switch ( expr->returnType ) {
		case INT_TYPE:
		case CHAR_TYPE:	
		    return 1;
		    break;
		case ERROR:
	            return ERROR;
		    break;
		default:	
		    return 0;
	    }	
	    break;
	case ERROR:
	    return ERROR;
	    break;
	default:
	    return 0;
    }
}

int condCheck( TreeNode* expr ) {

    switch ( expr->type ) {
	case LT:
	case GT:
	case LEQ:
        case GET:
	case OR_EXP:
	case AND_EXP:
	case NOT:
	case EQ:
	case NE:
	    return 1;
	    break;
	case ERROR:
	    return ERROR;
	    break;
	default:
	    return 0; 
    }
}

void insertStmt( TreeNode** tree, TreeNode* node ) {
    if ( !(*tree) ) {
	TreeNode* new = newTreeNode(STMT, NULL, node, NULL, NULL);
	*tree = new;
	return;
    }
    else
	insertStmt(&(*tree)->children[0], node);
}

void insertFunc( TreeNode** ptr, TreeNode* func ) {
    if ( !(*ptr) ) {
	//printf("inserted: %s\n", func->symbol->id);
	//printf("left child type: %d\n", func->children[0]->type);
	*ptr = func;
	return;
    }
    else 
	insertFunc(&(*ptr)->children[1], func);
}

void printTree( TreeNode* tree ) {
    if ( !(tree) ) {
	//printf("really\n");
	return;
    }
    else {
	printf("type: %d, lookup: %d\n", tree->type, tree->lookup);
	printTree(tree->children[0]);
	printTree(tree->children[1]);
	printTree(tree->children[2]);
	printTree(tree->children[3]);
    }
}

void localData( enum Type type, VarWrapper* var ) {
    int counter = 0;    
    while ( var != NULL ) {
	counter++;
	switch ( type ) {

	    case INT_TYPE:
		printf("# local declaration of %s\n", var->varName);
	        printf("    _%s:\n", var->varName);
	        printf("	    .space 4\n");
	        printf(" 	    .align 2\n");
	        printf("\n");
		break;
	    case CHAR_TYPE:
		if ( var->isArray == 0 ) {
		    printf("# local declaration of %s\n", var->varName);
	            printf("    _%s:\n", var->varName);
                    printf("            .space 2\n");
                    printf("            .align 2\n");
	            printf("\n");
		}
		break;
    	    default:
	        if ( 1 ) {}	
        }
	var = var->next;
    }
}

struct Symbol* newLabel( char* id, enum Type type, int size ) {
    Symbol* new = (Symbol*)malloc(sizeof(Symbol));
    char* buffer= (char*)malloc(strlen(id) + 1);
    strcpy(buffer, "_"); 
    strcat(buffer, id);
    int i = 2;
    while ( declared(buffer) ) {
	 char* newbuffer = (char*)malloc(strlen(id) + i);
	 strcpy(newbuffer, "_");
	 strcat(newbuffer, buffer);
	 buffer = newbuffer;
	 printf("%s\n", buffer);
	 i++;
    }
    //printf("new label: %s\n", buffer);
    new->id = buffer;
    //printf("in table: %s\n", newLabel->id);
    new->stackSpace = size;
    new->type = type;
    return new;
}
