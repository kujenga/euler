#include<stdio.h>

int main(int argc, char** argv)
{
  int n = 20;
  while (1) {
    int good = 1;
    for (int d = 1; good && (d <= 20); d++) {
      if (n%d) good = 0;
    }
    if (good) {
      printf("smallest multiple is: %d\n",n);
      return 1;
    }
    n++;
  }
}
