#include <stdio.h>
#include <stdlib.h>
int main(int argc, char** argv) {
  int from, to;
  int i;
  if (argc < 3) {
    printf("from/to required\n");
    return 1;
  }

  from = atoi(argv[1]);
  to = atoi(argv[2]);
  for (i = from; i <= to; i++) {
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
