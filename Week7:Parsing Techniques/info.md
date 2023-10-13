# Comprehensive Compiler Construction Tutorials and Exercises

## Group Members
Joseph Dua Vunanga - 136371  <br>
Lee Leonard Sangoroh - 134327 <br>
Sydney Gabriel Temba - 135255 <br>
Michelle Were Ambunya - 135200

## Task Three 

### a. Output Screenshot(s) for task three

#### Screenshot one
![image](https://github.com/jeffvun/compiler-tutorials-ics4b/assets/61079370/3f976ef9-7b9e-49fb-8eef-3a2bc1e44941)

### Screenshot two
![image](https://github.com/jeffvun/compiler-tutorials-ics4b/assets/61079370/9306ae26-52fa-40b9-87ce-a29f4f09be0d)


## Task Four 

### a. Generating a parser
To demonstrate how to generate a parser using YACC (Yet Another Compiler Compiler) and Flex (Fast Lexical Analyzer), we'll create a simple calculator program.

#### Generate the lexer and parser files:

```bash
flex task4_lexer.l
yacc -d task4_parser.y
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
Eg: You can enter expressions like ``` 2 + 3 * (4 - 1) =  ```   and see the calculated result.


### b. Implementing Operator Precedence

Operator precedence implementation was included in the `task4_parser.y` file. This is achieved using the  `%left` , `%right` , and `%nonassoc`  directives. These directives specify how operators are grouped and applied in expressions.

From our code file we had:
``` Yacc

%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

```
Which means that in order to calculate an expression with multiple operators such as `a+b*c-d/e`, it would be evaluated from left to right.

`%left '+' '-'`: addition over substraction from left to right
<br>`%left '*'` `/`: multiplication over division from left to right

`%nonassoc UMINUS`: This directive specifies that the unary minus operator (-) has non-associative precedence i.e. cannot group with other operators of the same precedence level.

### c. Output
![image](https://github.com/jeffvun/compiler-tutorials-ics4b/assets/61079370/5d0dba07-49d4-4938-bdeb-2552124677f7)


