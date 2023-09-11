/*Developed by Joseph and Lee. This lexer generated from these specifications will tokenize an input program : identifying integers, identifiers, keywords, operators, and special characters. It will print each token with its corresponding category, making it easy to analyze the input program's lexical structure.*/

%{
#include <stdio.h> 

/*
A function to check for identifiers and keywords */

void checker(char * str){
    if(strcmp(str, "if") == 0){printf("KEYWORD: if\n"); }
    else if(strcmp(str, "else") == 0) { printf("KEYWORD: else\n"); }
    else if(strcmp(str, "else if") == 0) { printf("KEYWORD: else if\n"); }
    else if(strcmp(str, "while") == 0) { printf("KEYWORD: while\n"); }
    else if(strcmp(str, "for") == 0) { printf("KEYWORD: for\n"); }
    else if(strcmp(str, "break") == 0) { printf("KEYWORD: break\n"); }
    else if(strcmp(str, "char") == 0) { printf("KEYWORD: char\n"); }
    else if(strcmp(str, "string") == 0) { printf("KEYWORD: sring\n"); }
    else if(strcmp(str, "int") == 0) { printf("KEYWORD: int\n"); }
    else if(strcmp(str, "long") == 0) { printf("KEYWORD: long\n"); }
    else if(strcmp(str, "float") == 0) { printf("KEYWORD: float\n"); }
    else if(strcmp(str, "double") == 0) { printf("KEYWORD: double\n"); }
    else if(strcmp(str, "void") == 0) { printf("KEYWORD: void\n"); }
    else if(strcmp(str, "return") == 0) { printf("KEYWORD: return\n"); }
    else if(strcmp(str, "continue") == 0) { printf("KEYWORD: continue\n"); }
    else if(strcmp(str, "const") == 0) { printf("KEYWORD: const\n"); }
    else{printf("IDENTIFIER: %s\n", str);}
}

%}

%option noyywrap  

%% 

[0-9]+                  { printf("INTEGER: %s\n", yytext); } 
[a-zA-Z_][a-zA-Z0-9_]*  { checker(yytext); }

=                       { printf("ASSIGNMENT OPERATOR: =\n"); }
"=="                    { printf("EQUALITY OPERATOR: ==\n"); }
"!="                    { printf("INEQUALITY OPERATOR: !=\n"); }
"<"                     { printf("LESS THAN OPERATOR: <\n"); }
">"                     { printf("GREATER THAN OPERATOR: >\n"); }
"<="                    { printf("LESS THAN OR EQUAL TO OPERATOR: <=\n"); }
">="                    { printf("GREATER THAN OR EQUAL TO OPERATOR: >=\n"); }

[+\*/-\^]               { printf("ARITHMETIC OPERATOR: %s\n", yytext); }
[|&]{2}|!               { printf("LOGICAL OPERATOR: %s\n", yytext); }

"("                     { printf("LEFT PARENTHESIS: (\n"); }
")"                     { printf("RIGHT PARENTHESIS: )\n"); }
"{"                     { printf("LEFT BRACE: {\n"); }
"}"                     { printf("RIGHT BRACE: }\n"); }

[ \t\n]                 ;  // Ignore whitespace and newline characters
.                       { printf("UNKNOWN CHARACTER: %s\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}