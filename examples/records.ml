let a = { x = 15.5 ;
          y = "y" ;
}
;;
let b = { x = "x" ;
          z = 0 ;
}
;;

(* PROJ *)
let a_x = proj x a
;;
let a_y = proj y a
;;
let b_x = proj x b
;;
let b_z = proj z b
;;

(* EXTEND *)
let a_w = extend w 1 a
;;
let b_w = extend w 2 b
;;
let sum_w = (add_int (proj w a_w)) (proj w b_w)
;;
(* raises Type error : extend x 1.0 a *)

(* DEFAULT *)
let a_def_z = default z 5 a
;;
let a_def_x = default x 12.5 a
;;
let a_def_y = default y "new_y" a
;;
(* raises Type error : default x "x" a *)
