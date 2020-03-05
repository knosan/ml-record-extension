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
  | LET; v = LABEL; EQ; t1 = term; SS t2 = decl  { Let (v, t1, t2) }
  | t = final_decl                            { t }
;

final_decl:
  | EOF                                        { Unit }
  | term; EOF                                  { $1 }
;

term:
  | LET; v = LABEL; t1 = term; IN; t2 = term    { Let (v, t1, t2) }
  | aterm { $1 }

aterm:
  | FUN; v = LABEL; ARROW; t = term             { Abs (v, t) }
  | t1 = sterm; t2 = aterm (*%prec prec_app *)     { App (t1, t2) }
  | sterm { $1 }

sterm:
  | LEFT_PAREN; t = term; RIGHT_PAREN           { t }
  | v = LABEL                                   { Var v }
  /* | a = application                             { a } */
  | LEFT_PAREN; RIGHT_PAREN                     { Unit }
  | i = INT                                     { Int i }
  | x = FLOAT                                   { Float x }
  | s = STRING                                  { String s }
  | r = record                                  { r }
  | PROJ; l = LABEL; t = sterm                   { Proj (l, t) }
  | EXTEND; l = LABEL; t1 = sterm; t2 = sterm     { Extend (l, t1, t2) }
  | DEFAULT; l = LABEL; t1 = sterm; t2 = sterm    { Default (l, t1, t2) }
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
