module type DictFun = sig
  type ('k, 'v) d
  val empty : ('k, 'v) d
  val get : 'k -> ('k, 'v) d -> 'v
  val get_option : 'k -> ('k, 'v) d -> 'v option
  val add : 'k -> 'v -> ('k, 'v) d -> ('k, 'v) d
  val keys : ('k, 'v) d -> 'k list
end

module DictList : DictFun = struct
  type ('k, 'v) d = ('k * 'v) list
  let empty = []
  let rec get k = function
    | [] -> failwith "key not found"
    | (k1, v1)::q -> if k = k1 then v1 else get k q
  let rec get_option k = function
    | [] -> None
    | (k1, v1)::q -> if k = k1 then Some v1 else get_option k q
  let add k v d = (k, v)::d
  let keys d = List.map fst d
end

let frequent l (module D : DictFun) =
  let rec freq = function
    | [] -> D.empty
    | e::q -> let d = freq q in
      match D.get_option e d with
        | None -> D.add e 1 d
        | Some n -> D.add e (n + 1) d in
  let d = freq l in
  D.keys d
  |> List.map (fun k -> D.get k d, k)
  |> List.fold_left max (min_int, 0)
  |> snd

frequent [3; 1; 2; 3; 3; 4; 2; 1; 2; 2] (module DictList : DictFun)