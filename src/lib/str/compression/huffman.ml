open BatIO
open Files
open PriorityQueue
module Q = FunToImpPQ(BstPQ)
  
type 'a tree_huffman = F of 'a | N of 'a tree_huffman * 'a tree_huffman;;

(* Encode *)
let build_huffman freq =
  let q = Q.empty () in
  let n = Array.length freq in
  for i = 0 to n - 1 do
    let f, c = freq.(i) in
    Q.add (f, F(c)) q
  done;
  for _ = 0 to n - 2 do
    let f1, a1 = Q.take_min q in
    let f2, a2 = Q.take_min q in
    Q.add (f1 + f2, N(a1, a2)) q
  done;
  snd (Q.take_min q);; 

let compute_freqs s =
  let n = String.length s in
  let m = 256 in
  let freqs = Array.make m 0 in
  for i = 0 to n - 1 do
    let i = int_of_char s.[i] in
    freqs.(i) <- freqs.(i) + 1
  done;
  let cfreqs = Array.make m (0, 'a') in
  for i = 0 to m - 1 do
    cfreqs.(i) <- (freqs.(i), Char.chr i)
  done;
  cfreqs

let build_table t =
  let table = Array.make 256 [] in
  let rec build acc = function
    | F c ->
      let i = int_of_char c in
      table.(i) <- acc
    | N(g, d) ->
      build (acc @ [0]) g;
      build (acc @ [1]) d
    in
  build [] t;
  table

let rec write_tree out = function
  | F c ->
      write_bits out ~nbits:1 1;
      write_bits out ~nbits:8 (Char.code c)
  | N (g, d) ->
    write_bits out ~nbits:1 0;
    write_tree out g;
    write_tree out d

let write_tree_and_data out (t, s) =
  write_tree out t;
  let table = build_table t in
  let n = String.length s in
  (* Write length *)
  write_bits out ~nbits:30 n;
  for i = 0 to n - 1 do
    let bits = table.(int_of_char s.[i])  in
    List.iter (fun bit ->
        write_bits out ~nbits:1 bit) bits
  done

let compress_string target s =
  let freqs = compute_freqs s in
  let t = build_huffman freqs in
  write_to_binary write_tree_and_data target (t, s)

let compress_file source =
  let s = read_file_to_single_string source in
  compress_string (source^".huf") s

(* Decode *)

let rec read_tree input =
  match read_bits input 1 with
  | 1 -> F(read_bits input 8 |> Char.chr)
  | 0 ->
    let g = read_tree input in
    let d = read_tree input in
    N(g, d)
  | _ -> raise (Failure "Cannot unparse tree!")

  
let rec read_char t input =
  match t with
  | F c -> c
  | N (g, d) ->
    match read_bits input 1 with
    | 0 -> read_char g input
    | 1 -> read_char d input
    | _ -> raise (Failure "This cannot happen!")

let decode_file input =
  let t = read_tree input in
  let n = read_bits input 30 in
  let buf = Buffer.create 100 in
  for _ = 0 to n - 1 do
    let ch = read_char t input in
    Buffer.add_char buf ch
  done;
  Buffer.contents buf

let decompress_file filename =
  read_from_binary decode_file filename
(* let rec read arb g = match arb with 
  | F(e) -> e, g
  | N(g, d) -> read (if (List.hd g) = 0 then g else d) (List.tl g);;
  let add x =
    let rec aux = function
      | E -> N(x, E, E)
      | N(d, g, d) -> if x < d then N(d, aux g, d) else N(d, g, aux d) in
    aux

let rec decode arb g =
  if g = [] then []
  else let e, next = read arb g in
       e::(decode arb next);;

let rec to_dico arb di chemin = match arb with
  | F(e) -> di.add e (List.rev chemin)
  | N(g, d) -> to_dico g di (0::chemin); to_dico d di (1::chemin);; 
  
let rec code di = function
  | [] -> []
  | c::q -> (List.hd (di.get c)) @ code di q;; *)