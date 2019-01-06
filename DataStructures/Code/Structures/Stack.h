#include "Global.h"

///////Linked vs. Array based implementation
#define LINKED_STACK

/**********************************************************/

#ifdef LINKED_STACK

/*********************************************************************************/
/****************************** Linked implementation*****************************/
/*********************************************************************************/

typedef struct stacknode{
	StackEntry entry;
	struct stacknode *next;
}StackNode;

typedef struct stack{
	StackNode *top;
}Stack;

#else

/*********************************************************************************/
/****************************** Array-based implementation************************/
/*********************************************************************************/

typedef struct stack{
	int top;
	StackEntry entry[MAXSTACK];
} Stack;

#endif

/*********************************************************************************/
/*********************************************************************************/
/*********************************************************************************/

void	TestImplementation();
void	Push			(StackEntry, Stack *);
void	Pop				(StackEntry *, Stack *);
int		StackEmpty		(Stack *);
int		StackFull		(Stack *);
void	CreateStack		(Stack *);
void	StackTop		(StackEntry *, Stack *);
int		StackSize		(Stack *);
void	ClearStack		(Stack *);
void	TraverseStack	(Stack *, void (*)(StackEntry));


