#include <stdio.h>
#include<stdlib.h>

#define size 20

int maxLR(int* nums);
int maxUD(int* nums);
int maxDR(int* nums);
int maxDL(int* nums);

int main ( int argc, char ** argv )
{
  int array[size][size];
  int* tst = malloc (400*sizeof(int));
  int n;
  int p = 0;
  //fill 2d array with the inputted grid
  while ( EOF != scanf( "%d", &n ) ) {
    tst[p] = n;
    p++;
  }
  puts("\n");

  for ( int i=0; i < 400; i++ ) {
    
    if ( tst[i] == 0 ) printf( "00 " );
    else if ( tst[i] < 10 ) printf( "0%i ",tst[i] );
    else printf( "%i ",tst[i] );
    if ((i+1)%20 == 0) puts("");
  }
  printf("maxLR: %i\n",maxLR(tst));
  printf("maxUD: %i\n",maxUD(tst));
  printf("maxDR: %i\n",maxDR(tst));
  printf("maxDL: %i\n",maxDL(tst));
}

int maxLR(int* nums) {
  int cur = nums[0]*nums[1]*nums[2]*nums[3];
  int max = cur;
  for (int p = 4; p < 400 ; ) {
    cur = nums[p-3]*nums[p-2]*nums[p-1]*nums[p];
    if (cur > max) max = cur;
    //deals with end of rows
    if ( (p+4)%size == 0 ) p += 4;
    else p++;
  }
  return max;
}

int maxUD(int * nums) {
  int cur = 0;
  int max = 0;
  for ( int p = 0; p + 60 < 400; p++ ) {
    cur = nums[p]*nums[p+20]*nums[p+40]*nums[p+60];
    if (cur > max) max = cur;
  }
  return max;
}

int maxDR(int* nums) {
  int cur = 0;
  int max = 0;
  for ( int p = 0; p + 64 < 400; ) {
    cur = nums[p]*nums[p+21]*nums[p+42]*nums[p+64];
    if (cur > max) max = cur;
    if ( (p+4)%size == 0 ) p += 4;
    else p++;
  }
  return max;
}

int maxDL(int* nums) {
  int cur = 0;
  int max = 0;
  for ( int p = 3; p + 57 < 400; ) {
    cur = nums[p]*nums[p+19]*nums[p+38]*nums[p+57];
    if (cur > max) max = cur;
    if ( (p+1)%size == 0 ) p += 4;
    else p++;
  }
  return max;
}
