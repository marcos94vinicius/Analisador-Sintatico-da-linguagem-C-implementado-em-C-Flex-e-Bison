/* Nao usar a biblioteca do flex*/
%option noyywrap

%x IN_COMMENT

%{
#include<string.h>
#include<stdio.h>
#include<stdlib.h>
#include <sintatico.tab.h>
#define tamanho 100000
int yylval;
int ajuda_sint = 0;
int ajuda_lex = 0;
int chars = 1;//contador de char
int token = 0;//contador de token
int lines = 1;//contador de linha
int lines2 = 0;
int chars2 = 1;
int pula_linha = 0;
int coluna = 0;
char AUX12[tamanho];
char AUX13[tamanho];
int i=0;
char *string;
void copia_token_erro();
char vets[tamanho];
char vets2[tamanho];

%}

%%

"void"     {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(VOID);}
"int"      {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(INT);}
"char"     {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(CHAR);}
"return"   {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(RETURN);}
"break"    {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(BREAK);}
"switch"   {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(SWITCH);}
"case"     {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(CASE);}
"default"  {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(DEFAULT);}
"do"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(DO);}
"while"    {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(WHILE);}
"for"      {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FOR);}
"if"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(IF);}
"else"     {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ELSE);}
"typedef"  {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(TYPEDEF);}
"struct"   {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(STRUCT);}
"+"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(PLUS);}
"-"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(MINUS);}
"*"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(MULTIPLY);}
"/"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(DIV);}
"%"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(REMAINDER);}
"++"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(INC);}
"--"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(DEC);}
"&"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(BITWISE_AND);}
"|"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(BITWISE_OR);}
"~"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(BITWISE_NOT);}
"^"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(BITWISE_XOR);}
"!"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(NOT);}
"&&"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LOGICAL_AND);}
"||"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LOGICAL_OR);}
"=="       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(EQUAL);}
"!="       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(NOT_EQUAL);}
"<"  	   {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LESS_THAN);}
">"	       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(GREATER_THAN);}
"<="       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LESS_EQUAL);}
">="       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(GREATER_EQUAL);}
">>"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(R_SHIFT);}
"<<"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(L_SHIFT);}
"="        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ASSIGN);}
"+="       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ADD_ASSIGN);}
"-="       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(MINUS_ASSIGN);}
";"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(SEMICOLON);}
","        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(COMMA);}
":"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(COLON);}
"("        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(L_PAREN);}
")"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(R_PAREN);}
"{"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(L_CURLY_BRACKET);}
"}"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(R_CURLY_BRACKET);}
"["        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(L_SQUARE_BRACKET);}
"]"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(R_SQUARE_BRACKET);}
"?"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(TERNARY_CONDITIONAL);}
"#"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(NUMBER_SIGN);}
"->"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(POINTER);}
"printf"   {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(PRINTF);}
"scanf"    {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(SCANF);}
"define"   {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(DEFINE);}
"exit"     {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(EXIT);}


0[1-7][0-7]*        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(NUM_OCTAL);}
[0-9]+         {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(NUM_INTEGER);}
0[Xx][0-9a-fA-F]+   {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(NUM_HEXA);}

'[\\]?(.)'	        {strcat(vets, yytext);copia_token_erro(); string = malloc(strlen(yytext)*sizeof(char));strcpy(string, yytext); i = 0;
                        while(string[i] != '\0'){string[i] = string[i+1]; i++;} string[i-2] = '\0';
			chars+=strlen(yytext);token++;return(CHARACTER);}

\"([^\\\"]|\\.)*\"	{strcat(vets, yytext);copia_token_erro(); string = malloc(strlen(yytext)*sizeof(char)); strcpy(string, yytext); i = 0;
			while(string[i] != '\0'){string[i] = string[i+1];i++;} string[i-2] = '\0';
			chars+=strlen(yytext);token++;return(STRING);}

[_a-zA-Z][_a-zA-Z0-9]*	{strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(IDENTIFIER);}

" "		{ strcat(vets, yytext);copia_token_erro();chars+= strlen(yytext); }
"\t"        { strcat(vets, yytext);copia_token_erro();chars+= strlen(yytext); }   
"//"(.)*"\n"	{ strcat(vets, yytext);copia_token_erro();lines++; chars=1; yylineno++;}
"\n"		{ if(ajuda_sint == 1 && ajuda_lex == 0){ajuda_lex=1;strcpy(vets2,vets);}strcpy(vets,"");copia_token_erro();lines++; chars=1; yylineno++;}


<INITIAL>{
     "/*"  {copia_token_erro();lines2 = lines; chars2 = chars; chars+=2; }  BEGIN(IN_COMMENT);
     }

<IN_COMMENT>{
     <<EOF>>   { if(ajuda_sint == 0){printf("error:lexical:%d:%d: unterminated comment",lines2,chars2); pula_linha++;exit(0);}}BEGIN(INITIAL);
     "*/"      { copia_token_erro();chars+=2; } BEGIN(INITIAL);
     [^*\n]+   { copia_token_erro();chars+= strlen(yytext);}
     "*"       { copia_token_erro();chars+= strlen(yytext);}
     \n        copia_token_erro();yylineno++;lines++;
     }
\/\/([^\n])* 			{ copia_token_erro();chars += strlen(yytext); }
.       { if(ajuda_sint == 0){printf("error:lexical:%d:%d: %s",lines,chars,yytext); chars+= strlen(yytext); pula_linha++;exit(0);}}

%%    

void copia_token_erro(){

	int i=0;
	
    strcat(AUX13,yytext);

	for (i = 0; yytext[i] != '\0'; i++){

		if(yytext[i] == '\n'){

        	strcpy(AUX12,"");
            strcpy(AUX13,"");
            coluna = 0;
        }
		else if(yytext[i] == '\t')
        	coluna += 8 - (coluna % 8);

		else{

        	strcpy(AUX12,yytext);
            coluna++;
        }  
    }
}
