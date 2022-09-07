#include <stdio.h>

int isPrime(int n)
{
  if (n==2) return 1;
  if (n%2==0)return 0;
  if (n<2) return 0;
  int f = 3;
  while(f*f <= n) {
    if (n%f == 0) return 0;
    f += 2;
  }
  return 1;
}

int findMul(int n)
{
  int f = 1;
  n /= 10;
  while (n) {
    f *= 10;
    n /= 10;
  }
  return f;
}

int rotsArePrime(int n)
{
  int num = n;
  int mul = findMul(n);
  int tmp = n;
  //printf("%d,%d ",n,mul); 
  while ( tmp ) {
    if ( !isPrime(n) )
      return 0;
    int main = n/10;
    int top = n%10;
    n = main + top*mul;

    tmp /= 10;
  }
  //printf ("a circular prime:%d\n",num);
  return 1;
}

int main (int argc, char** argv)
{
  int tally = 1;
  for ( int i = 3; i < 1000000; i += 2 ) {
    if ( rotsArePrime (i) )
      tally++;
  }
  printf("tally: %d\n",tally);
}
