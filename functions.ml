open HindleyMilner

let builtin_un = ref []

let builtin_bin = ref []

let declare_un f = builtin_un := f :: !builtin_un

let declare_bin f = builtin_bin := f :: !builtin_bin

let rec drop_decorations = function
  | Record (_, _, t) -> drop_decorations t
  | t -> t

(* UNARY *)
let neg_int = {
  	un_ftype = Arr(TInt, TInt);
  	un_name  = "neg_int";
  	un_eval   = (fun n -> begin match (drop_decorations n) with
														| Int n -> Int (-n)
														| _ -> assert false
											 		end)
  }

let neg_float = {
  	un_ftype = Arr(TFloat, TFloat);
  	un_name  = "neg_float";
  	un_eval   = (fun n -> begin match (drop_decorations n) with
														| Float n -> Float (Float.neg n)
														| _ -> assert false
											 		end)
  }

let int_to_string = {
    un_ftype = Arr(TInt, TString);
    un_name  = "string_of_int";
    un_eval   = (fun n -> begin match (drop_decorations n) with
                            | Int n -> String (string_of_int n)
                            | _ -> assert false
                          end)
}

let float_to_string = {
    un_ftype = Arr(TFloat, TString);
    un_name  = "string_of_float";
    un_eval   = (fun x -> begin match x with
                            | Float x -> String (string_of_float x)
                            | _ -> assert false
                          end)
}

(* BINARY *)
let add_int = {
	  	bin_ftype  = Arr(TInt, Arr(TInt, TInt));
	  	bin_name   = "add_int";
	  	bin_eval   = (fun m ->
                      begin match (drop_decorations m) with
											| Int m ->
													UnFunction {
													  	un_ftype = Arr(TInt, TInt);
													  	un_name  =  Printf.sprintf "add_int %d" m;
													  	un_eval   = (fun n -> begin match (drop_decorations n) with
																											| Int n -> Int (m + n)
																											| _ -> assert false
																								 end)
													  }
											| _ -> assert false
											end)
	  }

let sub_int = {
	  	bin_ftype  = Arr(TInt, Arr(TInt, TInt));
	  	bin_name   = "sub_int";
	  	bin_eval   = (fun m ->
                      begin match (drop_decorations m) with
											| Int m ->
													UnFunction {
													  	un_ftype = Arr(TInt, TInt);
													  	un_name  = Printf.sprintf "sub_int %d" m;
													  	un_eval   = (fun n -> begin match (drop_decorations n) with
																											| Int n -> Int (m - n)
																											| _ -> assert false
																								 end)
													  }
											| _ -> assert false
											end)
	  }

let mul_int = {
	  	bin_ftype  = Arr(TInt, Arr(TInt, TInt));
	  	bin_name   = "mul_int";
	  	bin_eval   = (fun m ->
                      begin match (drop_decorations m) with
											| Int m ->
													UnFunction {
													  	un_ftype = Arr(TInt, TInt);
													  	un_name  = Printf.sprintf "mul_int %d" m;
													  	un_eval   = (fun n -> begin match (drop_decorations n) with
																											| Int n -> Int (m * n)
																											| _ -> assert false
																								 end)
													  }
											| _ -> assert false
											end)
	  }

let div_int = {
	  	bin_ftype  = Arr(TInt, Arr(TInt, TInt));
	  	bin_name   = "div_int";
	  	bin_eval   = (fun m ->
                      begin match (drop_decorations m) with
											| Int m ->
													UnFunction {
													  	un_ftype = Arr(TInt, TInt);
													  	un_name  = Printf.sprintf "div_int %d" m;
													  	un_eval   = (fun n -> begin match (drop_decorations n) with
																											| Int n -> Int (m / n)
																											| _ -> assert false
																								 end)
													  }
											| _ -> assert false
											end)
	  }

let add_float = {
	  	bin_ftype  = Arr(TFloat, Arr(TFloat, TFloat));
	  	bin_name   = "add_float";
	  	bin_eval   = (fun m ->
                      begin match (drop_decorations m) with
											| Float m ->
													UnFunction {
													  	un_ftype = Arr(TFloat, TFloat);
													  	un_name  =  Printf.sprintf "add_float %s" (string_of_float m);
													  	un_eval   = (fun n -> begin match (drop_decorations n) with
																											| Float n -> Float (Float.add m n)
																											| _ -> assert false
																								 end)
													  }
											| _ -> assert false
											end)
	  }

let sub_float = {
	  	bin_ftype  = Arr(TFloat, Arr(TFloat, TFloat));
	  	bin_name   = "sub_float";
	  	bin_eval   = (fun m ->
                      begin match (drop_decorations m) with
											| Float m ->
													UnFunction {
													  	un_ftype = Arr(TFloat, TFloat);
													  	un_name  =  Printf.sprintf "sub_float %s" (string_of_float m);
													  	un_eval   = (fun n -> begin match (drop_decorations n) with
																											| Float n -> Float (Float.sub m n)
																											| _ -> assert false
																								 end)
													  }
											| _ -> assert false
											end)
	  }

let mul_float = {
	  	bin_ftype  = Arr(TFloat, Arr(TFloat, TFloat));
	  	bin_name   = "mul_float";
	  	bin_eval   = (fun m ->
                      begin match (drop_decorations m) with
											| Float m ->
													UnFunction {
													  	un_ftype = Arr(TFloat, TFloat);
													  	un_name  = Printf.sprintf "mul_float %s" (string_of_float m);
													  	un_eval   = (fun n -> begin match (drop_decorations n) with
																											| Float n -> Float (Float.mul m n)
																											| _ -> assert false
																								 end)
													  }
											| _ -> assert false
											end)
	  }

let div_float = {
	  	bin_ftype  = Arr(TFloat, Arr(TFloat, TFloat));
	  	bin_name   = "div_float";
	  	bin_eval   = (fun m ->
                      begin match (drop_decorations m) with
											| Float m ->
													UnFunction {
													  	un_ftype = Arr(TFloat, TFloat);
													  	un_name  = Printf.sprintf "div_float %s" (string_of_float m);
													  	un_eval   = (fun n -> begin match (drop_decorations n) with
																											| Float n -> Float (Float.div m n)
																											| _ -> assert false
																								 end)
													  }
											| _ -> assert false
											end)
	  }

let append_string = {
	  	bin_ftype  = Arr(TString, Arr(TString, TString));
	  	bin_name   = "append";
	  	bin_eval   = (fun m ->
                      begin match (drop_decorations m) with
											| String m ->
													UnFunction {
													  	un_ftype = Arr(TString, TString);
													  	un_name  = Printf.sprintf "append \"%s\"" m;
													  	un_eval   = (fun n -> begin match (drop_decorations n) with
																											| String n -> String (m ^ n)
																											| _ -> assert false
																								 end)
													  }
											| _ -> assert false
											end)
	  }


(* declare all functions*)
let () =
  (* UNARY *)
	declare_un neg_int;
  declare_un neg_float;
  declare_un int_to_string;
  declare_un float_to_string;
  (* BINARY *)
	declare_bin add_int;
	declare_bin sub_int;
	declare_bin mul_int;
  declare_bin div_int;
  declare_bin add_float;
  declare_bin sub_float;
  declare_bin mul_float;
  declare_bin div_float;
  declare_bin append_string


let string_of_builtin =
  let un = List.fold_left (fun s f -> Printf.sprintf "%s\t%s : %s\n" s f.un_name (string_of_ty f.un_ftype)) "Unary functions:\n" !builtin_un in
  let bin =   List.fold_left (fun s f -> Printf.sprintf "%s\t%s : %s\n" s f.bin_name (string_of_ty f.bin_ftype)) "Binary functions:\n" !builtin_bin in
  Printf.sprintf "%s%s\n" un bin
