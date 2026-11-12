grammar d1;

start : assign
 EOF;


assign : VARIABLE ASSIGN_OP EXPRESSION;



VARIABLE : [a-zA-Z]+[a-zA-Z0-9_]* ;

ASSIGN_OP : ' = ' | ' += ' | ' -= ' | ' *= ' | '/=' ;

EXPRESSION : STRING | INTEGER | VARIABLE | FLOAT ;



STRING : '"'TEXT'"' ;
TEXT : [ -~];
INTEGER : [0-9]+;
FLOAT : [0-9]+ '.' [0-9]+ ;
