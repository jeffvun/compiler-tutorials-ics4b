%{
#include <stdio.h>

#define RED_COLOR "\x1B[31m"
#define GREEN_COLOR "\x1B[32m"
#define RESET_COLOR "\x1B[0m"

%}

%%
[a-zA-Z_][a-zA-Z0-9_]*   { printf(GREEN_COLOR "Valid Identifier: %s\n" RESET_COLOR, yytext); }
.                        { printf(RED_COLOR "Invalid Identifier: %s\n" RESET_COLOR, yytext); }
%%

int main() {
    yylex();
    return 0;
}
