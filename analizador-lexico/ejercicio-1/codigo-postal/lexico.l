%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

char *yyltext;


int yyerror(void);

%}

%option noyywrap  
%option yylineno 

DIGITO			[0-9]
DIGITO_MAYOR_A_CERO [1-9]

COD_POSTAL {DIGITO_MAYOR_A_CERO}{DIGITO}{DIGITO}{DIGITO}

%%

{COD_POSTAL}	{printf("COD_POSTAL: %s\n", yytext);return COD_POSTAL;}
"\n"      		
"\t"
"\n\t"
" "             		
"\r\n"
.			 { printf( "ERROR LEXICO : Caracter no reconocido: %s\n", yytext ); exit (0);}


