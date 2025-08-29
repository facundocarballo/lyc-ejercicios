%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

char *yyltext;


int yyerror(void);

%}

%option noyywrap  
%option yylineno 

LETRAS_MINUSCULAS	[a-z]
DIGITOS				[0-9]

SIMBOLO_GUION_BAJO        [_]
SIMBOLO_GUION_MEDIO      [-]
SIMBOLO_ARROBA           [@]
SIMBOLO_MAS      [+]

DOMINIO_UNLAM "unlam.edu.ar"
DOMINIO_YAHOO "yahoo.com"
DOMINIO_YAHOO_ARG "yahoo.com.ar"
DOMINIO_GMAIL "gmail.com"
DOMINIO_HOTMAIL "hotmail.com"

NOMBRE_DESTINATARIO {LETRAS_MINUSCULAS}({LETRAS_MINUSCULAS}|{DIGITOS}|{SIMBOLO_GUION_BAJO}|{SIMBOLO_GUION_MEDIO})*({SIMBOLO_MAS}({LETRAS_MINUSCULAS}|{DIGITOS})({LETRAS_MINUSCULAS}|{DIGITOS}|{SIMBOLO_GUION_MEDIO})*)?
CORREO_ELECTRONICO {NOMBRE_DESTINATARIO}{SIMBOLO_ARROBA}({DOMINIO_UNLAM}|{DOMINIO_YAHOO}|{DOMINIO_YAHOO_ARG}|{DOMINIO_GMAIL}|{DOMINIO_HOTMAIL})

%%

{CORREO_ELECTRONICO}	{printf("CORREO_ELECTRONICO: %s\n", yytext); return CORREO_ELECTRONICO;}

"\n"      		
"\t"
"\n\t"
" "             		
"\r\n"
.			 { printf( "ERROR LEXICO : Caracter no reconocido: %s\n", yytext ); exit (0);}


