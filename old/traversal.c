#ifndef TABLE_H
  #define TABLE_H
  #include "table.h"
#endif
#include<stdio.h>
#include<stdlib.h>

/*extern Symbol* gTable*/
extern Symbol* gTable;
//extern Symbol* declared( char* c );
int globalCounter = 0;
// keeps track of offsets for string and char cons
int constOffset = 1;

int labelCounter = 0;
int endCounter = 0;
int forCounter = 0;
int whileCounter = 0;
//prototypes
void traverse( TreeNode* root );
CodeNode* newInstr( enum CodeType type, Symbol* src1, Symbol* src2, Symbol* src3 );
Symbol* newTemp( enum Type type );
CodeNode* glue( CodeNode* lhs, CodeNode* rhs );


//int main ( void ) {
  //  printf("hey");
    //Symbol* new1 = newTemp(INT_TYPE);
//}

void traverse( TreeNode* current ) {
    if ( current == NULL ) {
	//printf("matched null node\n");
	return;
    }
    //printf("current node: %d\n", current->type);

    switch ( current->type ) {

	Symbol* new;
	CodeNode* enter;
	CodeNode* leave;
	CodeNode* call;
	Symbol* forLabl;
	TreeNode* ptr;
	Symbol* exprTemp;
	char* label;
	char* labelEnd;

	case SYMBOL:
	case ARRAY_LOOKUP:
	    //printf("inside symbol case: lookup: %d\n", current->lookup);
	    //printf("matched symbol node\n");
	    //printf("offset: %d for local var %s", current->offset, current->symbol->id);
	    if ( current->offset ) {
		new = (Symbol*)malloc(sizeof(Symbol));
		new->id = NULL;
		new->offset = current->offset;
		//printf("offset from parser: %d\n", current->offset);
		new->type = current->symbol->type;
		new->lookup = current->lookup;
		new->charArrayLookup = current->charArrayLookup;
		//printf("offset set for local: %d\n", new->offset);
		current->place = new;
		//current->place = NULL;
	    }
	    else {
		new = (Symbol*)malloc(sizeof(Symbol));
		new->type = current->symbol->type;
		new->id = current->symbol->id;
		new->offset = current->offset;
		new->lookup = current->lookup;
		new->charArrayLookup = current->charArrayLookup;
		//current->symbol->lookup = current->lookup; 
	        current->place = new;
	    }
	    current->code = NULL;
	    if ( current->children[3] != NULL && current->children[3]->type != INT_TYPE && current->children[3]->type != CHAR_TYPE ) {
		//printf("this doesnt japppen\n");
		traverse(current->children[3]);
		current->code = glue(current->children[3]->code, newInstr(EXPR_ASSIGN, current->children[3]->place, NULL, NULL));
		new->lookup = -1;
		current->place = new;
	    }
	    break;		
	case INT_TYPE:
	    //printf("matched int con node\n");
	    new = newTemp(INT_CONSTANT);
	    new->tmpVal = current->val;
	    //new->next = gTable;
	    //gTable = new;
	    current->place = new;
	    current->code = newInstr(INT_VAL, new, NULL, NULL);
	    break;
	case PLUS:
	case LT:
        case MINUS:
	case TIMES:
	case AND_EXP:
	case OR_EXP:
	case EQ:
	case NE: 
	case GT:
	case GET:
	case LEQ:
	case DIV:
	    //printf("plus node matched\n");
	    traverse(current->children[0]);
	    //printf("left child of plus: %d\n", current->children[0]->type);
	    traverse(current->children[3]);
	    if ( current->children[0]->code != NULL ) {
	        if ( current->children[0]->code->codeType == INT_VAL || current->children[0]->code->codeType == CHAR_VAL )
		    current->children[0]->code = NULL;
	    }
	    if ( current->children[3]->code != NULL ) {
	        if ( current->children[3]->code->codeType == INT_VAL || current->children[3]->code->codeType == CHAR_VAL )
		    current->children[3]->code = NULL;
	    }
	    current->code = glue(current->children[0]->code, current->children[3]->code);
	    exprTemp = newTemp(INT_TYPE);
	    exprTemp->id = NULL;
	    switch ( current->type ) {
		case PLUS:
	            current->code = glue(current->code, newInstr(PLUS_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
	            current->place = exprTemp;
		    break;
		case LT:
		    //printf("this happens\n");
		    current->code = glue(current->code, newInstr(LT_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
		    current->place = exprTemp;
		    break;
		case MINUS:
		    current->code = glue(current->code, newInstr(MINUS_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
		    current->place = exprTemp;
		    break;
		case TIMES:
		    current->code = glue(current->code, newInstr(TIMES_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
		    current->place = exprTemp;
		    break; 
		case AND_EXP:
		    current->code = glue(current->code, newInstr(AND_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
		    current->place = exprTemp;
		    break;
		case OR_EXP:
		    current->code = glue(current->code, newInstr(OR_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
		    current->place = exprTemp;
		    break;
		case EQ:
		    current->code = glue(current->code, newInstr(EQ_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
		    current->place = exprTemp;
		    break;
		case NE:
		    current->code = glue(current->code, newInstr(NE_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
		    current->place = exprTemp;
		    break;
		case GT:
		    current->code = glue(current->code, newInstr(GT_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
		    current->place = exprTemp;
		    break;
		case GET:
		    current->code = glue(current->code, newInstr(GET_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
		    current->place = exprTemp;
		    break;
		case LEQ:
		    current->code = glue(current->code, newInstr(LEQ_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
		    current->place = exprTemp;
		    break;
		case DIV:
		    current->code = glue(current->code, newInstr(DIV_GEN, current->children[0]->place, current->children[3]->place, exprTemp));
                    current->place = exprTemp;
		    break;
		default:
		    break;
	    }
	    break;
	case NEG:
	    exprTemp = newTemp(INT_TYPE);
            exprTemp->id = NULL;
	    traverse(current->children[0]);
	    if ( current->children[0]->code != NULL ) {
	        if ( current->children[0]->code->codeType == INT_VAL || current->children[0]->code->codeType == CHAR_VAL )
		    current->children[0]->code = NULL;
	    }
	    current->code = glue(current->children[0]->code, newInstr(NEG_GEN, current->children[0]->place, NULL, exprTemp));
	    current->place = exprTemp; 
	    break;
	case IF_EXP:
	    traverse(current->children[0]);
	    label = newIfLabel();
	    current->children[0]->place->id = label; 
	    current->code = glue(current->children[0]->code, newInstr(IF_EVAL, current->children[0]->place, NULL, NULL));
	    traverse(current->children[1]);
	    if ( current->children[1] != NULL ) 
	        current->code = glue(current->code, current->children[1]->code);
	    labelEnd = newEndLabel();
	    current->children[0]->place->tmpChar = labelEnd;
	    current->code = glue(current->code, newInstr(J_END_LABEL, current->children[0]->place, NULL, NULL)); 	    
	    traverse(current->children[2]);
	    current->code = glue(current->code, newInstr(ELSE_LABEL, current->children[0]->place, NULL, NULL));
	    if ( current->children[2] != NULL ) {
		current->code = glue(current->code, current->children[2]->code); 
	    }
	    current->code = glue(current->code, newInstr(END_LABEL, current->children[0]->place, NULL, NULL));
	    break;
	case WHILE_EXP:
	    traverse(current->children[0]);
	    label = newWhileLabel();
	    current->children[0]->place->id = label;
	    current->code = glue(newInstr(WHILE_BEGIN, current->children[0]->place, NULL, NULL), current->children[0]->code);
	    current->code = glue(current->code, newInstr(WHILE_EVAL, current->children[0]->place, NULL, NULL));
	    traverse(current->children[1]);
	    if ( current->children[1] != NULL )
		current->code = glue(current->code, current->children[1]->code);
	    current->code = glue(current->code, newInstr(WHILE_END, current->children[0]->place, NULL, NULL));
	    break;
	case FOR_EXP:
	    traverse(current->children[0]);
	    label = newForLabel();
	    forLabl = newTemp(FOR_EXP);
	    forLabl->tmpString = label;
            //new->id = label;
	    if ( current->children[0] != NULL ) 
		current->code = glue(current->children[0]->code, newInstr(FOR_BEGIN, forLabl, NULL, NULL));
	    else
		current->code = newInstr(FOR_BEGIN, forLabl, NULL, NULL);
	    traverse(current->children[1]);
	    if ( current->children[1] != NULL ) {
		current->code = glue(current->code, current->children[1]->code);
	    	current->code = glue(current->code, newInstr(FOR_EVAL, current->children[1]->place, forLabl, NULL));
	    }
	    traverse(current->children[3]);
	    if ( current->children[3] != NULL )
		current->code = glue(current->code, current->children[3]->code);
	    traverse(current->children[2]);
	    if ( current->children[2] != NULL )
		current->code = glue(current->code, current->children[2]->code);
	    current->code = glue(current->code, newInstr(FOR_END, forLabl, NULL, NULL));
	    break;
	case CHAR_TYPE:
	    //printf("matched char node\n");
	    new = newTemp(current->type);
	    new->tmpChar = current->tmpChar;
	    //new->next = gTable;
	    //gTable = new;
	    current->place = new;
	    current->code = newInstr(CHAR_VAL, new, NULL, NULL);
	    break;
	case CHAR_ARRAY:
	    //printf("matched string con\n");
	    new = newTemp(current->type);
	    if ( current->tmpString ) {
		new->tmpString = current->tmpString;
		//constOffset++;
		//new->offset = constOffset;
	    } 
	    else 
	        new->offset = current->offset;
	    new->next = gTable;
            gTable = new;
	    current->place = new;
	    current->code = newInstr(STR_VAL, new, NULL, NULL);
	    break;
	case ASSG:
	    //printf("matched assgn node\n");
	    traverse(current->children[0]);
	    traverse(current->children[1]);
	    if ( current->children[0]->code == NULL ) 
	    current->code = glue(glue(current->children[0]->code, current->children[1]->code), newInstr(ASSIGN, NULL, current->children[1]->place, current->children[0]->place));
	    else {
		if ( current->children[1]->type != CHAR_TYPE && current->children[1]->type != INT_TYPE ) { 
	    current->code = glue(current->children[1]->code, newInstr(SP_ASG, NULL, current->children[1]->place, NULL));
	    current->code = glue(current->code, current->children[0]->code);
	    current->code = glue(current->code, newInstr(ASSIGN, NULL, current->children[1]->place, current->children[0]->place));
	        }
		else
	      current->code = glue(glue(current->children[0]->code, current->children[1]->code), newInstr(SP_ASG, NULL, current->children[1]->place, current->children[0]->place));
	    }
 //if ( current->children[1]->code == NULL )
	      //current->code = glue(glue(current->children[0]->code, current->children[1]->code), newInstr(ASSIGN, NULL, current->children[1]->place, current->children[0]->place));
	    //}
	    break;
	case STMT:
	    //printf("matched stmt node\n");
	    traverse(current->children[0]);
	    traverse(current->children[1]);
	    //printf("traversed children of stmt\n");
	    if ( current->children[0] == NULL )
		current->code = current->children[1]->code;
	    else 
	        current->code = glue(current->children[0]->code, current->children[1]->code);
	//	if ( current->children[1]->type == IF_EXP || current->children[1]->type == FOR_EXP || current->children[1]->type == WHILE_EXP )
	  //          current->code = glue(current->children[0]->code, current->children[1]->code);
	    //	else
	    //}
	    break;
	case FUNC:
	    //printf("mathced func node\n");
	    enter = newInstr(ENTER, current->symbol, NULL, NULL);
	    traverse(current->children[0]);
	    if ( current->children[0] != NULL )
	        current->code = glue(enter, current->children[0]->code);
	    else
		current->code = enter;
	    leave = newInstr(LEAVE, current->symbol, NULL, NULL);
	    current->code = glue(current->code, leave);
	    traverse(current->children[1]);
	    //if ( current->children[1] == NULL )
		//printf("-----NULL child of func\n");//printf("------new func: %s\n", current->children[1]->symbol->id);
	    if ( current->children[1] != NULL )
		current->code = glue(current->code, current->children[1]->code);
	    //constOffset = current->symbol->stackSpace/4;
	    break;
	case FUNC_CALL:
	    new = NULL;
	    for ( ptr = current->paramList; ptr != NULL; ptr = ptr->next ) {
	        traverse(ptr);
		//printf("found param for %s with offset %d\n", current->symbol->id, ptr->place->offset);
		if ( ptr->code != NULL && (ptr->code->codeType == INT_VAL || ptr->code->codeType == CHAR_VAL) )
		    ptr->code = NULL;
		current->code = glue(current->code, ptr->code);
		if ( new == NULL ) {
		    new = ptr->place;
		    //printf("newparam added to codegen for %s\n", current->symbol->id);
		}
		else {
		    //printf("newparam added to codegen for %s\n", current->symbol->id);
		    ptr->place->next = new;
		    new = ptr->place;
		}
	    }
	    call = newInstr(PRO_CALL, current->symbol, new, NULL);
	    current->code = glue(current->code, call);
	    break;
	case RETURN_EXP:
	    //printf("return statement matched\n");
	    traverse(current->children[0]);
	    if ( current->children[0] != NULL ) 
		current->code = glue(current->children[0]->code, newInstr(RETURN_GEN, current->children[0]->place, NULL, NULL));
	    else
		current->code = newInstr(RETURN_GEN, newTemp(VOID_TYPE), NULL, NULL);
	    break;
	default:
	    //printf("matched default with tree node of type %d\n", current->type);
	    if ( 1 ) {
	        /* more to come */
    	    }
    }


}

Symbol* newTemp( enum Type type ) {
    Symbol* new = (Symbol *)malloc(sizeof(Symbol));
    char* tmp = malloc(2000*sizeof(char));
    strcpy(tmp, "_tmp");
    char buffer[5];
    sprintf(buffer, "%d", globalCounter);
    strcat(tmp, buffer);
    //printf("new temp: %s\n", tmp);
    new->type = type;
    globalCounter++;
    new->id = tmp;
    if ( type == INT_CONSTANT ) {
	//new->type = INT_TYPE;
	new->id = NULL;
    } 
    //new->tempVal = -1;
    return new;
}

char* newIfLabel( void ) {
    char* label = malloc(11*sizeof(char));
    strcpy(label, "__else");
    char buffer[5];
    sprintf(buffer, "%d", labelCounter);
    strcat(label, buffer);
    labelCounter++;
    return label;
}

char* newEndLabel( void ) {
    char* label = malloc(11*sizeof(char));
    strcpy(label, "__end");
    char buffer[5];
    sprintf(buffer, "%d", endCounter);
    strcat(label, buffer);
    endCounter++;
    return label;    
}

char* newForLabel( void ) {
    char* label = malloc(11*sizeof(char));
    strcpy(label, "__for");
    char buffer[5];
    sprintf(buffer, "%d", whileCounter);
    strcat(label, buffer);
    whileCounter++;
    return label;
}

char* newWhileLabel( void ) {
    char* label = malloc(11*sizeof(char));
    strcpy(label, "__while");
    char buffer[5];
    sprintf(buffer, "%d", forCounter);
    strcat(label, buffer);
    forCounter++;
    return label;
}

CodeNode* newInstr(enum CodeType type, Symbol* src1, Symbol* src2, Symbol* dest ) {
    CodeNode* new = (CodeNode*)malloc(sizeof(CodeNode));
    new->codeType = type;
    new->src1 = src1;
    new->src2 = src2;
    new->dest = dest;
    return new;
}

CodeNode* glue( CodeNode* lhs, CodeNode* rhs ) {
 
    if ( lhs == NULL )
	return rhs;
    if ( rhs == NULL )
	return lhs;
  
    while ( lhs->next != NULL ) {
	lhs = lhs->next;
    }
    lhs->next = rhs;
    rhs->previous = lhs;
    while ( lhs->previous != NULL ) {
	lhs = lhs->previous;
    }
    return lhs;
}

void printCode( CodeNode* node ) {
    printf("--Intermediate code start--\n");
    while ( node != NULL ) {
	printf("-----new node-----\n");
	char* s;
	switch ( node->codeType ) {
	    case ENTER:
		s = "ENTER";
		break;
	    case AND_GEN:
		s = "AND_GEN";
		break;
	    case ASSIGN:
		s = "ASSIGN";
		printf("assign to offset %d: lookup %d\n", node->dest->offset, node->dest->lookup);
		break;
	    case VAR:
		s = "VAR";
		break;
	    case INT_VAL:
		s = "INT_VAL";
		break;
	    case STR_VAL:
		s = "STR_VAL";
		break;
	    case PRO_CALL:
		s = "PRO_CALL";
		break;
	    case LEAVE:
		s = "LEAVE";
		break;
	    case CHAR_VAL:
		s = "CHAR_VAL";
		break;
	    case PLUS_GEN:
		s = "PLUS_GEN";
		break;
	    case LT_GEN:
		s = "LT_GEN";
		break;
	    case IF_EVAL:
		s = "IF_EVAL";
		break;
	    case FOR_BEGIN:
		s = "FOR_BEGIN";
		break;
	    case FOR_EVAL:
		s = "FOR_EVAL";
		break;
	    case FOR_END:
		s = "FOR_END";
		break;
	    case ELSE_LABEL:
		s = "ELSE_LABEL";
		break;
	    default:
		printf("unkn type: %d\n", node->codeType); 
		s = "error";
	}
	printf("opType: %s\n", s);
	if ( node->src1 != NULL ) {
	    printf("src1 ptr: %s\n", node->src1->id);
	    if ( node->src1->tmpVal != 0 )
		printf("val: %d ", node->src1->tmpVal);
	    printf("stack space: %d ", node->src1->stackSpace);
	    printf("offset: %d\n", node->src1->offset);
	}
	if ( node->src2 != NULL ) {
	    printf("src2 ptr: %s\n", node->src2->id);
	    if ( node->src2->tmpVal != 0 )
		printf("val: %d ", node->src2->tmpVal);
	    printf("offset: %d\n", node->src2->offset);
	}
	if ( node->dest != NULL ) {
	    printf("dest ptr: %s ", node->dest->id);
	    printf("offset: %d\n", node->dest->offset);
	}
	node = node->next;
    }	
}

void generateCode( CodeNode* node ) {
    //ParamWrapper* debug;
    //int c = 0;

    // first set up .data section
    setUpData();
    int localStack = 0;
    int modstack = 0;
    //int localExpr = 0;
    printf("\n");
    printf(".text\n"); 
    printf("\n");
    while ( node != NULL ) {
	int paramCount;
	//ParamWrapper* ptr = NULL;
	//ParamWrapper* list = NULL;
        //ParamWrapper* ptr2 = NULL;
	switch ( node->codeType ) {
            case ENTER:
	        if( strcmp(node->src1->id, "main") == 0 )
		    printf("%s:\n", node->src1->id);
		else
		    printf("_%s:\n", node->src1->id);
	        printf("   # enter %s\n", node->src1->id);
	        printf("   sw $fp, -4($sp)\n");
	        printf("   sw $ra, -8($sp)\n");
	        printf("   la $fp, 0($sp)\n");
		//if ( node->src1->stackSpace != 1 )
		modstack = 8 + (node->src1->stackSpace-1)+16;
		while ( modstack%4 != 0 ) {
		    modstack++;
		}
		localStack = modstack;
		//printf("local stack before expr calc: %d\n", localStack);
		localStack = calculateExprSpace(&node, localStack);
		//printf("local stack after expr calc: %d\n", localStack);
	        printf("   la $sp, -%d($sp)\n", localStack);
	        printf("\n");
	        break; 
	    case INT_VAL:
	        printf("   # constant: %d\n", node->src1->tmpVal);
	        printf("   li $t1, %d\n", node->src1->tmpVal);
	        //printf("\n");
	        break;
	    case PLUS_GEN:
		loadOperand(node->src1, 1);
		loadOperand(node->src2, 2);
		printf("   # add values\n");
    		printf("   add $t3, $t1, $t2\n");
    		printf("   # store onto stack\n");
    		printf("   sw $t3, -%d($fp)\n", 8 + 4*node->dest->offset);
    		printf("\n");
		//plusGen(node->src1, node->src2, node->dest);
		break;
	    case MINUS_GEN:
	        loadOperand(node->src1, 1);
    		loadOperand(node->src2, 2);
		printf("   # subtract values\n");
		printf("   sub $t3, $t1, $t2\n");
		printf("   # store onto stack\n");
  		printf("   sw $t3, -%d($fp)\n", 8 + 4*(node->dest->offset));
		printf("\n");
 		break;
	    case TIMES_GEN:
		loadOperand(node->src1, 1);
		loadOperand(node->src2, 2);
		printf("   # multiply values\n");
		printf("   mul $t3, $t1, $t2\n");
		printf("   # store onto stack\n");
		printf("   sw $t3, -%d($fp)\n", 8 + 4*(node->dest->offset));
		printf("\n");
		break;
	    case DIV_GEN:
		loadOperand(node->src1, 1);
                loadOperand(node->src2, 2);
                printf("   # divid values\n");
                printf("   div $t3, $t1, $t2\n");
                printf("   # store onto stack\n");
                printf("   sw $t3, -%d($fp)\n", 8 + 4*(node->dest->offset));
                printf("\n");
		break;
	    case NEG_GEN:
		loadOperand(node->src1, 1);
		printf("   # multiply by -1\n");
		printf("   li $t2, -1\n");
		//printf("   xor $t3, $t1, $t2\n");
		//printf("   # add 1\n");
		printf("   mul $t3, $t1, $t2\n");
		printf("   # store onto stack\n");
		printf("   sw $t3, -%d($fp)\n", 8 + 4*(node->dest->offset));
		printf("\n");
		break; 
	    case LT_GEN:
		loadOperand(node->src1, 1);
		loadOperand(node->src2, 2);
		printf("   # set less than\n");
		printf("   slt $t3, $t1, $t2\n");
		printf("   # store result on stack\n");
		printf("   sw $t3, -%d($fp)\n", 8 + 4*node->dest->offset);
	        printf("\n");	
		break;
	    case GT_GEN:
		loadOperand(node->src1, 1);
	    	loadOperand(node->src2, 2);
		printf("   # set greater than\n");
		printf("   sgt $t3, $t1, $t2\n");
		printf("   # store result on stack\n");
		printf("   sw $t3, -%d($fp)\n", 8 + 4*(node->dest->offset));
		printf("\n");
		break;
	    case GET_GEN:
		loadOperand(node->src1, 1);
                loadOperand(node->src2, 2);
                printf("   # set greater than equal to\n");
                printf("   sge $t3, $t1, $t2\n");
                printf("   # store result on stack\n");
                printf("   sw $t3, -%d($fp)\n", 8 + 4*(node->dest->offset));
                printf("\n");
		break;
	    case LEQ_GEN:
		loadOperand(node->src1, 1);
                loadOperand(node->src2, 2);
                printf("   # set less than equal to\n");
                printf("   sle $t3, $t1, $t2\n");
                printf("   # store result on stack\n");
                printf("   sw $t3, -%d($fp)\n", 8 + 4*(node->dest->offset));
                printf("\n");
		break;
	    case AND_GEN:
		loadOperand(node->src1, 1);
		loadOperand(node->src2, 2);
		printf("   # and operation\n");
		printf("   and $t3, $t1, $t2\n");
		printf("   # store result on stack\n");
		printf("   sw $t3, -%d($fp)\n", 8 + 4*(node->dest->offset));
		printf("\n");
		break;
	    case OR_GEN:
		loadOperand(node->src1, 1);
		loadOperand(node->src2, 2);
		printf("   # or operation\n");
		printf("   or $t3, $t1, $t2\n");
		printf("   # store result on stack\n");
		printf("   sw $t3, -%d($fp)\n", 8 + 4*(node->dest->offset));
		printf("\n");
		break;
	    case EQ_GEN:
		loadOperand(node->src1, 1);
		loadOperand(node->src2, 2);
		printf("   # set equal to\n");
		printf("   seq $t3, $t1, $t2\n");
		printf("   # store result on stack\n");
		printf("   sw $t3, -%d($fp)\n", 8 + 4*(node->dest->offset));
		printf("\n");
		break;
	    case NE_GEN:
		loadOperand(node->src1, 1);
		loadOperand(node->src2, 2);
		printf("   # set not equal to \n");
		printf("   sne $t3, $t1, $t2\n");
		printf("   # store result on stack\n");
		printf("   sw $t3, -%d($fp)\n", 8 + 4*(node->dest->offset));
		printf("\n");
		break;
	    case IF_EVAL:
		printf("   # load result of logical op, branch if needed\n");
		printf("   lw $t1, -%d($fp)\n", 8 + 4*(node->src1->offset));
		printf("   beq $t1, $zero, %s\n", node->src1->id);
		printf("\n");
		break;
	    case WHILE_BEGIN:
		printf("%s:\n", node->src1->id);
		printf("\n");
		break;
	    case WHILE_EVAL:
		printf("   # load result of logical op, branch if needed\n");
		printf("   lw $t1, -%d($fp)\n", 8 + 4*(node->src1->offset));
		printf("   beq $t1, $zero, __end%s\n", node->src1->id);
		printf("\n");
		break;
	    case WHILE_END:
		printf("   j %s\n", node->src1->id);
		printf("\n");
		printf("__end%s:\n", node->src1->id);
		printf("\n");
		break;
	    case ELSE_LABEL:
		printf("%s:\n", node->src1->id);
		break;
	    case J_END_LABEL:
		printf("   j %s\n", node->src1->tmpChar);
		printf("\n");
		break;
	    case END_LABEL:
		printf("%s:\n", node->src1->tmpChar);
		printf("\n");
		break;
	    case FOR_BEGIN:
		printf("%s:\n", node->src1->tmpString);
		break;
	    case FOR_EVAL:
		printf("   # load result off of stack\n");
		printf("   lw $t1, -%d($fp)\n", 8 + 4*(node->src1->offset));
		printf("   # branch if needed\n");
		printf("   beq $t1, $zero, __end%s\n", node->src2->tmpString);
		printf("\n   # for body:\n");
		break;
	    case FOR_END:
		printf("   # jump back to top of loop\n");	
		printf("   j %s\n", node->src1->tmpString);
		printf("\n__end%s:\n", node->src1->tmpString);
		printf("\n");
		break;
	   case EXPR_ASSIGN:
		printf("   # load index\n");
		//node->src1->lookup = -1;
		loadOperand(node->src1, 5);
		//printf("   # multiply by four\n");
		//printf("   sll $t2, $t2, 2\n");
		break;
	    case SP_ASG:
		loadOperand(node->src2, 1);
		if ( node->dest != NULL )
		    assgGen(node->dest);
	        break;
	    case ASSIGN:
		codeGenLHS(node->dest, codeGenRHS(node->src2));
		//printf("dest offset: %d\n", node->dest->offset);
		break;
	    case CHAR_VAL:
		printf("   # constant: %s\n", node->src1->tmpChar);
		if ( strcmp(node->src1->tmpChar, "'\\n'") == 0 )
		    node->src1->tmpChar = "10";
	        printf("   li $t1, %s\n", node->src1->tmpChar);
		break;
	    case PRO_CALL:
		//printf("before code gen: %s\n", node->src2->id);
		paramCount = codeGenParams(node->src2, node->src1->params);
		printf("   jal _%s\n", node->src1->id);
		printf("   la $sp, %d($sp)\n", 4*paramCount);
		printf("\n");
		if ( node->src1->returnType != VOID_TYPE ) {
		    printf("   # load return value\n");
		    printf("   add $t1, $v0, $zero\n");
		}
		printf("\n");
		break;
	    case RETURN_GEN:
		if ( node->src1->type != VOID_TYPE ) {
		    printf("   # load return value\n");
		    loadOperand(node->src1, 1);
		    printf("   # store into return address\n");
		    printf("   add $v0, $t1, $zero\n");
		}
	        printf("   j %s\n", node->src1->tmpString);
	 	printf("\n");
		break;
	    case LEAVE:
		if ( strcmp(node->src1->id, "print_int") != 0 && strcmp(node->src1->id, "print_string") != 0 ) {
		printf("__leave%s:\n", node->src1->id);
		printf("   la $sp, 0($fp)\n");
		printf("   lw $ra, -8($sp)\n");
		printf("   lw $fp, -4($sp)\n");
		printf("   jr $ra\n");
		printf("\n");
		}
		break;			
	    default:
	        break;       

        }
	node = node->next;
    }
    printf("\n");
    printf("\n");
    printf("_print_int:\n");
    printf("   li $v0, 1\n");
    printf("   lw $a0, 0($sp)\n");
    printf("   syscall\n");
    printf("   jr $ra\n");
    printf("\n");
    printf("_print_string:\n");
    printf("   li $v0, 4\n");
    printf("   lw $a0, 0($sp)\n");
    printf("   syscall\n");
    printf("   jr $ra\n");


}

Symbol* newParamPlace( Symbol* list, Symbol* new ) {
    if ( list == NULL )
	return new; 
    Symbol* ptr;
    //printf("new parameter. type: %d\n", new->type);
    for ( ptr = list; ptr->next != NULL; ptr = ptr->next ) {}
    ptr->next = new;
    new->prev = ptr;
    return list;
}

int codeGenParams( Symbol* list, ParamWrapper* types ) {
    //printf("inside codegenparams\n");
    int counter = 0;
    if ( list == NULL || types == NULL ) {
	//printf("null param list\n");
	return 0;
    }
    types = reverse(types);
    for(; list != NULL && types != NULL; list = list->next, types = types->next ) {

    //printf("id : %s\n", list->id);
    if ( list->id == NULL && list->offset == 0 ) {//&& list->tmpVal ) { //|| list-> && (strncmp(list->id, "_", 1) == 0) ) {
	printf("   # push constant onto stack\n");
	if ( types->type == CHAR_TYPE ) {
	    printf("   li $t1, %d\n", list->tmpVal);
	    printf("   sb $t1, -4($sp)\n");
	    printf("   la $sp, -4($sp)\n");
	}
	else if ( types->type == INT_TYPE ) {
	    printf("   li $t1, %d\n", list->tmpVal);
	    printf("   sw $t1, -4($sp)\n");
	    printf("   la $sp, -4($sp)\n");
	}
	printf("\n");
	counter++;
    }
    else if ( list->tmpString ) {
	    printf("   # load address of string, push onto stack\n");
	    printf("   la $t1, %s\n", list->id);
	    printf("   sw $t1, -4($sp)\n");
	    printf("   la $sp, -4($sp)\n");
	    printf("\n");
	    counter++;
        }
	 
	else if ( list->tmpChar ) {
	    if ( types->type == CHAR_TYPE ) {
		printf("   # push onto stack\n");
		if ( strcmp(list->tmpChar, "'\n'") == 0 )
		    list->tmpChar = "10";
		printf("   li $t1, %s\n", list->tmpChar);
		printf("   sb $t1, -4($sp)\n");
		printf("   la $sp, -4($sp)\n");
		printf("\n");
		counter++;
	    }
	    else {
		printf("   # push onto stack\n");
		if ( strcmp(list->tmpChar, "'\\n'") == 0 )
		    list->tmpChar = "10";
		printf("   li $t1, %s\n", list->tmpChar);
		printf("   sw $t1, -4($sp)\n");
		printf("   la $sp, -4($sp)\n");
		printf("\n");
		counter++;  
	    }
	} 
	else if ( list->offset > 0 ) {
	    printf("   # load address of local, push onto stack\n"); // old code started here
	    switch ( list->type ) {
		case INT_TYPE:
		    printf("   lw $t1, -%d($fp)\n", 8 + 4*(list->offset) + 4*list->lookup);
		    break;
		case CHAR_TYPE:
		    printf("   lb $t1, -%d($fp)\n", 8 + 4*(list->offset) + 4*list->lookup);
		    break;
		case CHAR_ARRAY:
		    if ( list->charArrayLookup == 1 ) 
			printf("   lb $t1, -%d($fp)\n", 8 + (list->offset) - list->lookup);
	 	    else
		        printf("   la $t1, -%d($fp)\n", 8 + (list->offset));
		    //printf("------char array matched------\n");
		    break;
		case INT_ARRAY:
		    if ( list->charArrayLookup == 2 )
			printf("   lw $t1, -%d($fp)\n", 8 + (list->offset) - 4*list->lookup);
		    else
			printf("   la $t1, -%d($fp)\n", 8 + (list->offset));
		default:
		    break;
	    }
	    switch ( types->type ) {
		case INT_TYPE:
		    printf("   sw $t1, -4($sp)\n");
		    printf("   la $sp, -4($sp)\n");
		    break;
		case CHAR_TYPE:
		    printf("   sb $t1, -4($sp)\n");
		    printf("   la $sp, -4($sp)\n");
		    break;
		case INT_ARRAY:
		case CHAR_ARRAY:
		    printf("   sw $t1, -4($sp)\n");
                    printf("   la $sp, -4($sp)\n");
		    break;
		default:
		    break;
	    }
	    printf("\n");
	    counter++;
	}
	else if ( list->offset == 0 ) {
	    printf("   # load address of global, push onto stack\n"); // old code was here
	    switch ( list->type ) {
		case INT_TYPE:
		    printf("   lw $t1, _%s\n", list->id);
		    break;
		case CHAR_TYPE:
		    printf("   lb $t1, _%s\n", list->id);
		    break;
		case INT_ARRAY:
		    if ( list->charArrayLookup == 2 ) {
		        printf("   la $t2, _%s\n", list->id);
		        printf("   lw $t1, %d($t2)\n", 4*list->lookup);
		    }
		    else 
		        printf("   la $t1, _%s\n", list->id);
		    break;
		case CHAR_ARRAY:
		    if ( list->charArrayLookup == 1 ) {
		        printf("   la $t2, _%s\n", list->id);
		        printf("   lb $t1, %d($t2)\n", list->lookup);
		    }
		    else 
			printf("   la $t1, _%s\n", list->id);
		    break;
		default:
		    break;
	    }
	    switch ( types->type ) {
		case INT_TYPE:
		    printf("   sw $t1, -4($sp)\n");
		    printf("   la $sp, -4($sp)\n");
		    break;
		case CHAR_TYPE:
		    printf("   sb $t1, -4($sp)\n");
		    printf("   la $sp, -4($sp)\n");
		    break;
		case INT_ARRAY:
		case CHAR_ARRAY:
		    printf("   sw $t1, -4($sp)\n");
                    printf("   la $sp, -4($sp)\n");
		    break;
		default:
		    break;
	    }
	    printf("\n");
	    counter++;        
	} 
	else if ( list->offset < 0 ) {
	    printf("   # load address of local param, push onto stack\n"); // old code started here
	    switch ( list->type ) {
		case INT_TYPE:
		    printf("   lw $t1, %d($fp)\n", -4*(list->offset+1));
		    break;
		case CHAR_TYPE:
		    printf("   lb $t1, %d($fp)\n", -4*(list->offset+1));
		    break;
		case CHAR_ARRAY:
		    if ( list->charArrayLookup == 1 ) {
			printf("   lw $t2, %d($fp)\n", -4*(list->offset+1));
			printf("   lb $t1, %d($t2)\n", (list->lookup));
			//printf("lookup:%d\n", list->lookup);
		    }
		    else
			printf("   lw $t1, %d($fp)\n", -4*(list->offset+1));
		    break;
		case INT_ARRAY:
		    if( list->charArrayLookup == 2 ) {
			printf("   lw $t2, %d($fp)\n", -4*(list->offset+1));
			printf("   lw $t1, %d($t2)\n", 4*(list->lookup));
		    }
		    else
			printf("   lw $t1, %d($fp)\n", -4*(list->offset+1));
		    break;
		default:
		    break;	
	    }
	    switch ( types->type ) {
		case INT_TYPE:
		    printf("   sw $t1, -4($sp)\n");
		    printf("   la $sp, -4($sp)\n");
		    break;
		case CHAR_TYPE:
		    printf("   sb $t1, -4($sp)\n");
		    printf("   la $sp, -4($sp)\n");
		    break;
		case INT_ARRAY:
		case CHAR_ARRAY:
		    printf("   sw $t1, -4($sp)\n");
                    printf("   la $sp, -4($sp)\n");
		    break;
		default:
		    break;
	    }
	    printf("\n");
	    counter++;        
	} 
    }
    return counter;
}

Type codeGenRHS( Symbol* src2 ) {
    if ( src2 == NULL ) {
	return VOID_TYPE;
    }
    if ( src2->id != NULL ) {
	if ( strncmp(src2->id, "_", 1) == 0 )
	    return src2->type;
    }
    if ( src2->lookup < 0 )
	return src2->type;
/*    
    if ( src2->lookup < 0 ) {
        if ( src2->offset == 0 ) {
            printf("   la $t3, _%s\n", src2->id);
        }
        if ( src2->offset < 0 ) {
            printf("   lw $t3, %d($fp)\n", -4*(src2->offset+1));
        }
        if ( src2->offset > 0 ) {
            printf("   la $t3, -%d($fp)\n", 8 + src2->offset);
        }
        switch ( src2->type ) {
            case INT_ARRAY:
            case INT_TYPE:
                printf("   # multiply index by four\n");
		printf("   sll $t5, $t5, 2\n");
                printf("   add $t4, $t5, $t3\n");		
                printf("   lw $t1, ($t4)\n");
                return INT_TYPE;
            case CHAR_ARRAY:
            case CHAR_TYPE:
		printf("   add $t4, $t5, $t3\n");
                printf("   lb $t1, ($t4)\n");
                return CHAR_TYPE;
            default:
                return ERROR;
        }	
    }*/
    int offset = src2->offset;
    if ( offset == 0 ) {
        printf("   # load global variable\n");
	switch( src2->type ) {
	    case INT_TYPE:
		printf("   lw $t1, _%s\n", src2->id);
		return INT_TYPE;
	    case CHAR_TYPE:
		printf("   lb $t1, _%s\n", src2->id);
		return CHAR_TYPE;
	    case INT_ARRAY:
		printf("   la $t4, _%s\n", src2->id);
		printf("   lw $t1, %d($t4)\n", 4*(src2->lookup));
		return INT_TYPE;
	    case CHAR_ARRAY:
		printf("   la $t4, _%s\n", src2->id);
		printf("   lb $t1, %d($t4)\n", src2->lookup);
		return CHAR_TYPE;
	    default:
		return ERROR;
	}
    }
    else if ( offset > 0 ) {
	printf("   # load local variable\n");
	switch( src2->type ) {
	    case INT_TYPE:
		printf("   lw $t1, -%d($fp)\n", 8 + 4*(src2->offset));
		return INT_TYPE;
	    case CHAR_TYPE:
		printf("   lb $t1, -%d($fp)\n", 8 + 4*(src2->offset));
		return CHAR_TYPE;
	    case INT_ARRAY:
		printf("   lw $t1, -%d($fp)\n", 8 + (src2->offset) - 4*(src2->lookup));
		return INT_TYPE;
	    case CHAR_ARRAY:
		printf("   lb $t1, -%d($fp)\n", 8 + (src2->offset) - (src2->lookup));
		return CHAR_TYPE;
	    default:
		return ERROR;
	}
    }
    else {
	printf("   # load local parameter\n");
	switch( src2->type ) {
	    case INT_TYPE:
		printf("   lw $t1, %d($fp)\n",  -4*(src2->offset + 1));
		return INT_TYPE;
	    case CHAR_TYPE:
		printf("   lb $t1, %d($fp)\n",  -4*(src2->offset + 1));
	        return CHAR_TYPE;
	    case CHAR_ARRAY:
		if ( src2->charArrayLookup == 1 ) {
                    printf("   lw $t2, %d($fp)\n", -4*(src2->offset+1));
                    printf("   lb $t1, %d($t2)\n", (src2->lookup));
                    //printf("lookup:%d\n", list->lookup);
                }
                else
                    printf("   lw $t1, %d($fp)\n", -4*(src2->offset+1));
	   	return CHAR_TYPE;	
	    case INT_ARRAY:
	 	if ( src2->charArrayLookup == 2 ) {
                    printf("   lw $t2, %d($fp)\n", -4*(src2->offset+1));
                    printf("   lw $t1, %d($t2)\n", 4*(src2->lookup));
                }
                else 
                    printf("   lw $t1, %d($fp)\n", -4*(src2->offset+1));
                return INT_TYPE;
	    default:
		return ERROR;
	}
    }
}

void codeGenLHS( Symbol* dest, Type type ) {
    int offset = dest->offset;
    if ( dest->lookup < 0 ) {
        if ( dest->offset == 0 ) {
            printf("   la $t3, _%s\n", dest->id);
        }
        if ( dest->offset < 0 ) {
            printf("   lw $t3, %d($fp)\n", -4*(dest->offset+1));
        }
        if ( dest->offset > 0 ) {
            printf("   la $t3, -%d($fp)\n", 8 + dest->offset);
        }
        switch ( dest->type ) {
            case INT_ARRAY:
            case INT_TYPE:
                printf("   # multiply index by four\n");
                printf("   sll $t5, $t5, 2\n");
                printf("   add $t4, $t5, $t3\n");
                printf("   sw $t6, ($t4)\n");
		printf("\n");
                return;
            case CHAR_ARRAY:
            case CHAR_TYPE:
                printf("   add $t4, $t5, $t3\n");
                printf("   sb $t6, ($t4)\n");
		printf("\n");
                return;
            default:
		return;
	}
    }
    if ( offset == 0 ) {
	printf("   # assign to global variable\n");
        switch ( dest->type ) {
	    case CHAR_TYPE:
		printf("   la $t2, _%s\n", dest->id);
		printf("   sb $t1, ($t2)\n");
		break;
	    case INT_TYPE:
	        printf("   sw $t1, _%s\n", dest->id);
		break;
	    case CHAR_ARRAY:
		printf("   la $t2, _%s\n", dest->id);
		printf("   sb $t1, %d($t2)\n", dest->lookup);
		break;
	    case INT_ARRAY:
		printf("   la $t2, _%s\n", dest->id);
		printf("   sw $t1, %d($t2)\n", 4*dest->lookup);
		break;
	    default:
		break;
	}			 
	//}
	//printf("   sw $t1, ($t0)\n");
    }
    else if ( offset > 0 ) {
	printf("   # assign to local variable\n");
	switch ( dest->type ) {
	    case CHAR_TYPE:
		printf("   la $t2, -%d($fp)\n", 8 + 4*(dest->offset));
		printf("   sb $t1, ($t2)\n");
		break;
	    case INT_TYPE:
		//printf("here\n");
	        printf("   sw $t1, -%d($fp)\n", 8 + 4*(dest->offset));
		break;
	    case CHAR_ARRAY:
		//printf("offset: %d\n", dest->offset);
		printf("   sb $t1, -%d($fp)\n", 8 + (dest->offset) - (dest->lookup));
		break;
	    case INT_ARRAY:
		printf("   sw $t1, -%d($fp)\n", 8 + (dest->offset) - 4*(dest->lookup));
		break;     		
	    default:
		break;
	}
    }
    else {
	printf("   # assign to local parameter\n");
	switch ( dest->type ) {
	    case CHAR_TYPE:
		printf("   la $t2, %d($fp)\n", -4*(dest->offset + 1));    
		printf("   sb $t1, ($t2)\n");
	  	break;
	    case INT_TYPE:
	        printf("   sw $t1, %d($fp)\n", -4*(dest->offset + 1));
		break;
	    case CHAR_ARRAY:
		printf("   lw $t2, %d($fp)\n", -1*(dest->offset + 1));
		printf("   sb $t1, %d($t2)\n", (dest->lookup));
		break;
	    case INT_ARRAY:
		printf("   la $t2, %d($fp)\n", -4*(dest->offset + 1));
		printf("   sw $t1, %d($fp)\n", 4*(dest->lookup));
	    default:
		break;   
	}    
    }
    printf("\n");
}

void setUpData( void ) {

    Symbol* ptr;
    for ( ptr = gTable; ptr != NULL; ptr = ptr->next ) {
	switch ( ptr->type ) {
	    case INT_TYPE:
		printf("   _%s:\n", ptr->id);
		printf("      .space 4\n");
	        break;
	    case CHAR_TYPE:
		printf("   _%s:\n", ptr->id);
		printf("      .space 1\n");
		printf("      .align 2\n");
		break;
	    case CHAR_ARRAY:
		if ( ptr->tmpString ) {
		    printf("   %s:\n", ptr->id);
		    printf("      .asciiz %s\n", ptr->tmpString);
		    printf("      .align 2\n");
		}
		else {
		    printf("   _%s:\n", ptr->id);
		    printf("      .space %d\n", ptr->stackSpace);
		    printf("      .align 2\n");
		}
		break;
	    case INT_ARRAY:
		printf("   _%s:\n", ptr->id);
		printf("      .space %d\n", 4*ptr->stackSpace);
		break;
	    default:
		break;
	}
    }
}

int calculateExprSpace(CodeNode** node, int localStack) {
    int exprSpace = 1;
    char* leaveLabel = (char*)malloc(100*sizeof(char));
    strcpy(leaveLabel, "__leave");
    strcat(leaveLabel, (*node)->src1->id);
    //printf("leave label for %s: %s\n", (*node)->src1->id, leaveLabel);
    if ( node == NULL ) {
	//printf("null coden");
	return 0;
    }
    CodeNode* ptr = *(node);
    for (; ptr != NULL; ptr = ptr->next ) {
	//printf("inside expr calc, node: %d\n", ptr->codeType);
	switch ( ptr->codeType ) {
	    case LEAVE:
		return localStack + 4*exprSpace;
	    case PLUS_GEN:
	    case LT_GEN:
	    case MINUS_GEN:
	    case NEG_GEN:
	    case TIMES_GEN:
	    case AND_GEN:
	    case OR_GEN:
	    case EQ_GEN:
	    case NE_GEN:
	    case GT_GEN:
	    case LEQ_GEN:
	    case GET_GEN:
	    case DIV_GEN:
		exprSpace++;
		ptr->dest->offset = (localStack-8)/4 + exprSpace;
	        break;
	    case RETURN_GEN:
		ptr->src1->tmpString = leaveLabel;
		break;
	    default: 
		break;
	}
    }
    return localStack + 4*(exprSpace);
}

void plusGen( Symbol* src1, Symbol* src2, Symbol* dest ) {
    if ( src1->tmpVal && !(src1->offset) ) {
	printf("   # constant: %d\n", src1->tmpVal);
	printf("   li $t1, %d\n", src1->tmpVal);
    }
    else if ( src1->tmpChar ) {
	if ( strcmp(src1->tmpChar, "'\\n'") == 0 )
	    src1->tmpChar = "10";
	printf("   # constant: %s\n", src1->tmpChar);
	printf("   li $t1, %s\n", src1->tmpChar);
    }
    else if ( src1->offset > 0 ) {
	printf("   # load local from stack\n");		
    }
    if ( src2->tmpVal && !(src2->offset) ) {
	printf("   # constant: %d\n", src2->tmpVal);
	printf("   li $t2, %d\n", src2->tmpVal);
    }
    printf("   # add values\n");
    printf("   add $t3, $t1, $t2\n");
    printf("   # store onto stack\n");
    printf("   sw $t3, -%d($fp)\n", 8 + 4*dest->offset);
    printf("\n");
}

void loadOperand( Symbol* operand, int reg ) {
    if ( operand == NULL ) {
	printf("   # load return value operand\n");
	printf("   add $t%d, $v0, $zero\n", reg);
	return;
    }
    char* load = "";
    switch( operand->type ) {
	case INT_TYPE:
	case INT_ARRAY:
	    load = "lw";
	    break;
	case CHAR_TYPE:
	case CHAR_ARRAY:
	    load = "lb";
	    break;
	default:
	    break;
    }
    if ( operand->lookup < 0 ) {
        if ( operand->offset == 0 ) {
            printf("   la $t3, _%s\n", operand->id);
        }
        if ( operand->offset < 0 ) {
            printf("   lw $t3, %d($fp)\n", -4*(operand->offset+1));
        }
        if ( operand->offset > 0 ) {
            printf("   la $t3, -%d($fp)\n", 8 + operand->offset);
        }
        switch ( operand->type ) {
            case INT_ARRAY:
            case INT_TYPE:
                printf("   # multiply index by four\n");
                printf("   sll $t5, $t5, 2\n");
                printf("   add $t4, $t5, $t3\n");
                printf("   lw $t6, ($t4)\n");
                printf("\n");
		return;
            case CHAR_ARRAY:
            case CHAR_TYPE:
                printf("   add $t4, $t5, $t3\n");
                printf("   lb $t6, ($t4)\n");
		printf("\n");
                return;
            default:
		return;
        }
    }
    if ( operand->id == NULL && !(operand->offset) ) {
       	printf("   # constant: %d\n", operand->tmpVal);
 	printf("   li $t%d, %d\n", reg, operand->tmpVal);
    }
    else if ( operand->tmpChar ) {
	if ( strcmp(operand->tmpChar, "'\\n'") == 0 )
	    operand->tmpChar = "10";
	printf("   # constant: %s\n", operand->tmpChar);
        printf("   li $t%d, %s\n", reg, operand->tmpChar);
    }
    else if ( operand->offset > 0 ) {
	printf("   # load value off of stack\n");
	if ( operand->type == CHAR_ARRAY )
	    printf("   %s $t%d, -%d($fp)\n", load, reg, 8 + (operand->offset) - (operand->lookup));  
    	else if ( operand->type == INT_ARRAY )
	    printf("   %s $t%d, -%d($fp)\n", load, reg, 8 + (operand->offset) - 4*(operand->lookup));
	else
	    printf("   %s $t%d, -%d($fp)\n", load, reg, 8 + 4*(operand->offset));  
    }
    else if ( operand->offset == 0 ) {
	//if ( opernad->id != NULL ) {
	printf("   # load global\n");
	printf("   la $t4, _%s\n", operand->id);
	printf("   %s $t%d, %d($t4)\n", load, reg, 4*(operand->lookup));
   	//}
    }
    else if ( operand->offset < 0 ) {
	//printf("   lw $t4, %d($fp)\n", -4*(operand->offset+1));
	//printf("   %s $t%d, %d($t4)\n", load, reg, 4*(operand->lookup));
	printf("   # load param\n");
        switch ( operand->type ) {
            case INT_TYPE:
                printf("   %s $t%d, %d($fp)\n", load, reg, -4*(operand->offset+1));
                break;
            case CHAR_TYPE:
                printf("   %s $t%d, %d($fp)\n", load, reg, -4*(operand->offset+1));
                break;
            case CHAR_ARRAY:
                if ( operand->charArrayLookup == 1 ) {
                   printf("   lw $t3, %d($fp)\n", -4*(operand->offset+1));
                   printf("   lb $t%d, %d($t3)\n", reg, (operand->lookup));
                    //printf("lookup:%d\n", list->lookup);
                }
                else
                    printf("   lw $t%d, %d($fp)\n", reg, -4*(operand->offset+1));
                break;
            case INT_ARRAY:
                if( operand->charArrayLookup == 2 ) {
                    printf("   lw $t3, %d($fp)\n", -4*(operand->offset+1));
                    printf("   lw $t%d, %d($t3)\n",reg, 4*(operand->lookup));
                }
                else
                    printf("   lw $t%d, %d($fp)\n",reg, -4*(operand->offset+1));
                break;
            default:
                break;
	}
    }
}
/*
ParamWrapper* reverse( ParamWrapper* root ) {
    ParamWrapper* new_root = 0;
    while (root) {
      ParamWrapper* next = root->next;
      root->next = new_root;
      new_root = root;
      root = next;
    }
    return new_root;
}
*/

ParamWrapper* reverse( ParamWrapper* root ) {
    //ParamWrapper *next;
    ParamWrapper *current ;
    current = root;
    ParamWrapper *result = NULL; //newParamWrapper(root->isArray, root->type, root->id);

    while(current != NULL ) {
	//next = current->next
	//current-next=result;
        ParamWrapper *new = newParamWrapper(current->isArray, current->type, current->id);
	new->next = result;
	result = new;
	current = current->next;
    }
    return (result);
}

void assgGen(Symbol* dest) {

    if ( dest->offset == 0 ) {
	printf("   la $t3, _%s\n", dest->id);	
    }
    if ( dest->offset < 0 ) {
	printf("   lw $t3, %d($fp)\n", -4*(dest->offset+1));
    }
    if ( dest->offset > 0 ) {
	printf("   la $t3, -%d($fp)\n", 8 + dest->offset);
    }
    switch ( dest->type ) {
	case INT_ARRAY:
	case INT_TYPE:
	    printf("   sll $t5, $t5, 2\n");
    	    printf("   add $t4, $t5, $t3\n");
	    printf("   sw $t1, ($t4)\n");
	    break;
	case CHAR_ARRAY:
	case CHAR_TYPE:
    	    printf("   add $t4, $t5, $t3\n");
	    printf("   sb $t1, ($t4)\n");
	    break;
	default:
	    break;
    }

}
