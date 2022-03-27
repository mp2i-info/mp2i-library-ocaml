let boyer_moore text w =
  let k, n = String.length w, String.length text in
  let module M = Map.Make(Char) in
  let rec make_skip i =
    if i = k then M.empty
    else make_skip (i+1) |> M.add w.[k - i - 1] i in
  let skip = make_skip 0 in

  let rec search i j = (* test if w[:j] ends in text[i] *)
    if i = n then -1
    else if j = k then i - k + 1
    else if w.[k - j - 1] = text.[i - j] then search i (j + 1)
    else match M.find_opt text.[i - j] skip with
      | Some s -> search (max (i + 1) (s + i)) 0
      | None -> search (i + 1) 0 in
  search (k - 1) 0
