
(* The type of tokens. *)

type token = 
  | STRING of (string)
  | SS
  | SEMI_COLON
  | RIGHT_PAREN
  | RIGHT_BRACE
  | PROJ
  | LET
  | LEFT_PAREN
  | LEFT_BRACE
  | LABEL of (string)
  | INT of (int)
  | IN
  | FUN
  | FLOAT of (float)
  | EXTEND
  | EQ
  | EOF
  | DEFAULT
  | ARROW

(* This exception is raised by the monolithic API functions. *)

exception Error

(* The monolithic API. *)

val file: (Lexing.lexbuf -> token) -> Lexing.lexbuf -> (HindleyMilner.term)
