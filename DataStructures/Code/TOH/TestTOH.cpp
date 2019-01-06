#include <stdio.h>

/*Tower of Hanoi function as in the text.
it moves "count" disks from "start" to "finish" using "temp"*/
void Move(int count, int start, int finish, int temp){
	if (count>0){
		Move(count-1, start, temp, finish);
		printf("Move disk %d from %d to %d\n", count, start, finish);
		Move(count-1, temp, finish, start);
	}
}

/*Tower of Hanoi with removing the tail recursion as in the text.*/
void MoveNoTailRecursion(int count, int start, int finish, int temp){
	int swap;
	while(count>0){
		Move(count-1, start, temp, finish);
		printf("Move disk %d from %d to %d\n", count, start, finish);
		count--;
		swap=start; start=temp; temp=swap;
	}
}

int main(){
  int count, start, finish, tmp;

  count = 4;
  start = 1;
  finish= 3;
  tmp   = 2;

  // Comparing the output of the two versions:

  Move(count, start, finish, tmp);
  printf("\n");
  MoveNoTailRecursion(count, start, finish, tmp);

  return 0;
}
