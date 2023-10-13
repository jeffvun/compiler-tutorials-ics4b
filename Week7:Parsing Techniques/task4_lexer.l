%{
#include "y.tab.h" // Include the YACC-generated header file
%}

%%

[0-9]+          { yylval.number = atoi(yytext); return NUMBER; }
[-+*/()=]       { return yytext[0]; }

[ \t\n]         ; // Skip whitespace and newlines
.               { fprintf(stderr, "Unexpected character: %s\n", yytext); }

%%

int yywrap() {
    return 1; // End of input
}
