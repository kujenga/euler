#include <stdio.h>

#include "palindrome.h"

int main() {
  int sum = 0;
  for (int i = 0; i < 1000000; i++) {
    if (isPalindrome(i, 10) && isPalindrome(i, 2)) {
      printf("palindrome in base 10 and 2: %d\n", i);
      sum += i;
    }
  }

  printf("%d\n", sum);

  return 0;
}
