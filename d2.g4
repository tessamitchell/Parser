grammar d1;

start : (assign | ifStatement | NEWLINE)+ EOF;


assign : VARIABLE ASSIGN_OP expression ;

expression : array 
            | data OPERATOR expression
            | data ;

array : '[' (data',')* data ']' ;
data : BOOLEAN | VARIABLE | STRING | INTEGER | FLOAT  ;


ifStatement : 'if' condition ':' NEWLINE (INDENT assign (NEWLINE? | EOF))+ 
    ('elif' condition ':' NEWLINE (INDENT assign (NEWLINE? | EOF))+)*
    ('else' ':' NEWLINE (INDENT assign (NEWLINE? | EOF))+)?;

condition : (data 
        ((CONDITIONAL_OP | LOGIC) data)* | ('('(LOGIC data)*')') | LOGIC)*;

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

NEWLINE : ('\r'? '\n')+ ;
INDENT : '\t' | '   ' ;
WS : [ \t]+ -> skip ;
