(** Type for functional Queue *)
module type FunQueue = sig
  type 'a t
  (** Empty queue *)
  val empty : 'a t
  val is_empty : 'a t -> bool
  (** Peek the first element of the queue *)
  val peek : 'a t -> 'a
  (** Push an element to the queue *)
  val push : 'a -> 'a t -> 'a t
  (** Pop an element to the queue *)
  val pop : 'a t -> 'a t
end

module type ImpQueue = sig
  type 'a t
  (** Empty queue *)
  val empty : unit -> 'a t
  val is_empty : 'a t -> bool
  (** Peek the first element of the queue *)
  val peek : 'a t -> 'a
  (** Push an element to the queue *)
  val push : 'a -> 'a t -> unit
  (** Pop an element to the queue *)
  val pop : 'a t -> unit
end

(** Functional Queue implemented with 2 [FunStack] *)
module TwoStackQueue (S : Mp2i__Stack.FunStack) : FunQueue = struct
  type 'a t = 'a S.t * 'a S.t
  let empty = S.empty, S.empty
  let is_empty (s1, s2) = S.is_empty s1 && S.is_empty s2
  let peek (s1, s2) = 
    try S.peek s1
    with S.Empty -> S.rev s2 |> S.peek
  let push e (s1, s2) = s1, S.push e s2
  let pop (s1, s2) = 
    try S.pop s1, s2
    with S.Empty -> S.rev s2 |> S.pop, S.empty
end

module FunToImpQueue (Q : FunQueue) : ImpQueue = struct
  type 'a t = 'a Q.t ref

  let empty () = ref Q.empty
  let is_empty q = Q.is_empty !q
  let peek q = Q.peek !q
  let push e q = q := Q.push e !q
  let pop q = q := Q.pop !q
end
