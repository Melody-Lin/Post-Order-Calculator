%{
#include <stdio.h>
void yyerror(const char *message);
float ans;
float tmp;
int bool=0;
%}
%union{
  float fval;
}
%token <fval> FNUMBER
%type <fval> expr
%left '+' '-'
%left '*' '/'
%%
line: expr { ans=$1; }
    ;
expr: expr expr '+' { $$=$1+$2; }
    | expr expr '-' { $$=$1-$2; } 
    | expr expr '*' { $$=$1*$2; }
    | expr expr '/' { $$=$1/$2; }
    | FNUMBER { $$=$1; }
    ;
%%
void yyerror(const char *message){
  printf("Wrong Formula");
  bool=1;
}
int main(){
  yyparse();
  ans=ans*100;
  tmp=(int)ans%10;
  if(tmp>4) { ans=ans-tmp+10; }
  ans=ans/100;
  if(bool==0) { printf("%.1lf",ans); }
  return (0);
}