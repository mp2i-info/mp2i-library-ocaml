(** Type for imperative Queue *)
module type FunPQ = sig
  type 'a t
  val empty : 'a t
  val is_empty : 'a t -> bool
  val add : 'a -> 'a t -> 'a t
  val peek_min : 'a t -> 'a
  val take_min : 'a t -> 'a t
end

module type ImpPQ = sig
  type 'a t
  val empty : unit -> 'a t
  val is_empty : 'a t -> bool
  val add : 'a -> 'a t -> unit
  val peek_min : 'a t -> 'a
  val take_min : 'a t -> 'a
end

module FunToImpPQ (Q : FunPQ) = struct
  type 'a t = 'a Q.t ref
  let empty () = ref Q.empty
  let is_empty = Q.is_empty
  let add e q = q := Q.add e !q
  let peek_min q = Q.peek_min !q
  let take_min q = 
    let e = Q.peek_min !q in
    q := Q.take_min !q;
    e
end

module BstPQ : FunPQ = struct
  type 'a t = E | N of 'a * 'a t * 'a t
  let empty = E
  let is_empty t = t = E
  let rec add x = function
      | E -> N(x, E, E)
      | N(r, g, d) -> if x < r then N(r, add x g, d) else N(r, g, add x d)
  let rec peek_min = function
      | E -> failwith "peek_min"
      | N(r, g, _) -> if g = E then r else peek_min g
  let rec take_min = function
      | E -> failwith "take_min"
      | N(r, g, d) -> if g = E then d 
                      else N(r, take_min g, d)
end
