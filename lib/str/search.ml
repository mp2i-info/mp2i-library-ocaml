let boyer_moore text w =
  let k, n = String.length w, String.length text in
  let module M = Map.Make(Char) in
  let rec make_skip i =
    if i = k - 1 then M.empty
    else make_skip (i+1) |> M.add w.[k - i - 1] i in
  let skip = make_skip 1 in

  let rec search i j = (* test if w[:j] ends in text[i] *)
    if i >= n then -1
    else if j = k then i - k + 1
    else if w.[k - j - 1] = text.[i - j] then search i (j + 1)
    else match M.find_opt text.[i - j] skip with
      | Some s -> search (max (i + 1) (s + i)) 0
      | None -> search (i + k) 0 in
  search (k - 1) 0

let hash b q s =
  let rec aux i p =
    if i = -1 then 0
    else ((Char.code s.[i])*p + aux (i-1) ((p * b) mod q)) mod q in
  aux (String.length s - 1) 1

let rec pow a n q = match n with
  | 0 -> 1
  | 1 -> a
  | n -> 
    let b = pow a (n / 2) q in
    (b * b * (if n mod 2 = 0 then 1 else a)) mod q

let rabin_karp text w =
  let k, n = String.length w, String.length text in
  let q = 3719 in (* prime number for modulo *)
  let b = 256 in (* number of characters (basis) *)
  let p = pow b (k - 1) q in (* maximum power of b *)
  let h_w = hash b q w in
  let rec search i h =
    if h = h_w && w = String.sub text i k then i
    else if i >= n - k then -1
    else let h_ = (b*(h - p*Char.code text.[i]) + Char.code text.[i + k]) mod q in
      search (i + 1) (if h_ >= 0 then h_  else h_ + q) in
  search 0 (hash b q (String.sub text 0 k))
