%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
void yyerror(const char *s);
extern int yylex();
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

int main() {
    printf("Enter your program:\n");
    yyparse();
    return 0;
}
