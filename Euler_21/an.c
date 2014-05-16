// (c) 2014 Aaron M. Taylor
// Solution to Project Euler problem 21

#import <stdio.h>
#import <stdlib.h>

int d(int n) {
  int sum = 0;
  for (int i = 1; i < (n/2+1); i++) {
    if ( n%i == 0 ) sum += i;
  }
  return sum;
}

int main (int argc, char** argv) {
  int sum = 0;
  int max = atoi(argv[1]);
  for( int i = 1; i < max; i++ ) {
    int cur = d(i);
    if ((cur != i) && d(cur) == i) sum += i;
  }
  printf("%d\n",sum);
}
