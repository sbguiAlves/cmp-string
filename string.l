%{

#include <stdio.h>
#include <string.h>
#include "string.tab.h"

void read_string();
%}

%%

#.*		{/* comentario de uma linha*/}


"("			{return '(';}
")"			{return ')';}
"{"			{return '{';}
"}"			{return	'}';}

","			{return OR_OP;}
";"			{return AND_OP;}

"<a>"			{return TOK_AOPEN;}
"</a>"			{return TOK_ACLOSE;}
"ou"			{return TOK_OU;}

[a-zA-Z][A-Za-z0-9]* 	{yylval.ident = strdup(yytext);
				return IDENT;}

"'"			{read_string();
			 return TOK_STR;}

[ \t\n] 		{}
.			{return yytext[0];}
			/*nao reconhecido - expect/ unexpected*/

%%

void read_string(){
	char c;
	char aux[100];
	int i=0;

	while((c = input()) != '\'' && c != 0){
		aux[i]=c;
		i++;				
	}

	if(c=='\'') yylval.str=strdup(aux);
	else printf("String declarada incorretamente!\n");
}

int yywrap(){
	return 1;
}
