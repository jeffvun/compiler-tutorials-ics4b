%{
#include <stdio.h>
%}

COMMENT_START "/*"
COMMENT_END "*/"

%%
{COMMENT_START}     { printf("Comment Start: %s\n", yytext); BEGIN(comment); }
<comment>{COMMENT_END}       { printf("Comment End: %s\n", yytext); BEGIN(INITIAL); }
<comment>.        ;  // Ignore characters inside comments

\/\/[^\n]*          { printf("Single Line Comment: %s\n", yytext); }
\n                 ;  // Ignore newlines

.                  { printf("Code: %s\n", yytext); }
%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        printf("Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    FILE* file = fopen(argv[1], "r");
    if (file == NULL) {
        perror("Error opening file");
        return 1;
    }

    yyin = file;
    yylex();

    fclose(file);
    return 0;
}
