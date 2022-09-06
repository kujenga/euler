#include "palindrome.h"

bool isPalindromeHelper(int i, int base, int mul);

bool isPalindrome(int i, int base) {
  if (i < base) {
    return true;
  }
  int mul = base;
  int upper = i / mul;
  while (upper >= base) {
    mul *= base;
    upper = i / mul;
  }

  return isPalindromeHelper(i, base, mul);
}

bool isPalindromeHelper(int i, int base, int mul) {
  if (mul <= 1 && i < base) {
    /* printf("i: %d (mul %d) -> true!\n", i, mul); */
    return true;
  }
  int lower = i % base;
  int upper = i / mul;

  /* printf("i: %d, lower: %d, upper: %d (mul: %d)\n", i, lower, upper, mul); */

  if (lower != upper) {
    return false;
  };

  int next = (i - (upper * mul)) / base;

  return isPalindromeHelper(next, base, mul / base / base);
}
