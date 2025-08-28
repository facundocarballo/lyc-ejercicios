// Usa Lexico_ClasePractica
//Solo expresiones sin ()
%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"

int yystopparser=0;
FILE  *yyin;

  void yyerror(const char *s);
  int yylex();


%}

%token PATENTE

%%
sentencias: sentencias sentencia | 
            sentencia;
sentencia:
        PATENTE {} ;
%%

int main(int argc, char *argv[])
{
    if((yyin = fopen(argv[1], "rt"))==NULL)
    {
        printf("\nNo se puede abrir el archivo de prueba: %s\n", argv[1]);
       
    }
    else
    { 
        
        yyparse();
        
    }
	fclose(yyin);
        return 0;
}

void yyerror(const char *s)
{
    printf("Error Sintactico\n");
	exit (1);
}

