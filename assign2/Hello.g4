/**
 * Define a grammar called Hello
 */
grammar Hello;

p: (STRUCT) (FUNCT)*;

WS :[ \t\r\n]* -> skip ; //skips whitespaces

STRUCT : 'struct' WS (NAME)+ '{' VARDECL* '};';

VARDECL : (NAME|TYPE|WS) WS (NAME)+ (ARR|WS) SEMIcommaEMPTY;

NAME : [a-zA-Z_];

CHAR: '\'' NAME '\'';

TYPE : 'int'|'char';

FUNCT: FUNCTDECL FUNCBLOCK 'return'WS (INT) ';}';
 
FUNCTDECL: VARDECL PARAM;

PARAM: '('(VARDECL*)')';

MULTIPARAM: (NAME SEMIcommaEMPTY)*;

FUNCBLOCK: '{' (EXP|STRUCTDECL|VARDECL|METCALL|WHILE|IF)*;

METCALL: (NAME)+ '('(NAME SEMIcommaEMPTY)*')' SEMIcommaEMPTY;

EXP: (VARDECL) (AOP) (INT|CHAR|METCALL|WHILEIFEXP) SEMIcommaEMPTY;//snake_length=snake_length+1

STRUCTDECL: (NAME) WS (NAME) SEMIcommaEMPTY; //TODO location snake[10];

WHILE : 'while' '('WHILEIFEXP')' '{' (EXP|IF)* '}';

WHILEIFEXP: (VARDECL (CALL|WS)) (BOP|COP|AOP) (INARR|VARDECL (CALL|WS)) WHILEIFEXP*; //u!=1  

IF: 'if' '('WHILEIFEXP')' '{' (EXP|METCALL)* '}';

BOP: '||'|'&&'|'!'|'!=';

COP: '<'|'>'|'=='|'<='|'>=';

AOP: '+'|'-'|'*'|'/'|'=';

INT: [0-9]+;

SEMIcommaEMPTY: (';'|','|WS);

ARR:'['INARR*']';
 
INARR:INT|CHAR|NAME;

CALL:'.' NAME;

