let code s =
  let n = String.length s in
  let d = Hashtbl.create 13 in
  let max_code = ref 0 in
  for i = 0 to n - 1 do (* initialize d *)
    if not (Hashtbl.mem d (String.sub s i 1)) then (
      Hashtbl.add d (String.sub s i 1) !max_code;
      incr max_code
    )
  done;
  let rec aux i = (* returns compression of s[i:] *)
    if i >= String.length s then []
    else
      let rec max_suffix j =
        if j = n || not (Hashtbl.mem d (String.sub s i (j - i + 1))) then j
        else max_suffix (j + 1) in
      let j = max_suffix i in
      let w = String.sub s i (j - i) in
      if j < n then (
        let w' = String.sub s i (j - i + 1) in
        Hashtbl.add d w' (!max_code + 1);
        incr max_code;
      );
      (Hashtbl.find d w)::aux j
  in
  aux 0
