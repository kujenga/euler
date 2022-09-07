// Aaron M. Taylor (c) 2013

#import <stdio.h>
#import <stdlib.h>

int comp(const void*x, const void*y) {
  const int *ix = (const int*)x;
  const int *iy = (const int*)y;
  return *ix-*iy;
}

struct node {
  int x;
  struct node* next;
};

int notNull (struct node* theNode) {
  if ( (theNode -> x == -1) || (theNode -> next == 0) )
    return 0;
  else
    return 1;
}

void insertAfter( int n, struct node* curNode )
{
  struct node* oldNext = curNode -> next;
  struct node* newNext = (struct node*) malloc(sizeof(struct node));
  newNext -> x = n;
  curNode -> next = newNext;
  newNext -> next = oldNext;
}

struct node* addFirst( int n, struct node* theNode )
{
  struct node* newRoot = (struct node*) malloc (sizeof(struct node));
  newRoot -> x = n;
  newRoot -> next = theNode;
  return newRoot;
}

struct node* digitList( int n )
{
  struct node* root = (struct node*) malloc(sizeof(struct node));
  root-> x = -1;
  root-> next = 0;
  while ( n ) {
    root = addFirst( n%10, root ); // builds the list from the bottom up
    n /= 10;
  }
  return root;
}

void printList( struct node* l ) {
  struct node* tmp = l;
  while ( notNull(tmp) ) {
    printf("%d ",tmp -> x);
    tmp = tmp -> next;
  }    
}

int combineLists( struct node* base, struct node* addIn )
{
  return 0;
}

int main (int argc, char** argv)
{
  FILE* f = fopen("keylog.txt","r");
  int keys[50];
  int cur;
  for (int i = 0; EOF != fscanf(f,"%d",&cur); i++ ) {
    keys[i] = cur;
  }
  fclose(f);
  qsort(keys, 50, sizeof(int), comp);
  struct node* listKeys[50];
  int uniqueKeys = 0;
  for (int i = 0; i < 50; i++) {
    if ( i == 0 || keys[i-1] != keys[i] ) {
      listKeys[uniqueKeys] = digitList(keys[i]);
      uniqueKeys++;
      printList(listKeys[i]);
    }
  }
  struct node* solution = keysList[0];
  for ( int i = 1; i < uniqueKeys; i++ ) {
    combineLists(
  }
}

