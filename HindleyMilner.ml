type var = string

type id = string

type label = string

type 'a fuzzy =
  | Yes of 'a
  | Maybe of 'a
  | No

(** Terms. *)
type term =
  | Var of var
  | App of term * term
  | Abs of var  * term
  | Let of var  * term * term
  | Unit
  | Int of int
  | Float of float
  | String of string
  | Record of label * term * term
  | Proj of label * term
  | Extend of label * term * term
  | Default of label * term * term
  | UnFunction of unffi
  | BinFunction of binffi

(* functions *)
and unffi = {
  	un_ftype  : ty;
  	un_name   : string;
  	un_eval   : term -> term
  }

and binffi = {
  	bin_ftype  : ty;
  	bin_name   : string;
  	bin_eval   : term -> term
  }

(** Types. *)
and ty =
  | EVar of tvar ref (* non-quantified variable *)
  | UVar of int      (* universally quantified variable *)
  | Arr of ty * ty
  | TUnit
  | TInt
  | TFloat
  | TString
  | TRecord of label * ty fuzzy * ty

(** type variable (non-quantified). *)
and tvar =
  | Unbd of int (* unbound variable *)
  | Link of ty  (* substituted variable *)

let tname   x = match !x with Unbd n -> n    | _ -> assert false
let is_link x = match !x with Link _ -> true | _ -> false
let unlink  x = match !x with Link a -> a    | _ -> assert false

exception Type_error

(** Fresh type variable. *)
let fresh =
  let n = ref (-1) in
  fun () -> incr n; EVar (ref (Unbd !n))


let rec string_of_ty = function
  | EVar x when is_link x -> string_of_ty (unlink x)
  | EVar x -> Printf.sprintf "'%c" (char_of_int (int_of_char 'a' + tname x))
  | UVar n -> assert false
  | Arr (a, b) -> Printf.sprintf "(%s -> %s)" (string_of_ty a) (string_of_ty b)
  | TUnit -> "unit"
  | TInt -> "int"
  | TFloat -> "float"
  | TString -> "string"
  | TRecord (l, Yes a, b) -> Printf.sprintf "{%s : %s; %s}" l (string_of_ty a) (string_of_ty b)
  | TRecord (l, Maybe a, b) -> Printf.sprintf "{?%s : %s; %s}" l (string_of_ty a) (string_of_ty b)
  | TRecord (l, No, b) -> Printf.sprintf "{%s : Abs; %s}" l (string_of_ty b)


let rec string_of_term = function
  | Var x -> Printf.sprintf "%s" x
  | App (t, u) -> Printf.sprintf "(%s %s)" (string_of_term t) (string_of_term u)
  | Abs (x, t) -> Printf.sprintf "(fun %s -> %s)" x (string_of_term t)
  | Let (x, t, u) -> Printf.sprintf "(let %s = %s in \n%s)" x (string_of_term t) (string_of_term u)
  | Int n -> string_of_int n
  | Float x -> string_of_float x
  | Unit -> "()"
  | String s -> Printf.sprintf "\"%s\"" s
  | Record (l, t, u) -> Printf.sprintf "{%s = %s; %s}" l (string_of_term t) (string_of_term u)
  | Proj (l, t) -> Printf.sprintf "proj_%s %s" l (string_of_term t)
  | Extend (l, v, t) -> Printf.sprintf "extend %s with {%s = %s}" (string_of_term t) l (string_of_term v)
  | Default (l, v, t) -> Printf.sprintf "default %s with {%s = %s}" (string_of_term t) l (string_of_term v)
  | UnFunction f -> Printf.sprintf "%s" f.un_name
  | BinFunction f -> Printf.sprintf "%s" f.bin_name


(** Instantiate a type. *)
let inst =
  let tenv = ref [] in
  let rec inst = function
    | UVar x ->
      if not (List.mem_assoc x !tenv) then tenv := (x, fresh ()) :: !tenv;
      List.assoc x !tenv
    | EVar x -> EVar x
    | Arr (a, b) -> Arr (inst a, inst b)
    | TUnit -> TUnit
    | TInt -> TInt
    | TFloat -> TFloat
    | TString -> TString
    | TRecord (l, Yes a, b) -> TRecord (l, Yes (inst a), inst b)
    | TRecord (l, Maybe a, b) -> TRecord (l, Maybe (inst a), inst b)
    | TRecord (l, No, b) -> TRecord (l, No, inst b)
  in
  inst

(** Whether a type variable occurs in a type. *)
let rec occurs x = function
  | EVar y when is_link y -> occurs x (unlink y)
  | EVar y -> x == y
  | UVar _ -> false
  | Arr (a, b) -> occurs x a || occurs x b
  | TUnit -> false
  | TInt -> false
  | TFloat -> false
  | TString -> false
  | TRecord (l, Yes a, b) -> occurs x a || occurs x b
  | TRecord (l, Maybe a, b) -> occurs x a || occurs x b
  | TRecord (l, No, b) -> occurs x b

(** a is subtype of b, meaning that a can be used in all functions that can be used on b. *)
let rec subtype a b =
  (* Format.printf "subtype %s %s\n" (string_of_ty a) (string_of_ty b); *)
  match a, b with
  | EVar x, EVar y when x = y -> ()
  | EVar x, _ when is_link x -> subtype (unlink x) b
  | _, EVar y when is_link y ->
    subtype a (unlink y)
  | EVar x, _ -> if occurs x b then raise Type_error else x := Link b
  | _, EVar y -> subtype b a
  | Arr (a1, a2), Arr (b1, b2) -> subtype b1 a1; subtype a2 b2
  | TUnit, TUnit -> ()
  | TInt, TInt -> ()
  | TFloat, TFloat -> ()
  | TString, TString -> ()
  | TRecord (l1, a1, b1), TRecord (l2, a2, b2) when l1 = l2 ->
      (
      match a1, a2 with
      | Yes a1, Yes a2 -> subtype a1 a2; subtype b1 b2
      | Yes a1, Maybe a2 ->
        subtype a1 a2;
        subtype b1 b2
      | Maybe a1, Maybe a2 -> subtype a1 a2; subtype b1 b2
      | No, No -> subtype b1 b2
      | No, Maybe a2 -> subtype b1 b2
      | _ -> Format.printf "type error for subtyping %s %s\n" (string_of_ty a) (string_of_ty b); raise Type_error
      )
  | TRecord (l1, a1, b1), TRecord (l2, a2, b2) ->
      let c = fresh () in
      subtype b1 (TRecord (l2, a2, c));
      subtype (TRecord (l1, a1, b1)) b2;
  | TRecord (l1, a1, b1), b2 ->
      subtype b1 b2
  | b1, TRecord (l2, Maybe a2, b2) -> (* b1 is not a record *)
      subtype b1 b2
  | b1, TRecord (l2, No, b2) -> (* b1 is not a record *)
      subtype b1 b2
  | _ ->
    Format.printf "type error for subtyping %s %s\n" (string_of_ty a) (string_of_ty b);
    raise Type_error

(** Generalize a type. *)
let rec gen env = function
  | EVar x when is_link x -> gen env (unlink x)
  | EVar x -> if List.exists (fun (y,a) -> occurs x a) env then EVar x else UVar (tname x)
  | UVar x -> UVar x
  | Arr (a, b) -> Arr (gen env a, gen env b)
  | TUnit -> TUnit
  | TInt -> TInt
  | TFloat -> TFloat
  | TString -> TString
  | TRecord (l, Yes a, b) -> TRecord (l, Yes (gen env a), gen env b)
  | TRecord (l, Maybe a, b) -> TRecord (l, Maybe (gen env a), gen env b)
  | TRecord (l, No, b) -> TRecord (l, No, gen env b)

(** Infer type. *)
let rec infer env = function
  | Var x -> (try inst (List.assoc x env) with Not_found -> raise Type_error)
  | Abs (x, t) ->
    let a = fresh () in
    let b = infer ((x,a)::env) t in
    Arr (a, b)
  | App (t, u) ->
    let a = infer env u in
    let b = fresh () in
    let c = infer env t in
    subtype c (Arr (a,b));
    b
  | Let (x, t, u) ->
    let a = infer env t in
    infer ((x, gen env a)::env) u
  | Unit -> TUnit
  | Int n -> TInt
  | Float x -> TFloat
  | String s -> TString
  | Record (l, t, u) ->
    let a = infer env t in
    let b = infer env u in
    let c = fresh () in
    subtype b (TRecord (l, No, c));
    TRecord (l, Yes a, c)
  | Proj (l, t) ->
    let r = infer env t in
    let a = fresh () in
    let b = fresh () in
    subtype r (TRecord (l, Yes a, b));
    a
  | Extend (l, v, t) ->
    let r = infer env t in
    let a = infer env v in
    let b = fresh () in
    subtype r (TRecord (l, No, b));
    TRecord (l, Yes a, r)
  | Default (l, v, t) ->
    let r = infer env t in
    let a = infer env v in
    let b = fresh () in
    subtype r (TRecord (l, Maybe a, b));
    TRecord (l, Yes a, b)
  | UnFunction f ->
    f.un_ftype
  | BinFunction f ->
    f.bin_ftype
