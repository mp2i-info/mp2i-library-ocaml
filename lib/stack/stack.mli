(** Functional stack *)
module type FunStack = sig
    exception Empty
    type 'a t

    (** Empty queue *)
    val empty : 'a t
    val is_empty : 'a t -> bool
    val peek : 'a t -> 'a
    val push : 'a -> 'a t -> 'a t
    val pop : 'a t -> 'a t
    val rev : 'a t -> 'a t
end
  
module ListStack : FunStack
