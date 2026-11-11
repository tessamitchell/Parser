grammar d1;

start : ASSIGN
 EOF;


ASSIGN : VARIABLE ' = ' EXPRESSION;

ASSIGN_OP : '=' | '+=' | '-=' | '*=' | '/=' ;

EXPRESSION : STRING | INTEGER | VARIABLE | FLOAT ;

VARIABLE : [a-zA-Z]+[a-zA-Z0-9_]* ;

STRING : '"'TEXT'"' ;
TEXT : [ -~];
INTEGER : [0-9]+;
FLOAT : [0-9]+ '.' [0-9]+ ;