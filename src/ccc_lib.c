#include <stdio.h>
#include <string.h>
#include "ccc_lib.h"
int n, i, j;
void camelcase_to_underline(char *input, char *output) {
	n = strlen(input);

	if (input[99]==1) {
output[0] = input[0] + 32;
	}
	else {
		for (i=0; i<=n; i++){
			if (input[i]>=65 && input[i]<=90) {
					output[i] = 95;
					output[i+1]= input[i] + 32;
					for(j=i+2; j<=n+1; j++){	
							output[j]=input[j-1];
						}
				}			
			}
}
  return;
}

void underline_to_camelcase(char *input, char *output) {
	n = strlen(input);
	for (i=0; i<n; i++){
				output[i] = input [i+1];
			}
	output[0] -= 32;
  return;
}




