%{
#include "yourPostCalc.tab.h"
%}
%%
\n { return(0); }
[0-9]+ { yylval.fval=atof(yytext); return(FNUMBER); }
[0-9]+\.[0-9]+ { yylval.fval=atof(yytext); return(FNUMBER); }
"+"|"-"|"*"|"/" { return(yytext[0]); }
[ \t]+ {}
%%