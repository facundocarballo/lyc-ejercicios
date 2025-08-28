%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

char *yyltext;


int yyerror(void);

%}

%option noyywrap  
%option yylineno 

DIGITO	    [0-9]
LETRA_MAYUS	[A-Z]

PATENTE {LETRA_MAYUS}{LETRA_MAYUS}({LETRA_MAYUS}{DIGITO}{DIGITO}{DIGITO}|{DIGITO}{DIGITO}{DIGITO}{LETRA_MAYUS}{LETRA_MAYUS})

%%

{PATENTE}	{printf("PATENTE: %s\n", yytext); return PATENTE;}

"\n"      		
"\t"
"\n\t"
" "             		
"\r\n"
.			 { printf( "ERROR LEXICO : Caracter no reconocido: %s\n", yytext ); exit (0);}


