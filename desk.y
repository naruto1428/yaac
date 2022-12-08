%{
#include <ctype.h>
#include <stdio.h>
int yylex();
int yyerror();
%}
%token DIGIT
%%
line :expr '\n'         {printf("%d\n",$1);exit(0);}
     ;
expr :expr'+'term {$$=$1+$3;}
 |term           {}
;
term :term'*' factor {$$=$1*$3;}
 |factor            {}
;
factor: '('expr')' {$$=$2;}
 |DIGIT          {}
 ;
%%

int main()
{
printf("Enter the expression:\n");
yyparse();
return 0;
}
