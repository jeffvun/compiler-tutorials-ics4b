# Comprehensive Compiler Construction Tutorials and Exercises

## Group Members
Joseph Dua Vunanga - 136371  <br>
Lee Leonard Sangoroh - 134327 <br>
Sydney Gabriel Temba - 135255

## Task Three 



## Task Four 

### a. Generating a parser
To demonstrate how to generate a parser using YACC (Yet Another Compiler Compiler) and Flex (Fast Lexical Analyzer), we'll create a simple calculator program.

#### Generate the lexer and parser files:

```bash
flex lexer.l
yacc -d parser.y
```
This will create lex.yy.c, y.tab.c, and y.tab.h.

#### Compile the lexer and parser:

```bash
gcc -o calculator y.tab.c lex.yy.c -lm
```

#### Run the calculator:

```bash
./calculator
```
You can then enter expressions like 2 + 3 * (4 - 1) and see the calculated result.


### b. Implementing Operator Precedence