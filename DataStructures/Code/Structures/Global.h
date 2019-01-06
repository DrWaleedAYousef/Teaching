#ifndef GLOBAL_H
#define GLOBAL_H

/* Global declarations for Projects p1p2 in section 4.3 */

/********************* KeyType and related macros*****************/
typedef int KeyType;

#define EQ(a, b) ((a)==(b))
#define LT(a, b) ((a)<(b))
#define LE(a, b) ((a)<=(b))
#define GT(a, b) ((a)>(b))
#define GE(a, b) ((a)>=(b))

//#define EQ(a, b) (!strcmp((a), (b)))
//#define LT(a, b) (strcmp((a), (b))<0)
//#define LE(a, b) (strcmp((a), (b))<=0)
//#define GT(a, b) (strcmp((a), (b))>0)
//#define GE(a, b) (strcmp((a), (b))>=0)
/****************************************************************/

typedef struct elementtype{
	KeyType		key;
		int		year;
		float	age;
		int		tmp;
	short int	etype; 
	union{
		int		year;
		float	age;
		void	*ptr;
		char	par;
	}info;
}ElementType;

#define MAXELEMENTS 100

typedef ElementType QueueEntry;
#define MAXQUEUE MAXELEMENTS

typedef void * StackEntry;
//typedef ElementType StackEntry;
//#define MAXSTACK MAXELEMENTS

typedef ElementType ListEntry;
#define MAXLIST MAXELEMENTS

typedef ElementType TreeEntry;


typedef ElementType GraphEntry;
#define MAXVERTEX 6

#endif
