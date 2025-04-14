%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(const char *s);
extern int yylex();
// Declare yyin so that we can assign to it in main.
extern FILE *yyin;
%}

%union {
    int num;
    char *str;
}

%token VAR ASSIGN ADD_OP MUL_OP IDENTIFIER LITERAL
%type <num> LITERAL
%type <str> IDENTIFIER

%%
Program: StatementList ;

StatementList: Statement 
             | Statement StatementList ;

Statement: Declaration 
         | Expression ;

Declaration: VAR IDENTIFIER ASSIGN Expression 
           {
               printf("Valid Declaration: %s\n", $2);
           };

Expression: Term 
          | Term ADD_OP Term 
          | Term MUL_OP Term ;

Term: IDENTIFIER 
    | LITERAL ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror(argv[1]);
            exit(EXIT_FAILURE);
        }
        yyin = file;
    } else {
        // Optionally, prompt for input if no file is provided.
        printf("No input file specified. Reading from standard input...\n");
    }
    yyparse();
    return 0;
}
