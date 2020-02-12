{
  open Lexing
  open Parser

  exception SyntaxError of string

  let next_line lexbuf =
    let pos = lexbuf.lex_curr_p in
    lexbuf.lex_curr_p <-
      { pos with pos_bol = lexbuf.lex_curr_pos;
                 pos_lnum = pos.pos_lnum + 1
      }

  let string_buffer = Buffer.create 1024
}

let white = [' ' '\t']+
let newline = '\r' | '\n'
let comment = "(*"("*"*[^'*' ')']|[^'*'])*"*"+")"
let digit = ['0'-'9']
let frac = '.' digit*
let exp = ['e' 'E'] ['-' '+']? digit+
let float = digit* frac? exp?
let integer = digit+
let var = ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_' '\'']*

rule read = parse
  | white                 { read lexbuf }
  | newline               { next_line lexbuf; read lexbuf }
  | comment               { read lexbuf }
  | integer as lxm        { INT (int_of_string lxm) }
  | float as lxm          { FLOAT (float_of_string lxm) }
  | '"'                   { read_string lexbuf }
  | "let"                 { LET }
  | "in"                  { IN }
  | "fun"                 { FUN }
  | "->"                  { ARROW }
  | "proj"                { PROJ }
  | "extend"              { EXTEND }
  | "default"             { DEFAULT }
  | '+'                   { PLUS }
  | '-'                   { MINUS }
  | '*'                   { TIMES }
  | '/'                   { DIV }
  | '('                   { LEFT_PAREN }
  | ')'                   { RIGHT_PAREN }
  | '{'                   { LEFT_BRACE }
  | '}'                   { RIGHT_BRACE }
  | '['                   { LEFT_BRACK }
  | ']'                   { RIGHT_BRACK }
  | '='                   { EQ }
  | ':'                   { COLON }
  | ';'                   { SEMI_COLON }
  | ','                   { COMMA }
  | '.'                   { PERIOD }
  | '?'                   { QUESTION_MARK }
  | var as lxm            { LABEL lxm }
  | eof                   { EOF }
  | _                     { raise (SyntaxError ("Unexpected char: " ^ Lexing.lexeme lexbuf)) }

and read_string = parse
  | '"'                   {
                            let s = Buffer.contents string_buffer in Buffer.reset string_buffer;
                            STRING s
                          }
  | '\\' '/'              { Buffer.add_char string_buffer '/'; read_string lexbuf }
  | '\\' '\\'             { Buffer.add_char string_buffer '\\'; read_string lexbuf }
  | '\\' 'b'              { Buffer.add_char string_buffer '\b'; read_string lexbuf }
  | '\\' 'f'              { Buffer.add_char string_buffer '\012'; read_string lexbuf }
  | '\\' 'n'              { Buffer.add_char string_buffer '\n'; read_string lexbuf }
  | '\\' 'r'              { Buffer.add_char string_buffer '\r'; read_string lexbuf }
  | '\\' 't'              { Buffer.add_char string_buffer '\t'; read_string lexbuf }
  | [^ '"' '\\']+         {
                            Buffer.add_string string_buffer (Lexing.lexeme lexbuf);
                            read_string lexbuf
                          }
  | _                     { raise (SyntaxError ("Illegal string character: " ^ Lexing.lexeme lexbuf)) }
  | eof                   { raise (SyntaxError ("String is not terminated")) }


(* {
  let next_token =
    let tokens = Queue.create () in (* prochains lexèmes à renvoyer *)
    fun lb ->
      if Queue.is_empty tokens then begin
        let l = read lb in
        List.iter (fun t -> Queue.add t tokens) l
      end;
      Queue.pop tokens
} *)
