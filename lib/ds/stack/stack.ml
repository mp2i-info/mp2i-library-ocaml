module type S = sig
  type 'a t
  val empty : 'a t
  val peek : 'a t -> 'a
  val push : 'a -> 'a t -> 'a t
  val pop : 'a t -> 'a t
end

module ListStack : S = struct
  type 'a t = 'a list
  let empty = []
  let peek = List.hd
  let push = List.cons
  let pop = List.tl
end

module CustomStack : S = struct
  type 'a t = 'a list
  let peek = List.hd
  let empty = []
  let push = List.cons
  let pop = List.tl
end