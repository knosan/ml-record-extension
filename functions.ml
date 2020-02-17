open HindleyMilner

(* let declare fun_type fun_name fun_arity =
	let f = ffi {
    ftype = fun_type;
    name = fun_name;

    } in
	env := (name, ffi); !env *)

(* let evaladdint = *)

let add_int = {
	  	ftype  = Arr(Arr(TInt, TInt), TInt);
	  	name   = "AddInt";
	  	arity  = 2;
	  	eval   = (fun a -> begin match Array.get a 0, Array.get a 1 with
															| Int m, Int n -> Int (m + n)
															| _, _ -> raise Type_error
												 end)
	  }

let sub_int = {
	  	ftype  = Arr(Arr(TInt, TInt), TInt);
	  	name   = "SubtInt";
	  	arity  = 2;
	  	eval   = (fun a -> begin match Array.get a 0, Array.get a 1 with
															| Int m, Int n -> Int (m - n)
															| _, _ -> raise Type_error
												 end)
	  }

let mul_int = {
	  	ftype  = Arr(Arr(TInt, TInt), TInt);
	  	name   = "MulInt";
	  	arity  = 2;
	  	eval   = (fun a -> begin match Array.get a 0, Array.get a 1 with
															| Int m, Int n -> Int (m * n)
															| _, _ -> raise Type_error
												 end)
	  }
