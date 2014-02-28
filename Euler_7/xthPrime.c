# include <stdio.h>
# include <stdlib.h>

int isPrime(int n)
{
  if ( n < 2 ) return 0;
  if ( (n % 2) == 0 ) return 0;
  //if it is divisible by any number up to its square root, return false
  for (int i = 3; i*i <= n; i+=2) {
    if ( (n % i) == 0 ) return 0; 
  }
  return 1;
}

int main(int argc, char** argv)
{

  char*numIn = argv[1];
  int whichPrime = atoi(numIn);
  printf("inputted number: %i\n",whichPrime);
  
  int numFound = 2;
  int n = 3;
  while ( numFound < whichPrime ) {
    n++;
    if ( isPrime(n) ) numFound++;
  }
  printf("that prime: %i\n",n);
}


