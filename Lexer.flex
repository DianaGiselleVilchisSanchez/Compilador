package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens

L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+

%{
    public String lexeme;
%}

%%
int |
if |
else |
while {lexeme=yytext(); return Reservadas;}

{espacio} { /*Ignore*/ }
"//".* { /*Ignore*/ }

"importa"        {return import;}
"paquete"        {return package;}
"."        {return Punto;}
";"        {return FinalLinea;}
"("        {return ParentesisIzquierdo;}
")"        {return ParentesisDerecho;}
"{"        {return LlaveIzquierda;}
"}"        {return LlaveDerecha;}
"["        {return CorcheteIzquierdo;}
"]"        {return CorcheteDerecho;}
"+"        {return Suma;}
"-"        {return Resta;}
"*"        {return Multiplicacion;}
"/"        {return Division;}
"%"        {return Modulo;}
"++"        {return Incremento;}
"--"        {return Decremento;}
"<"        {return MenorQue;}
">"        {return MayorQue;}
"<="        {return MenorIgual;}
">="        {return MayorIgual;}
"="        {return Asignacion;}
"=="        {return Diferente;}
"&"        {return And;}
"|"        {return Or;}
"!="        {return Not;}
""""        {return ComillasDobles;}
"//"        {return ComentarioLinea;}
"*/"        {return ComentarioParrafoAbre;}
"/*"        {return ComentarioParrafoCierra;}




{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;} 