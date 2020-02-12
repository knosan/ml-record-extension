/* File parser.mly */
%{
  open HindleyMilner
%}

%token <int> INT
%token <float> FLOAT
%token <string> LABEL
%token <string> STRING
%token LET IN FUN ARROW
%token PROJ EXTEND DEFAULT
%token PLUS MINUS TIMES DIV
%token LEFT_PAREN RIGHT_PAREN
%token LEFT_BRACE RIGHT_BRACE
%token LEFT_BRACK RIGHT_BRACK
%token EQ COLON SEMI_COLON COMMA PERIOD QUESTION_MARK
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

decl:
  | LET; v = LABEL; EQ; t1 = term; t2 = term    { Let (v, t1, t2) }
  | LET; v = LABEL; EQ; t1 = term; EOF          { Let (v, t1, Unit) }
;

term:
  | d = decl                                    { d }
  | v = LABEL                                   { Var v }
  | FUN; v = LABEL; ARROW; t = term             { Abs (v, t) }
  | t1 = term; t2 = term                        { App (t1, t2) }
  | LET; v = LABEL; t1 = term; IN; t2 = term    { Let (v, t1, t2) }
  | LEFT_PAREN; RIGHT_PAREN                     { Unit }
  | i = INT                                     { Int i }
  | t1 = term; PLUS; t2 = term                  { AddInt (t1, t2) }
  | t1 = term; MINUS; t2 = term                 { SubInt (t1, t2) }
  | x = FLOAT                                   { Float x }
  | s = STRING                                  { String s }
  | r = record                                  { r }
  | PROJ; l = LABEL; t = term                   { Proj (l, t) }
  /* | t = term; PERIOD; l = LABEL                 { Proj (l, t) } */
  | EXTEND; l = LABEL; t1 = term; t2 = term     { Extend (l, t1, t2) }
  | DEFAULT; l = LABEL; t1 = term; t2 = term    { Default (l, t1, t2) }
;

record:
  | LEFT_BRACE; r = fields                             { r }
;

fields:
  | l = LABEL; EQ; t = term; SEMI_COLON; r = fields    { Record (l, t, r) }
  | l = LABEL; EQ; t = term; SEMI_COLON?; RIGHT_BRACE  { Record (l, t, Unit) }
  | t = term; SEMI_COLON?; RIGHT_BRACE                 { t }
  /* | RIGHT_BRACE                                        { Unit } */
;
