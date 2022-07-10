(** [dichotomy a e] returns true if [a] contains [e], false otherwise. [a] must be a sorted array. *)
let binary_search e a = 
  let rec aux i j = (* is e in a.(i), ..., a.(j) ? *)
      if i > j then false
      else let m = (i + j)/2 in
           if a.(m) = e then true
           else if a.(m) < e then aux (m + 1) j
           else aux i (m - 1)
  in aux 0 (Array.length a - 1)
