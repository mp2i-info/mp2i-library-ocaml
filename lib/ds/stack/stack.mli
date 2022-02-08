module type S = sig
    type 'a t
    val empty : 'a t
    val push : 'a -> 'a t -> 'a t
    (* etc. *)
  end
  
module ListStack : S

module CustomStack : S
