#include <stdio.h>
#include <stdlib.h>

// 0, one, two, three, four, five, six, seven, eight, nine
int digits [10] = { 0, 3, 3, 5, 4, 4, 3, 5, 5, 4 };
// ten, eleven, twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen
int teens [10]= { 3, 6, 6, 8, 8, 7, 7, 9, 8, 8 };
// 0, ten, twenty, thirty, forty, fifty, sixty, seventy, eighty, ninety
int tens [10] = { 0, 3, 6, 6, 5, 5, 5, 7, 6, 6 };

//handles any number in range [1,999]
int lettersForNum( int n )
{
  n = n % 1000; // ensures n is within bounds
  int total = 0;

  if ( (n / 100) != 0 ) { //hundreds place if necessary
    total = total + digits[ n/100 ] + 10; // + 10 is for "hundred and"
    if ( n%100 == 0 ) // gets rid of "and" letters for 100,200,etc.
      total -= 3;
  }
  int tensD = (n/10)%10;
  if ( tensD != 0 ) { //tens place if necessary
    if (tensD == 1) {
      total += teens[n%10];
      printf("int: %3d needs: %2d\n",n,total);
      return total; // done if used teens
    } else {
      total += tens[tensD];
    }
  }
  total += digits[n%10];

  printf("int: %3d needs: %2d\n",n,total);

  return total;
}

int totalForRange(int min, int max) {
   int total = 0;
    for ( int n = min; n <= max; n ++ ) {
      total += lettersForNum(n);
    }
    return total;
}

int main( int argc, char** argv )
{
  int total;
  if (argc == 3) {
    total = totalForRange(atoi(argv[1]), atoi(argv[2]));
  } else {
    total = totalForRange(1, 999);
  }
    total += 11; // adds in for "one thousand"
    printf("letters used: %d\n",total);
}
