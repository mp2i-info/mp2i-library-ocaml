module type S = sig
    type 'a t
    val empty : 'a t
    val peek : 'a t -> 'a
    val push : 'a -> 'a t -> 'a t
    val pop : 'a t -> 'a t
end
  
module ListStack : S

module CustomStack : S
