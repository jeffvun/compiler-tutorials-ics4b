%{
#include <stdio.h>

#define RED_COLOR "\x1B[31m"
#define GREEN_COLOR "\x1B[32m"
#define RESET_COLOR "\x1B[0m"

%}

%x comment

COMMENT_START "/*"
COMMENT_END "*/"

%%
{COMMENT_START}                 { printf("Comment Start: %s\n", yytext); BEGIN(comment); }
<comment>{COMMENT_END}          { printf("Comment End: %s\n", yytext); BEGIN(INITIAL); }

\/\/[^\n]*                      { printf("Single Line Comment: %s\n", yytext); }
\n                              ;

.                               { printf("Code: %s", yytext); }
%%

int main(int argc, char* argv[]) {
    int in_comment = 0; // Flag to track whether currently in a comment

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

    char current_line[1024]; // Assuming a maximum line length of 1024 characters

    while (fgets(current_line, sizeof(current_line), yyin) != NULL) {
        // Check if the current line contains the start of a comment
        if (strstr(current_line, "/*") != NULL) {
            in_comment = 1;
            printf("\n Comment Start: %s", current_line);
        }

        // Check if the current line contains the end of a comment
        if (strstr(current_line, "*/") != NULL) {
            in_comment = 0;
            printf("Comment End: %s", current_line);
            printf("\n");
        }

        // Check if the current line contains a single-line comment
        if (strstr(current_line, "//") != NULL) {
            printf("\n Single Line Comment: %s", current_line);
            printf("\n");
        }

        // Print the line as code or comment based on the flag
        else if (in_comment) {
            printf("Comment: %s", current_line);
        } else {
            printf("Code: %s", current_line);
        }
    }

    fclose(file);
    return 0;
}
