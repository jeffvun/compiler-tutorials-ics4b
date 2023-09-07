/*Developed by Joseph and Lee. This lexer generated from these specifications will tokenize an input program : identifying integers, identifiers, keywords, operators, and special characters. It will print each token with its corresponding category, making it easy to analyze the input program's lexical structure.*/

%{
#include <stdio.h>
%}

%option noyywrap  

%%

[0-9]+              { printf("INTEGER: %s\n", yytext); } 
[a-zA-Z_][a-zA-Z0-9_]* { printf("IDENTIFIER: %s\n", yytext); } /*
Defining the accepted nomencalture for variables, functions and others entities for the Programming Language and etc...
Identifiers must start with a letter or underscore and can be followed by letters, digits, or underscores.
*/

"if"                { printf("KEYWORD: if\n"); }
"else"              { printf("KEYWORD: else\n"); }
"while"             { printf("KEYWORD: while\n"); }
"for"               { printf("KEYWORD: for\n"); }
"break"             { printf("KEYWORD: break\n"); }

"char"              { printf("KEYWORD: char\n"); }
"string"            { printf("KEYWORD: string\n"); }
"int"               { printf("KEYWORD: int\n"); }
"long"              { printf("KEYWORD: long\n"); }
"float"             { printf("KEYWORD: float\n"); }
"double"            { printf("KEYWORD: double\n"); }

"void"              { printf("KEYWORD: void\n"); }
"return"            { printf("KEYWORD: return\n"); }

"=="                { printf("EQUALITY OPERATOR: ==\n"); }
"!="                { printf("INEQUALITY OPERATOR: !=\n"); }
"<"                 { printf("LESS THAN OPERATOR: <\n"); }
">"                 { printf("GREATER THAN OPERATOR: >\n"); }
"<="                { printf("LESS THAN OR EQUAL TO OPERATOR: <=\n"); }
">="                { printf("GREATER THAN OR EQUAL TO OPERATOR: >=\n"); }

[+\*/-\^]           { printf("ARITHMERIC OPERATOR")} /*
regular expression for arhtimetic operations which includes addition, substraction, multiplication, division and exponentiation */
"="                 { printf("ASSIGNMENT OPERATOR: =\n"); }
[|&]{2}|!           { printf("LOGICAL OPERATOR")} /*regular expression for logical operations which includes AND -- &&, OR -- ||, NOT -- !*/

"("                 { printf("LEFT PARENTHESIS: (\n"); }
")"                 { printf("RIGHT PARENTHESIS: )\n"); }
"{"                 { printf("LEFT BRACE: {\n"); }
"}"                 { printf("RIGHT BRACE: }\n"); }

";"                 { printf("SEMICOLON: ;\n"); }
[ \t\n]             ;  // Ignore whitespace and newline characters

.                   { printf("UNKNOWN CHARACTER: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}