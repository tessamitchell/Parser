grammar d1;

start : (assign | if | NEWLINE)+ EOF;


assign : VARIABLE ASSIGN_OP expression ;

expression : array 
            | data OPERATOR expression
            | data ;

array : '[' (data',')* data ']' ;
data : BOOLEAN | VARIABLE | STRING | INTEGER | FLOAT  ;


if : 'if' condition ':\r\n\t' assign+ 
    ('\nelif' condition ':\r\n\t' assign+)*
    ('else:\r\n\t' assign+)?;

condition : data 
        ((CONDITIONAL_OP | LOGIC) data)*;

ASSIGN_OP : '=' 
        | '+=' 
        | '-=' 
        | '*=' 
        | '/=' ;
        
OPERATOR :    '+'
            | '-'
            | '/'
            | '*'
            | '%';
            
CONDITIONAL_OP : '>'
                | '>='
                | '<'
                | '<='
                | '=='
                | '!=';
LOGIC : 'and' | 'or' | 'not';

BOOLEAN : 'True' | 'False' ;
VARIABLE : [a-zA-Z]+[a-zA-Z0-9_]* ;

STRING : '"'.*?'"' | '\'' .*? '\'';
INTEGER : '-'?[0-9]+;
FLOAT : '-'?[0-9]+ '.' [0-9]+ ;

NEWLINE : '\r'? '\n'+ ;
WS : [ \t]+ -> skip ;
