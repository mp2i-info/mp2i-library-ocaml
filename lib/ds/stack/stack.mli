module type FunStack = sig
    exception Empty
    type 'a t
    val empty : 'a t
    val peek : 'a t -> 'a
    val push : 'a -> 'a t -> 'a t
    val pop : 'a t -> 'a t
    val rev : 'a t -> 'a t
end
  
module ListStack : FunStack
