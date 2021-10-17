FROM ?= 1
TO ?= 100

all: get_answer get_result

get_answer:
	gcc fizzbuzz.c
	./a.out ${FROM} ${TO} > answer.txt

get_result:
	perl fizzbuzz-regexp.pl ${FROM} ${TO} > result.txt

diff:
	diff -s${OPTION} answer.txt result.txt || :
