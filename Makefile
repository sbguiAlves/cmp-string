all:
	flex string.l
	bison -d string.y
	gcc string.tab.c lex.yy.c -o cmp
