(* Q10 *)
let rec split l k =
  match l with
    | [] -> k ([], [])
    | x::r -> split r (fun (a, b) -> k (b, x::a))

let rec merge l1 l2 k =
  match l1, l2 with
  | [], l | l, [] -> k l
  | x1::r1, x2::r2 ->
    if x1 < x2 then merge r1 l2 (fun l -> k (x1::l))
    else merge r2 l1 (fun l -> k (x2::l))

let rec mergesort l k =
  match l with
  | [] | [_] -> k l
  | _ -> 
    let l1, l2 = split l (fun x -> x) in 
    mergesort l1 (fun l1' -> mergesort l2 (fun l2' -> merge l1' l2' k))

let sort l = mergesort l (fun x -> x)