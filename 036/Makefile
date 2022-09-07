# Build program for euler 36

main.o: main.c palindrome.c
	clang -Wall -o $@ $^

.PHONY: run
run: main.o
	./$<

Unity/src/unity.c:
	git clone git@github.com:ThrowTheSwitch/Unity.git

test.o: test_palindrome.c palindrome.c Unity/src/unity.c
	clang -Wall -o $@ $^

.PHONY: test
test: test.o
	./$<
