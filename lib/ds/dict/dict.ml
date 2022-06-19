module type DictImp = sig
  type ('k, 'v) d
  val empty: ('k, 'v) d
  val get : 'k -> ('k, 'v) d -> 'v option
  val add : 'k -> 'v -> ('k, 'v) d -> ('k, 'v) d
end

module DictList : DictImp = struct
  type ('k, 'v) d = ('k * 'v) list
  let empty = []
  let rec get k = function
    | [] -> None
    | (k1, v1)::q -> if k = k1 then Some v1 else get k q

  let rec add k v d = (k, v)::d
end
