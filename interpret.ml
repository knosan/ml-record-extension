open HindleyMilner

type decl = string * term

let string_of_decl (x, term) = x ^ " = " ^ (string_of_term term)

let add_builtin_un term =
  List.fold_right (fun (f:unffi) (t:term) -> Let(f.un_name, UnFunction f, t)) !Functions.builtin_un term

let add_builtin_bin term =
  List.fold_right (fun (f:binffi) (t:term) -> Let(f.bin_name, BinFunction f, t)) !Functions.builtin_bin term

let add_builtin term =
  let term = add_builtin_un term in
  add_builtin_bin term

(* TYPING *)
let type_term t =
  Format.printf "----- TYPING -----\n";
  let t = add_builtin t in
  try
    let ty =  infer [] t in
    Format.printf "%s : %s\n\n" (string_of_term t) (string_of_ty ty)
  with Type_error -> Format.printf "Error when trying to infer type of : \n%s\n\n" (string_of_term t)

(* EVALUATION *)
let rec eval env t =
    match t with
    | Var x ->
        (
          try eval env (List.assoc x env)
          with Not_found -> Var x
        )
    | Abs (x, t) ->
        let t = eval env t in
        Abs (x, t)
    | App (t, u) ->
        let u = eval env u in
        (
          match eval env t with
          | Abs (x, t) -> eval ((x, u)::env) t
          | UnFunction f -> f.un_eval u
          | BinFunction f -> f.bin_eval u
          | t -> App (t, u)
        )
    | Let (x, t, u) ->
        let v = eval env t in
        eval ((x, v)::env) u
    | Unit -> Unit
    | Int n -> Int n
    | Float x -> Float x
    | String s -> String s
    | Record (l, t, u) ->
        let t = eval env t in
        let u = eval env u in
        Record (l, t, u)
    | Proj (l, t) ->
      (
          match eval env t with
          | Record (l1, t, u) when l1 = l ->
              t
          | Record (l1, t, u) ->
              eval env (Proj (l, u))
          | _ -> Proj (l, t)
      )
    | Extend (l, v, t) ->
        Record (l, v, t)
    | Default (l, v, t) ->
      (
          match eval env t with
          | Record (l1, t, u) when l1 = l ->
              Record (l1, t, u)
          | Record (l1, t, u) ->
              let u = eval env (Default (l, v, u)) in
              Record (l1, t, u)
          | Var x ->
              Default (l, v, Var x)
          | t ->
              Record (l, v, t)
      )
    | UnFunction f -> UnFunction f
    | BinFunction f -> BinFunction f

let eval_term t =
  Format.printf "----- EVALUATION -----\n";
  let t = add_builtin t in
  try
    ignore (infer [] t);
    let v =  eval [] t in
    Format.printf "%s evaluates to %s \n\n" (string_of_term t) (string_of_term v)
  with Type_error -> Format.printf "Evaluation error: Cannot evaluate a term that is not well-typed.\n\n"
