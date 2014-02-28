#include <stdio.h>

//takes a number and finds the next highest prime number                                                                                 
long isPrime(long n) {
  if (n==2) return 1;
  if (n%2==0)return 0;
  if (n<2) return 0;
  long f = 3;
  while(f*f <= n) {
    if (n%f == 0) return 0;
    f += 2;
  }
  return 1;
}

long nextPrime ( long oldNum )
{
  long newNum = oldNum;
  while(1) {
    newNum++;
    if (isPrime(newNum))
      return newNum;
  }
  return -1;
}

int main( long argc, char **argv )
{
  char **end;
  //this line does not work for large numbers that should fit in a long value
  long number = strtol(argv[1],&end,10);
  printf("number inputted: %ld\nend: %s",number,end);
  long curPrime = 2;
  while (number >= curPrime) {
    if ( number%curPrime == 0 ) {
      number = number / curPrime;
      printf("a prime: %ld\n",curPrime);
    }
    curPrime = nextPrime(curPrime);
  }
}
