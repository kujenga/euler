#include "./Unity/src/unity.h"
#include "palindrome.h"

void setUp(void) {
  // set stuff up here
}

void tearDown(void) {
  // clean stuff up here
}

struct tc {
  int input;
  int base;
  bool output;
};

void test_is_palindrome(void) {
  struct tc tcs[] = {
      // base 10 palindromes
      {0, 10, true},
      {1, 10, true},
      {7, 10, true},
      {22, 10, true},
      {585, 10, true},
      {1023201, 10, true},
      // base 2 palindromes
      {0, 2, true},
      {1, 2, true},
      {3, 2, true},
      {5, 2, true},
      {585, 2, true},
      // base 10 non-palindromes
      {12, 10, false},
      {1234, 10, false},
      {1041, 10, false}, // NOTE: Verifies earlier bug
      {12345321, 10, false},
      // base 2 non-palindromes
      {2, 2, false},
  };
  int tcLen = sizeof tcs / sizeof tcs[0];
  char buffer[100];
  for (int i = 0; i < tcLen; i++) {
    struct tc c = tcs[i];
    snprintf(buffer, 100, "expected is_palindrome %d for %d", c.output,
             c.input);
    TEST_ASSERT_EQUAL_MESSAGE(c.output, isPalindrome(c.input, c.base), buffer);
  }
}

// not needed when using generate_test_runner.rb
int main(void) {
  UNITY_BEGIN();
  RUN_TEST(test_is_palindrome);
  return UNITY_END();
}
