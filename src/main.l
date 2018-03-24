%{
#include <stdio.h>
#include <string.h>
#include "ccc_lib.h"

char c[100], c1[100], c2[100];
int i, n, j, z=0, erro=0;
%}

%%
"_"[a-z]*[ \t\n]*[A-Z] {
	erro=1;
}
[a-z]*[ \t\n]*[A-Z]+"_"+ {
	erro=1;
}
^[A-Z][a-z] {
	strcpy(c1, yytext);
	strcpy(c2, yytext);
	c1[99] = 1;
	camelcase_to_underline(c1, c2);
	c[z]=c2[0]; c[z+1]=c2[1];
	z= z+2;
 
}
^[a-z] {
	strcpy(c2, yytext);
	c[z]=c2[0]-32;
	z++;
}
[a-z]?[A-Z][a-z] {
	strcpy(c1, yytext);
	strcpy(c2, yytext);
	c1[99] = 2;
	camelcase_to_underline(c1, c2); 
	n = strlen(c1);
	for (j=0; j<=n; j++){
			c[z]=c2[j];
			z++;
	}	
}
"_"[a-z]+ {
	strcpy(c1, yytext);
	strcpy(c2, yytext);
	underline_to_camelcase(c1, c2); 
	n = strlen(c1);
	for (j=0; j<=n-2; j++){
			c[z]=c2[j];
			z++;
	}	
}
. {		
	strcpy(c2, yytext);
	c[z]=c2[0];
	z++;
} ;
\n ;


%%
int main(){
	yylex();
	if (erro==0) printf("%s\n", c);
	else printf("ERRO\n");
	return (0);
}


