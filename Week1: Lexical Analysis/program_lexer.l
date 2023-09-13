/*Developed by Joseph and Lee. This lexer generated from these specifications will tokenize an input program : identifying integers, identifiers, keywords, operators, and special characters. It will print each token with its corresponding category, making it easy to analyze the input program's lexical structure.*/

/* Definitions section */
%{
#include <stdio.h> 

int num_identifiers = 0;
int num_keywords = 0;
int num_unrecognized = 0;

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
    else if(strcmp(str, "input") == 0) { printf("KEYWORD: input\n"); }
    else if(strcmp(str, "printf") == 0) { printf("KEYWORD: printf\n"); }
    else if(strcmp(str, "const") == 0) { printf("KEYWORD: const\n"); }
    else{
        printf("IDENTIFIER: %s\n", str);
        num_identifiers++;
    }
    num_keywords++;
}

#define RED_COLOR "\x1B[31m"
#define GREEN_COLOR "\x1B[32m"
#define RESET_COLOR "\x1B[0m"

%}

%option noyywrap  
%x STRING

/*Rules section */

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
","                     { printf("COMMA: ,\n"); }

"\""                    {BEGIN (STRING); printf("OPENING QUOTE: %s\n", yytext); }
<STRING>[^"]+           { printf("STRING LITERAL: %s\n", yytext); }
<STRING>"\""            { BEGIN(INITIAL); printf("CLOSING QUOTE: %s\n", yytext); }

[ \t\n]                 ;  // Ignore whitespace and newline characters
. { 
    printf(RED_COLOR "UNKNOWN CHARACTER: %s\n" RESET_COLOR, yytext); 
    num_unrecognized++;
}

%%

void summary(){
    printf("\nNumber of identifiers: %d\n", num_identifiers);
    printf("Number of keywords: %d\n", num_keywords - num_identifiers);
    printf("Number of unrecognized characters: %d\n", num_unrecognized);

    if(num_unrecognized > 0){
        printf(RED_COLOR "\nThe language is considered invalid\n");
        printf("Please check the input program for errors\n" RESET_COLOR);
    }
    else{
        printf(GREEN_COLOR "\nThe language is valid\n" RESET_COLOR);
    }

}

int main( int argc, char* argv[]) {
    if (argc != 2){
        printf("Normal Use: ./scan <input_file>\n");
        printf("Input the testing program from the terminal: ");
        yylex();
        return 1;
    }

    FILE* inputFile = fopen(argv[1], "r");

    if (inputFile == 0){
        printf("Could not open file %s\n", argv[1]);
        return 1;
    }

    yyin = inputFile;
    yylex();
    fclose(inputFile);

    summary();

    return 0;
}
