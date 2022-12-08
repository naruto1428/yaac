%{
#include<ctype.h>
#include<stdio.h>
int yylex();
int yyerror();
%}
%token NUM
%left '+''-'
%left '*''/''%'
%right NEGATIVE
%%
S:E"\n"{printf("\n");return 0;}
E:E'+'  {printf("+");}
 |E '*' E {printf("*");}
 |E '-' E {printf("-");}
 |E '/' E {printf("/");}
 |E '%' E {printf("mod");}
 |'('E')' 
 |'-' E %prec NEGATIVE{printf("-");}
 |NUM {printf("%d",yylval);}
 ;
%%
int main()
{
printf("Enter the expression:\n");
yyparse();
return 0;
}   
