#include <stdio.h>
#include <stdlib.h>
int main(int argc, char** argv) {
  int limit = 100;
  int i;
  if (argc > 1) {
    limit = atoi(argv[1]);
  }
  for (i = 1; i <= limit; i++) {
    if (i % 3 == 0) {
      printf("Fizz");
    }
    if (i % 5 == 0) {
      printf("Buzz");
    }
    if (i % 3 != 0 && i % 5 != 0) {
      printf("%d", i);
    }
    printf("\n");
  }
  return 0;
}
