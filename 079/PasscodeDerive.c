// (c) 2013 Aaron M. Taylor
// This program provides the solution to Project Euler problem 79
// The input is a series of 3 digit keys from a longer passcode
// The goal is to determine the passcode from the keys

#import <stdio.h>
#import <stdlib.h>
#import <string.h>

#define size 10

int unreachable( int am[size][size], int mask );
int bfShortest( int am[size][size], int start, int mask);

int main(int argc, char** argv)
{
  FILE* f = fopen("keylog.txt","r");
  // adjacency matrix of form [source] [destination]
  int keysAM[size][size];
  memset(keysAM, 0, sizeof(keysAM));
  //keeps track of which digits appear in the keylog, some may be unused
  int containsMask;
  //buffer for reading in numbers from keylog
  int cur;
  for (int i = 0; EOF != fscanf(f,"%d",&cur); i++ ) {
    int d3 = cur/100;
    int d2 = (cur/10)%10;
    int d1 = cur%10;
    //each entry is three digits, so two adjacencies need to be recorded
    keysAM[d3][d2]++;
    keysAM[d2][d1]++;
    //records which digits have been seen in the keylog
    containsMask = containsMask | (1 << d3) | (1 << d2) | (1 << d1);
  }
  fclose(f);
  //prints out adjacency matrix
  puts("Adjacency Matrix of the keylog");
  for (int src = 0; src < size; src++) {
    for (int dst = 0; dst < size; dst++) {
      printf("%d ",keysAM[src][dst]);
    }
    puts("");
  }
  //finds starting node by looking for the point with no incoming edges
  int startNode = unreachable(keysAM, containsMask);
  printf("\nstartNode: %d\n",startNode);
  //calls method to find solution
  printf("\nShortest possible key: %d\n\n", bfShortest(keysAM, startNode, containsMask));
}


/* uses a breadth-first search to find the shortest path
 * am must represent a directed acyclic graph
 * start is the beginning node, mask indicates which nodes must be in result
 */
int bfShortest( int am[][size], int start, int mask) {
  //queue of paths stored as ints, where each digit in the int is a node in the graph
  int queue[100];
  memset(queue, 0, sizeof(queue));
  int qf = 0; // points to first element in the queue
  int ql = 0; // points to last element in the queue
  //initializes the queue with the starting path
  queue[(ql++)%100] = start;
  for (int i = 0; i < 500; i++ ) {
    int curPath = queue[(qf++)%100];
    //printf("qf: %2d ql: %2d curPath %2d: %d\n",qf,ql,i,curPath);
    // adds destination nodes of current source to the queue
    for ( int dst = 0; dst < size; dst++ ) {
      if ( am[curPath%10][dst] ) {
	queue[(ql++)%100] = curPath*10 + dst;	
      }
    }
    //uses the mask to test if all the nodes have been used
    int tmpMask = mask;
    for ( int tmpCurPath = curPath; tmpCurPath; tmpCurPath /= 10 )
      tmpMask = tmpMask & ( ~ ( 1 << (tmpCurPath%10) ) );
    if( tmpMask == 0 ) return curPath;
  }
  return 0;
}

/* finds the first destination with no incoming edges in the adjacency matrix
 * result must be included in the mask
 */
int unreachable( int am[][size], int mask )
{
  //loops through matrix until a unreachable node is found
  for ( int dst = 0; dst < size; dst++ ) {
    //tests if node is in mask. If not, skips this iteration
    if ( ((1 << dst) & mask) == 0 ){
      continue;
    }
    int src;
    for ( src = 0; src < size; src++ ) {
      if ( am[src][dst] )
	break;
    }
    // unreachable object found is src incremented all the way
    if (src == size)
      return dst;
  }
  return -1;
}
