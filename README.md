# fizzbuzz-regexp

FizzBuzz in RegExp

```console
$ FROM=57000000 TO=58000000 make
gcc fizzbuzz.c
./a.out 57000000 58000000 > answer.txt
perl fizzbuzz-regexp.pl 57000000 58000000 > result.txt
$ make diff
diff -s answer.txt result.txt || :
Files answer.txt and result.txt are identical
```
