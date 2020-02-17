open HindleyMilner

(* let env_ffi = Hashtbl.create 0 *)

(* let declare fun_type fun_name  =
	let f = {
    ftype  = fun_type;
    name 	 = fun_name;
		arity  = arity fun_type;
		eval   =
    } in
		Hashtbl.add env_ffi name f *)

let rec arity_from_ftype = function
	| Arr (t1, t2) -> 1 + (arity t2)
	| _ -> 0

let add_int = {
	  	ftype  = Arr(TInt, Arr(TInt, TInt));
	  	name   = "AddInt";
	  	arity  = 2;
	  	eval   = (fun a -> begin match Array.get a 0, Array.get a 1 with
															| Int m, Int n -> Int (m + n)
															| _, _ -> raise Type_error
												 end)
	  }

let sub_int = {
	  	ftype  = Arr(TInt, Arr(TInt, TInt));
	  	name   = "SubtInt";
	  	arity  = 2;
	  	eval   = (fun a -> begin match Array.get a 0, Array.get a 1 with
															| Int m, Int n -> Int (m - n)
															| _, _ -> raise Type_error
												 end)
	  }

let mul_int = {
	  	ftype  = Arr(TInt, Arr(TInt, TInt));
	  	name   = "MulInt";
	  	arity  = 2;
	  	eval   = (fun a -> begin match Array.get a 0, Array.get a 1 with
															| Int m, Int n -> Int (m * n)
															| _, _ -> raise Type_error
												 end)
	  }
