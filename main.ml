open Format
open Lexing
open Parser

let type_only = ref false
let print_builtin = ref false

let options =
  ["--type-only", Arg.Set type_only,
     "  stops after typing";
   "--builtin", Arg.Set print_builtin,
      "  displays builtin functions";
   ]

let usage = "usage: mini-ml [options] file.ml"

let file =
  let file = ref None in
  let set_file s =
    if not (Filename.check_suffix s ".ml") then
      raise (Arg.Bad "no .ml extension");
    file := Some s
  in
  Arg.parse options set_file usage;
  match !file with
    | Some f -> f
    | None -> if !print_builtin then printf "Builtin functions:\n%s" Functions.string_of_builtin else Arg.usage options usage; exit 1

let report (b,e) =
  let l = b.pos_lnum in
  let fc = b.pos_cnum - b.pos_bol + 1 in
  let lc = e.pos_cnum - b.pos_bol + 1 in
  eprintf "File \"%s\", line %d, characters %d-%d:\n" file l fc lc

let () =
  let c = open_in file in
  let lb = Lexing.from_channel c in
  try
    let t = Parser.file Lexer.read lb in
    close_in c;
    Interpret.type_term t;
    if !type_only then exit 0;
    Interpret.eval_term t
  with
    | Lexer.SyntaxError s ->
      	report (lexeme_start_p lb, lexeme_end_p lb);
      	eprintf "Lexical error: %s@." s;
      	exit 1
    | Parser.Error ->
      	report (lexeme_start_p lb, lexeme_end_p lb);
      	eprintf "Syntax error@.";
      	exit 1
    | e ->
      	eprintf "Error: %s\n@." (Printexc.to_string e);
      	exit 2
