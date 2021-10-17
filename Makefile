FROM ?= 1
TO ?= 100

all:
	gcc fizzbuzz.c
	./a.out ${FROM} ${TO} > answer.txt
	perl fizzbuzz-regexp.pl ${FROM} ${TO} > result.txt

diff:
	diff -s${OPTION} answer.txt result.txt || :
