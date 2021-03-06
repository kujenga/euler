#include <stdio.h>
#include <stdlib.h>

int main (int argc, char** argv)
{
  int p = 0; //placeholder in the array based queue
  int q[5];
  char cur;
  int maxProd;
  while (EOF != (cur = getchar())) {
    //puts(&cur);
    q[ p % 5 ] = atoi(&cur); //puts value at front of queue, overwrites last value
    if ( p >= 4) { //queue is filled
      int prod = 1;
      for ( int x = p-4; x <= p; x++) { //iterates through last 5 in queue
	prod *= q[ x % 5 ];
      }
      if (prod > maxProd) maxProd = prod;
    }
    p++;
  }
  printf("maxProd: %i\nX",maxProd);
}
