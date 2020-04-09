let get_age = fun r -> (
          let name = proj name r in
          let age = proj age (default age 25 r) in
          age
        )
;;
let record1 = { name = "Ana" ; }
;;
let record2 = { name = "Bob" ; age = 30 ; }
;;
let record3 = { surname = "Smith" ; }
;;
let record4 = { name = "Carol" ; surname = "Smith" ; age = 40 ; status = "employed" ; }
;;
get_age
