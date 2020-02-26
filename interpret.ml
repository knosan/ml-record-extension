open HindleyMilner

type decl = string * term

let string_of_decl (x, term) = x ^ " = " ^ (string_of_term term)

let add_builtin term =
  List.fold_right (fun (f:ffi) (t:term) -> Let(f.name, Function f, t)) !Functions.builtin term

(* TYPING *)
let type_term t =
  let t = add_builtin t in
  try
    let ty =  infer [] t in
    print_endline ((string_of_term t) ^ " : " ^ (string_of_ty ty))
  with
    |   Type_error ->
        print_endline ("Error when tyring to infer type of : " ^ (string_of_term t))


(* EVALUATION *)
exception Evaluation_error

let rec eval env = function
    | Var x -> (try eval env (List.assoc x env) with Not_found -> raise Evaluation_error)
    | Abs (x, t) ->
        let t = eval env t in
        Abs (x, t)
    | App (t, u) ->
        let u = eval env u in
        (
          match eval env t with
          | Abs (x, t) -> eval ((x, u)::env) t
          | t -> App (t, u) (* TO DO: add case for ffi *)
        )
    | Let (x, t, u) ->
        let v = eval env t in
        eval ((x, v)::env) u
    | Unit -> Unit
    | Int n -> Int n
    | Float x -> Float x
    | AddInt (m, n) ->
        let m = eval env m in
        let n = eval env n in
        (
            match m, n with
            | Int m, Int n -> Int (m + n)
            | m, n -> AddInt (m, n)
        )
    | SubInt (m, n) ->
        let m = eval env m in
        let n = eval env n in
        (
            match m, n with
            | Int m, Int n -> Int (m + n)
            | m, n -> SubInt (m, n)
        )
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
          | _ -> raise Evaluation_error
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
          | t ->
              Record (l, v, t)
      )
    | Function f ->
        Function f


let eval_term t =
  let t = add_builtin t in
  try
    ignore (infer [] t);
    let v =  eval [] t in
    print_endline ((string_of_term t) ^ " evaluates to " ^ (string_of_term v))
  with
    | Type_error -> print_endline ("Evaluation error: Cannot evaluate a term that is not well-typed.")
    | Evaluation_error -> print_endline ("Evaluation error: error when tyring to evaluate : " ^ (string_of_term t))
