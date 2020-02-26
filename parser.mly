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
%token EQ SEMI_COLON
/* %token DOT */
%token EOF

/* precedency */
/* %nonassoc prec_decl */
/* %left prec_app */
/* %nonassoc IN */
/* %nonassoc LET */
/* %nonassoc FUN */
/* %right ARROW  /* -> */
/* %left EQ */
/* %left DOT */
/* %left PLUS MINUS */
/* %nonassoc PROJ EXTEND DEFAULT */
/* %nonassoc INT FLOAT STRING LABEL LEFT_PAREN LEFT_BRACE */
/* %left TIMES DIV */

/* entrypoint */
%start file

/* return value */
%type <HindleyMilner.term> file
%%

file:
    t = decl                                   { t }
;

decl:
  | LET; v = LABEL; EQ; t1 = term; t2 = decl  { Let (v, t1, t2) }
  | t = final_decl                            { t }
;

final_decl:
  | LET; v = LABEL; EQ; t1 = term; EOF         { Let (v, t1, Unit) }
  | t = final_term; EOF                        { t }
;

final_term:
  | v = LABEL                                   { Var v }
;

term:
  | LEFT_PAREN; t = term; RIGHT_PAREN           { t }
  | v = LABEL                                   { Var v }
  | FUN; v = LABEL; ARROW; t = term             { Abs (v, t) }
  /* | a = application                             { a } */
  /* | t1 = term; t2 = term (*%prec prec_app *)        { App (t1, t2) } */
  | LET; v = LABEL; t1 = term; IN; t2 = term    { Let (v, t1, t2) }
  | LEFT_PAREN; RIGHT_PAREN                     { Unit }
  | i = INT                                     { Int i }
  | x = FLOAT                                   { Float x }
  | s = STRING                                  { String s }
  | r = record                                  { r }
  | PROJ; l = LABEL; t = term                   { Proj (l, t) }
  | EXTEND; l = LABEL; t1 = term; t2 = term     { Extend (l, t1, t2) }
  | DEFAULT; l = LABEL; t1 = term; t2 = term    { Default (l, t1, t2) }
;

/* application:
  | t1 = term; t2 = term                        { App (t1, t2) } */

record:
  | LEFT_BRACE; r = fields                       { r }
;

fields:
  | l = LABEL; EQ; t = term; SEMI_COLON; r = fields    { Record (l, t, r) }
  | t = term; SEMI_COLON?; RIGHT_BRACE                 { t }
  | RIGHT_BRACE                                        { Unit }
;
