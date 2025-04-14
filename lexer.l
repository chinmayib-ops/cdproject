%{
#include "parser.tab.h"
%}

DIGIT       [0-9]
IDENTIFIER  [a-zA-Z_][a-zA-Z0-9_]*
%%
"var"           { return VAR; }
"="             { return ASSIGN; }
"+"             { return ADD_OP; }
"-"             { return ADD_OP; }
"*"             { return MUL_OP; }
"/"             { return MUL_OP; }
{IDENTIFIER}    { yylval.str = strdup(yytext); return IDENTIFIER; }
{DIGIT}+        { yylval.num = atoi(yytext); return LITERAL; }
[ \t\n]+        ; /* Ignore whitespace */
.               { printf("Unknown character: %s\n", yytext); }

%%
