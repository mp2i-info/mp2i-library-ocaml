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

module Heap : ImpPQ = struct
  type 'a t = { a : 'a array; mutable n : int }
  let pred i = (i - 1)/2
  let g i = 2*i + 1
  let d i = 2*i + 2
  let swap h i j =
      let tmp = h.a.(i) in
      h.a.(i) <- h.a.(j);
      h.a.(j) <- tmp
  let rec up heap i =
    let p = pred i in
    if i <> 0 && heap.a.(p) > heap.a.(i) then (
        swap heap i p;
        up heap p
    )
  let rec down heap i =
    let get j = (if j < heap.n then heap.a.(j) else min_int), j in
    let m, j = min (get (2*i + 1)) (get (2*i + 2)) in
    if heap.a.(i) > m then (
      swap heap i j;
      down heap j
    )
    let empty () = { a = Array.make 100 0; n = 0 }
    let is_empty h = h.n = 0
    let add e heap =
    heap.a.(heap.n) <- e;
    up heap heap.n;
    heap.n <- heap.n + 1
    let rec take_min heap =
      swap heap 0 (heap.n - 1);
      heap.n <- heap.n - 1;
      down heap 0;
      heap.a.(heap.n)
    let peek_min heap = heap.a.(0)
end