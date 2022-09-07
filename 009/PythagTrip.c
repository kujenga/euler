#include <stdio.h>
#include <stdlib.h>

int main( int argc, char** argv )
{
  char* num = argv[1];
  int n = atoi(num);
  for ( int x = 1; x < n; x++ ) {
    for ( int y = 1; y < n; y++ ) {
      for ( int z = 1; z < n; z++ ) {
	if ( (x+y+z == n) && ((x*x + y*y) == (z*z)) ) {
	  printf( "%i  x:%i  y:%i  z:%i\n",x*y*z,x,y,z);
	}
      }
    }
  }
}
