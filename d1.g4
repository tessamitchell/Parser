grammar d1;

start : assign+
 EOF;


assign : VARIABLE ASSIGN_OP EXPRESSION NEWLINE;




VARIABLE : [a-zA-Z]+[a-zA-Z0-9_]* ; // currently prevents boolean from being read, changing start to [a-z]+ fixes this, but not perfect

ASSIGN_OP : ' = ' 
        | ' += ' 
        | ' -= ' 
        | ' *= ' 
        | ' /= ' ;

EXPRESSION :
             ARRAY 
            | DATA OPERATOR DATA
            | DATA ;

DATA : BOOLEAN | VARIABLE | STRING | INTEGER | FLOAT  ;

OPERATOR :    ' + ' | '+'
            | ' - ' | '-'
            | ' / ' | '/'
            | ' * ' | '*'
            | ' % ' | '%';

STRING : '"'.*?'"' | '\'' .*? '\'';
INTEGER : [0-9]+;
FLOAT : [0-9]+ '.' [0-9]+ ;
ARRAY : '[' (DATA', ')* DATA ']' ;
BOOLEAN : 'True' | 'False' ;

NEWLINE : '\r'? '\n'+ ;
WS : [ \t]+ -> skip ;
