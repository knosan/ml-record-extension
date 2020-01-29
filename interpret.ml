let type_term term =
  try
    let ty =  HindleyMilner.infer [] term in
    print_endline ((HindleyMilner.string_of_term term) ^ " : " ^ (HindleyMilner.string_of_ty ty))
  with
    |   HindleyMilner.Type_error ->
        print_endline ("Error when tyring to infer type of : " ^ (HindleyMilner.string_of_term term))
