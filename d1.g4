grammar d1;

start : assign+ EOF;


assign : VARIABLE ASSIGN_OP expression NEWLINE;

expression : array 
            | data (OPERATOR data)?
            | data ;

array : '[' (data', ')* data ']' ;
data : BOOLEAN | VARIABLE | STRING | INTEGER | FLOAT  ;

ASSIGN_OP : ' = ' 
        | ' += ' 
        | ' -= ' 
        | ' *= ' 
        | ' /= ' ;
        
OPERATOR :    ' + ' | '+'
            | ' - ' | '-'
            | ' / ' | '/'
            | ' * ' | '*'
            | ' % ' | '%';


BOOLEAN : 'True' | 'False' ;
VARIABLE : [a-zA-Z]+[a-zA-Z0-9_]* ;

STRING : '"'.*?'"' | '\'' .*? '\'';
INTEGER : [0-9]+;
FLOAT : [0-9]+ '.' [0-9]+ ;

NEWLINE : '\r'? '\n'+ ;
WS : [ \t]+ -> skip ;
