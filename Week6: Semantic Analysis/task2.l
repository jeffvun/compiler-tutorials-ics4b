%{
#include <stdio.h>

#define RED_COLOR "\x1B[31m"
#define GREEN_COLOR "\x1B[32m"
#define RESET_COLOR "\x1B[0m"

%}

%%
[a-zA-Z_][a-zA-Z0-9_]*   { printf("Valid Identifier: %s\n", GREEN_COLOR yytext RESET_COLOR ); }
.                        { printf(RED_COLOR "Invalid Identifier: %s\n", yytext RESET_COLOR ); }
%%

int main() {
    yylex();
    return 0;
}
