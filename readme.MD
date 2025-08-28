# Plantilla para TP Integrador usando Flex y Bison (C)

## Prerequisitos. 

Para poder usar esta plantilla deberá:

1. Instalar [flex](https://github.com/westes/flex)

2. Instalar [bison](https://www.gnu.org/software/bison/)

3. Instalar [gcc](https://gcc.gnu.org/)

## Que hace el script run.sh?
```bash
    # 1. Ejecuta el programa flex, enviandole como parametro lo que nosotros definimos en el lexico.l (que son las expresiones regulares y los tokens)
    flex lexico.l

    # 2. Ejecuta el programa bison, enviandole como parametro lo que nosotros definimos en el sintactico.y, los parametros -dyv hacen lo siguiente:
    # -d -> genera un archivo de cabecera y.tab.h con las definiciones de los tokens
    # -y -> produce el archivo y.tab.c
    # -v -> genera el archivo y.output con un informe de los estados del automata LR
    bison -dyv sintactico.y

    # 3. Se compila el Analizador Lexico y el Analizador Sintactico con GCC
    gcc lex.yy.c y.tab.c -o compilador

    # 4. Ejecutamos el compilador recien creado, pasandole como parametro el archivo de test.txt
    ./compilador test.txt

    # 5. Eliminamos los archivos que se generaron
    rm lex.yy.c
    rm y.tab.c
    rm y.output
    rm y.tab.h
    rm compilador
```