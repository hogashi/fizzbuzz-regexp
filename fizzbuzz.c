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
    if (i % 3 == 0 && i % 5 == 0) {
      printf("FizzBuzz\n");
    } else if (i % 3 == 0) {
      printf("Fizz\n");
    } else if (i % 5 == 0) {
      printf("Buzz\n");
    } else {
      printf("%d\n", i);
    }
  }
  return 0;
}
