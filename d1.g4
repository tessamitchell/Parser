grammar d1;

start : ASSIGN EOF;


ASSIGN : VARIABLE ' = ' EXPRESSION;

EXPRESSION : STRING | INTEGER;

VARIABLE : [a-zA-Z]+[a-zA-Z0-9_]* ;

STRING : '"'TEXT'"' ;
TEXT : [ -~];
INTEGER : [0-9]+;