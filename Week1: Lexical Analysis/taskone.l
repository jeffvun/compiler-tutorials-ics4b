%{
#include <stdio.h>

%}

/*** Rule Section has three rules, first rule
matches with capital letters, second rule
matches with any character except newline and
third rule does not take input after the enter***/
%%
\n    {return 0;}

[ \t\n]+    { /* Ignore whitespace and newline characters */ }
[a-zA-Z]+   { printf("%s\n", yytext); }  // Match and print individual words
.           { /* Ignore unrecognized characters */ }
%%
 

int yywrap(){}
int main(){
 
 
yylex();

while (yylex() != 0) ;  // Continuously tokenize and print words
    return 0;
 
return 0;
}