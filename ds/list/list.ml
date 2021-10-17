(** [sum l] returns the sum of elements of [l] *)
let rec sum l = match l with
    | [] -> 0
    | e::q -> e + sum q;;
