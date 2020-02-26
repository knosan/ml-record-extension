open HindleyMilner

let builtin = ref []

let declare ffi = builtin := ffi :: !builtin

let rec arity_from_ftype = function
	| Arr (t1, t2) -> 1 + (arity_from_ftype t2)
	| _ -> 0

let add_int = {
	  	ftype  = Arr(TInt, Arr(TInt, TInt));
	  	name   = "AddInt";
	  	arity  = 2;
	  	eval   = (fun a -> begin match Array.get a 0, Array.get a 1 with
															| Int m, Int n -> Int (m + n)
															| _, _ -> assert false
												 end)
	  }

let sub_int = {
	  	ftype  = Arr(TInt, Arr(TInt, TInt));
	  	name   = "SubInt";
	  	arity  = 2;
	  	eval   = (fun a -> begin match Array.get a 0, Array.get a 1 with
															| Int m, Int n -> Int (m - n)
															| _, _ -> assert false
												 end)
	  }

let mul_int = {
	  	ftype  = Arr(TInt, Arr(TInt, TInt));
	  	name   = "MulInt";
	  	arity  = 2;
	  	eval   = (fun a -> begin match Array.get a 0, Array.get a 1 with
															| Int m, Int n -> Int (m * n)
															| _, _ -> assert false
												 end)
	  }

let () =
	declare add_int;
	declare sub_int;
	declare mul_int

let string_of_builtin = List.fold_left (fun s f -> Printf.sprintf "%s%s : %s\n" s f.name (string_of_ty f.ftype)) "" !builtin
