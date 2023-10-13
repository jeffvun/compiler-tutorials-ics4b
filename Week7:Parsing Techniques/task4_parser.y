%{
#include <stdio.h>

extern int yylex();
extern void yyerror(const char *s);

%}

%union {
    int number;  // Type for the NUMBER token
}

%token <number> NUMBER
%type <number> expr

// Operator precedence implementation
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS



%%

calc:   expr  { printf("Result: %d\n", $1); }
    ;

expr:   expr '+' expr  { $$ = $1 + $3; }
    | expr '-' expr  { $$ = $1 - $3; }
    | expr '*' expr  { $$ = $1 * $3; }
    | expr '/' expr  
    { 
        if ($3 == 0) { 
            yyerror("Division by zero"); $$ = 0; 
        } else $$ = $1 / $3; 
    }
    | '(' expr ')'    { $$ = $2; }
    | '-' expr %prec UMINUS  { $$ = -$2; }
    | NUMBER          { $$ = $1; }
    ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}
