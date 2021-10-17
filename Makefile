all:
	gcc fizzbuzz.c
	./a.out ${LIMIT} > answer.txt
	perl fizzbuzz-regexp.pl ${LIMIT} > result.txt

diff:
	diff -s answer.txt result.txt
