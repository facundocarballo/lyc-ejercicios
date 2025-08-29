%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

char *yyltext;


int yyerror(void);

%}

%option noyywrap  
%option yylineno 

SUMA "+"
COMENTARIO \#\+.*\+\#


%%

{COMENTARIO} {}
{SUMA} {printf("SUMA: %s\n", yytext); return SUMA;}

"\n"      		
"\t"
"\n\t"
" "             		
"\r\n"
.			 { printf( "ERROR LEXICO : Caracter no reconocido: %s\n", yytext ); exit (0);}


