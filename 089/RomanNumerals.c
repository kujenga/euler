// (c) 2013 Aaron M. Taylor
// This program calculates the answer to Project Euler problem 89

#import <stdio.h>
#import <stdlib.h>
#import <strings.h>

int numeralValue( char c );

// this method calculates the decimal value of a roman numeral 
// also puts the length of the string into curLen
int rnToInt (char* roman, int* curLen)
{
  int total = 0;
  int cur = 0;
  int last = 1001;
  while ( *roman != 0 ) {
    cur = numeralValue( *roman ); // value of current numeral
    if ( cur > last ) { // subtractive case, remove value of last numeral and subtract from current
      total = (total - last) + (cur - last);
    } else { // simple case, add in value of current numeral
      total += cur;
    }
    last = cur;
    //printf ( "%c ",*roman );
    roman++;
    (*curLen)++;
  }
  return total;
}

// this method calculates the minimal length of a roman numeral for the given integer
int lengthOfMinRN (int n)
{
  int nUsed;
  int cur = 0;
  int last = 0;
  for ( nUsed = 0; n != 0; ) {
    if ( n >= 1000 ) { // M
      n -= 1000;
      nUsed++;
    } else if ( n >= 900 ) { // CM
      n -= 900;
      nUsed += 2;
    } else if ( n >= 500 ) { // D
      n -= 500;
      nUsed++;
    } else if ( n >= 400 ) { // CD
      n -= 400;
      nUsed += 2;
    } else if ( n >= 100 ) { // C
      n -= 100;
      nUsed++;
    } else if ( n >= 90 ) { // XC
      n -= 90;
      nUsed += 2;
    } else if ( n >= 50 ) { // L
      n -= 50;
      nUsed++;
    } else if ( n >= 40 ) { // XL
      n -= 40;
      nUsed += 2;
    } else if ( n >= 10 ) { // X
      n -= 10;
      nUsed ++;
    } else if ( n >= 9 ) { // IX
      n -= 9;
      nUsed += 2;
    } else if ( n >= 5 ) { // V
      n -= 5;
      nUsed++;
    } else if ( n >= 4 ) { // IV
      n -= 4;
      nUsed += 2;
    } else {  // I
      n --;
      nUsed++;
    }
    //printf( "nUsed:%d n:%d | ",nUsed,n);
  }
  //puts("");
  return nUsed;
}

int main (int argc, char** argv)
{
  FILE* f = fopen("roman.txt","r");
  int total = 0;
  char* str = malloc(BUFSIZ);
  for ( int i = 0; (i < 10000) && (EOF != fscanf(f,"%s\n",str)); i++ ) {
    int curLen = 0;
    int val = rnToInt(str,&curLen);
    int minLen = lengthOfMinRN(val);
    //printf( "%4d : %15s : cur %2d min %2d\n",val,str,curLen,minLen);
    total += (curLen - minLen);
  }
  fclose(f);
  printf("\nnumerals saved: %d\n\n",total);
}

// this method returns the value of a single roman numeral
int numeralValue( char c ) {
  switch ( c )
  {
  case 'I':
    return 1;
  case 'V':
    return 5;
  case 'X':
    return 10;
  case 'L':
    return 50;
  case 'C':
    return 100;
  case 'D':
    return 500;
  case 'M':
    return 1000;
  default:
    return 0xffffffff;
  }
}
