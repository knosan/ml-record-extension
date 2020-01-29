/* File parser.mly */
%token <int> INT
%token <float> FLOAT
%token <string> LABEL
%token <string> STRING
%token LET IN
%token PLUS MINUS TIMES DIV
%token LEFT_PAREN RIGHT_PAREN
%token LEFT_BRACE RIGHT_BRACE
%token LEFT_BRACK RIGHT_BRACK
%token EQ COLON COMMA QUESTION_MARK
%token EOL
%token EOF
/* precedency */
%left PLUS MINUS
%left TIMES DIV
/* entrypoint */
%start file
/* return value */
%type <HindleyMilner.term> file
%%

file:
    t = term; EOF                             { t }
;

var:
    v = LABEL                                 { Var (v, HindleyMilner.next_i ()) }
;

term:
  /* | LET; v = var; EQ; t = term */
  | t1 = term; t2 = term                      { App (t1, t2) }
  /* | LET; v = LABEL; t1 = term; IN; t2 = term;   { Abs (v, t1, t2) } */
  | LEFT_PAREN; RIGHT_PAREN                   { Unit }
  | i = INT                                   { Int i }
  | t1 = term; PLUS; t2 = term                { AddInt (t1, t2) }
  | t1 = term; MINUS; t2 = term               { SubInt (t1, t2) }
  | x = FLOAT                                 { Float x }
  | s = STRING                                { String s }
;
