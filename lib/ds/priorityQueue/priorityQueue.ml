(** Type for imperative Queue *)
module type ImpPQ = sig
  type 'a t
  val empty : unit -> 'a t
  val is_empty : 'a t -> bool
  val add : 'a t -> 'a -> unit
  val take_min : 'a t -> 'a
end

module BstQueue : ImpPQ = struct
  type 'a tree = E | N of 'a * 'a tree * 'a tree
  type 'a t = 'a tree ref
  let empty () = ref E
  let is_empty t = !t = E
  let add t x =
    let rec aux t x = match t with
      | E -> N(x, E, E)
      | N(r, g, d) -> if x < r then N(r, aux g x, d) else N(r, g, aux d x) in
    t := aux !t x
  let take_min t =
    let rec aux t = match t with
      | E -> failwith "take_min on empty queue"
      | N(r, g, d) -> if g = E then r, d 
                      else let x, g' = aux g in
                            x, N(r, g', d) in
    let x, t' = aux !t in
    t := t';
    x
    
end
