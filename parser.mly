/* File parser.mly */
%{
  open HindleyMilner
%}

/* tokens */
%token <int> INT
%token <float> FLOAT
%token <string> LABEL
%token <string> STRING
%token LET IN FUN ARROW
%token PROJ EXTEND DEFAULT
/* %token PLUS MINUS */
/* %token TIMES DIV */
%token LEFT_PAREN RIGHT_PAREN
%token LEFT_BRACE RIGHT_BRACE
%token EQ SEMI_COLON SS
/* %token DOT */
%token EOF

/* entrypoint */
%start file

/* return value */
%type <HindleyMilner.term> file
%%

file:
  | t = decl                                     { t }

decl:
  | LET v = LABEL EQ t1 = term SS t2 = decl      { Let (v, t1, t2) }
  | t = final_decl                               { t }

final_decl:
  | EOF                                           { Unit }
  | t = term; EOF                                 { t }

term:
  | LET v = LABEL EQ t1 = term IN t2 = term       { Let (v, t1, t2) }
  | t = aterm                                     { t }

aterm:
  | LEFT_PAREN t = term RIGHT_PAREN               { t }
  | FUN; v = LABEL; ARROW t = term                { Abs (v, t) }
  | t1 = sterm t2 = aterm                         { App (t1, t2) }
  | t = sterm                                     { t }

sterm:
  | LEFT_PAREN t = aterm RIGHT_PAREN               { t }
  | v = LABEL                                      { Var v }
  | LEFT_PAREN RIGHT_PAREN                         { Unit }
  | i = INT                                        { Int i }
  | x = FLOAT                                      { Float x }
  | s = STRING                                     { String s }
  | r = record                                     { r }
  | PROJ l = LABEL t = sterm                       { Proj (l, t) }
  | EXTEND l = LABEL t1 = sterm t2 = sterm         { Extend (l, t1, t2) }
  | DEFAULT l = LABEL t1 = sterm t2 = sterm        { Default (l, t1, t2) }

record:
  | LEFT_BRACE r = fields                          { r }

fields:
  | l = LABEL EQ t = term SEMI_COLON r = fields    { Record (l, t, r) }
  | t = term SEMI_COLON? RIGHT_BRACE               { t }
  | RIGHT_BRACE                                    { Unit }
