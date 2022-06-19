module type DictFun = sig
  type ('k, 'v) d
  val empty : ('k, 'v) d
  val get : 'k -> ('k, 'v) d -> 'v option
  val add : 'k -> 'v -> ('k, 'v) d -> ('k, 'v) d
  val keys : ('k, 'v) d -> 'k list
end

module DictList : DictFun = struct
  type ('k, 'v) d = ('k * 'v) list
  let empty = []
  let rec get k = function
    | [] -> None
    | (k1, v1)::q -> if k = k1 then Some v1 else get k q
  let add k v d = (k, v)::d
  let keys d = List.map fst d
end

let frequent l (module D : DictFun) =
  let rec freq = function
    | [] -> D.empty
    | e::q -> let d = freq q in
      match D.get e d with
        | None -> D.add e 1 d
        | Some n -> D.add e (n + 1) d in
  let rec freq_max d = function
    | [] -> 0, min_int
    | k::q -> let kmax, nmax = freq_max d q in
      match D.get k d with
        | None -> kmax, nmax
        | Some n -> if n > nmax then k, n else kmax, nmax in
  let d = freq l in
  freq_max d (D.keys d)

frequent [3; 1; 2; 3; 3; 4; 2; 1; 2; 2] (module DictList : DictFun)