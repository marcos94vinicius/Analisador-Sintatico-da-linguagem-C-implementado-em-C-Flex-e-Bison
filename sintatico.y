%{

#include <stdio.h>
#include<string.h>
#include<stdlib.h>
#define tamanho 100000
extern int yylex();
extern char* yytext;
extern char AUX12[tamanho], AUX13[tamanho];
extern int ajuda_sint;
extern int ajuda_lex;
extern char vets[tamanho];
extern char vets2[tamanho];
extern int coluna;
extern int lines;
int tam;
int LIN = 0;
char str9[tamanho];


%}

/* declare tokens */
%token VOID
%token INT
%token CHAR
%token RETURN
%token BREAK
%token SWITCH
%token CASE
%token DEFAULT
%token DO
%token WHILE
%token FOR
%token IF
%token ELSE
%token TYPEDEF
%token STRUCT
%token PLUS
%token MINUS
%token MULTIPLY
%token DIV
%token REMAINDER
%token INC
%token DEC
%token BITWISE_AND
%token BITWISE_OR
%token BITWISE_NOT
%token BITWISE_XOR
%token NOT
%token LOGICAL_AND
%token LOGICAL_OR
%token EQUAL
%token NOT_EQUAL
%token LESS_THAN
%token GREATER_THAN
%token LESS_EQUAL
%token GREATER_EQUAL
%token R_SHIFT
%token L_SHIFT
%token ASSIGN
%token ADD_ASSIGN
%token MINUS_ASSIGN
%token SEMICOLON
%token COMMA
%token COLON
%token L_PAREN
%token R_PAREN
%token L_CURLY_BRACKET
%token R_CURLY_BRACKET
%token L_SQUARE_BRACKET
%token R_SQUARE_BRACKET
%token TERNARY_CONDITIONAL
%token NUMBER_SIGN
%token POINTER
%token PRINTF
%token SCANF
%token DEFINE
%token EXIT
%token NUM_OCTAL
%token NUM_INTEGER
%token NUM_HEXA
%token CHARACTER
%token STRING
%token IDENTIFIER

%start S

%%

S: programa { printf("SUCCESSFUL COMPILATION."); return;}
;
	
programa: declaracoes prog1
	| funcao prog1
;

prog1: programa
	|
;
//ok

declaracoes: NUMBER_SIGN DEFINE IDENTIFIER expressao
	| declaracao_de_variaveis
	| declaracao_de_prototipos
;
//ok

funcao: tipo func1
;

func1: MULTIPLY func1
	| IDENTIFIER parametros L_CURLY_BRACKET func2
;

func2: declaracao_de_variaveis func2
	| comandos R_CURLY_BRACKET
;
//ok

declaracao_de_variaveis: tipo ddv1
;

ddv1: MULTIPLY ddv1
	| IDENTIFIER ddv2
;

ddv2:L_SQUARE_BRACKET expressao R_SQUARE_BRACKET ddv2
	| ASSIGN expressao_de_atribuicao ddv3
	| ddv3
;

ddv3: COMMA ddv1
	| SEMICOLON
;
//ok

declaracao_de_prototipos: tipo ddp1
;

ddp1: MULTIPLY ddp1
	| IDENTIFIER parametros SEMICOLON
;
//ok

parametros: L_PAREN par1
;

par1: R_PAREN
	| par2
;

par2: tipo par3
;

par3: MULTIPLY par3
	| IDENTIFIER par4
;

par4: L_SQUARE_BRACKET expressao R_SQUARE_BRACKET par4
	| COMMA par2
	| R_PAREN
;
//ok

tipo: INT
	| CHAR
	| VOID
;
//ok

comandos: lista_de_comandos com1
;

com1: comandos
	|
;
//ok

bloco: L_CURLY_BRACKET comandos R_CURLY_BRACKET
;
//ok

lista_de_comandos: DO bloco WHILE L_PAREN expressao R_PAREN SEMICOLON
	| IF L_PAREN expressao R_PAREN bloco ldc1
	| WHILE L_PAREN expressao R_PAREN bloco
	| FOR L_PAREN ldc2
	| PRINTF L_PAREN STRING ldc6
	| SCANF L_PAREN STRING COMMA BITWISE_AND IDENTIFIER R_PAREN SEMICOLON
	| EXIT L_PAREN expressao R_PAREN SEMICOLON
	| RETURN ldc7
	| expressao SEMICOLON
	| SEMICOLON
	| bloco
;

ldc1: ELSE bloco
	|
;
	
ldc2: expressao SEMICOLON ldc3
	| SEMICOLON ldc3
;

ldc3: expressao SEMICOLON ldc4
	| SEMICOLON ldc4
;

ldc4: expressao ldc5
	| ldc5
;

ldc5: R_PAREN bloco
;

ldc6: COMMA expressao R_PAREN SEMICOLON
	| R_PAREN SEMICOLON
;

ldc7: expressao SEMICOLON
	| SEMICOLON
;
//ok

expressao: expressao_de_atribuicao exp1
;

exp1: COMMA expressao_de_atribuicao exp1
	|
;
//ok

expressao_de_atribuicao: expressao_condicional
	| expressao_unaria eda1
;

eda1: ASSIGN expressao_de_atribuicao
	| ADD_ASSIGN expressao_de_atribuicao
	| MINUS_ASSIGN expressao_de_atribuicao
;
//ok

expressao_condicional: expressao_or_logico x
;

x: TERNARY_CONDITIONAL expressao COLON expressao_condicional
	| 
;
//ok

expressao_or_logico: expressao_and_logico eol1
;

eol1: LOGICAL_OR expressao_and_logico eol1
	| 
;
//ok

expressao_and_logico: expressao_or eal1
;

eal1: LOGICAL_AND expressao_or eal1
	| 
;
//ok

expressao_or: expressao_xor eor1
;

eor1: BITWISE_OR expressao_xor eor1
	| 
;
//ok

expressao_xor: expressao_and exor1
;

exor1: BITWISE_XOR expressao_and exor1
	| 
;
//ok

expressao_and: expressao_de_igualdade eand1
;

eand1: BITWISE_AND expressao_de_igualdade eand1
	|
;
//ok

expressao_de_igualdade: expressao_relacional edi1
;

edi1: EQUAL expressao_relacional edi1
	| NOT_EQUAL expressao_relacional edi1
	|
;
//ok

expressao_relacional: expressao_shift erelac1
;

erelac1: LESS_THAN expressao_shift erelac1
	| LESS_EQUAL expressao_shift erelac1
	| GREATER_THAN expressao_shift erelac1
	| GREATER_EQUAL expressao_shift erelac1
	|
;
//ok

expressao_shift: expressao_aditiva eshi1
;

eshi1: L_SHIFT expressao_aditiva eshi1
	| R_SHIFT expressao_aditiva eshi1
	|
;
//ok

expressao_aditiva: expressao_multiplicativa ead1
;

ead1: MINUS expressao_multiplicativa ead1
	| PLUS expressao_multiplicativa ead1
	|
;
//ok

expressao_multiplicativa: expressao_cast emul1
;

emul1: MULTIPLY expressao_cast emul1
	| DIV expressao_cast emul1
	| REMAINDER expressao_cast emul1
	|
;
//ok

expressao_cast: expressao_unaria
	| L_PAREN tipo R_PAREN expressao_cast
;
//ok

expressao_unaria: expressao_pos_fixa
	| INC expressao_unaria
	| DEC expressao_unaria
	| BITWISE_AND expressao_cast
	| MULTIPLY expressao_cast
	| PLUS expressao_cast
	| MINUS expressao_cast
	| BITWISE_NOT expressao_cast
	| NOT expressao_cast
;
//ok

expressao_pos_fixa: expressao_primaria
	| expressao_pos_fixa epf1
;

epf1: L_SQUARE_BRACKET expressao R_SQUARE_BRACKET
	| INC
	| DEC
	| L_PAREN epf2
;

epf2: R_PAREN
	| epf3
;

epf3: expressao_de_atribuicao epf4
;

epf4: COMMA epf3
	| R_PAREN
;
//ok

expressao_primaria: IDENTIFIER
	| numero
	| CHARACTER
	| STRING
	| L_PAREN expressao R_PAREN
;
//ok

numero: NUM_INTEGER
	| NUM_HEXA
	| NUM_OCTAL
;
//ok

%%

yyerror(char *s)
{   
	if(ajuda_sint == 0){

	    tam = coluna - (strlen(AUX12)-1);
		LIN = lines;
		strcpy(str9, AUX12);
		ajuda_sint = 1;
	}
	/*else{

		LIN++;
		ajuda_sint = 3;
	}*/
}

int main(int argc, char **argv)
{
	char str34[tamanho];
	int indice = 0;
	yyparse();
	while(yylex());
		//percorre o léxico
//printf("%s     %s\n\n\n", vets2,str);
	while(vets2[indice] != '\0'){

		if(vets2[indice] == '\n')
			break;

		str34[indice] = vets2[indice];
		indice++;
	}
	str34[indice] = '\0';

	if(ajuda_sint == 1){

		printf("error:syntax:%d:%d: %s\n%s\n%*s",LIN,tam,str9,str34,tam, "^");
	}
}
