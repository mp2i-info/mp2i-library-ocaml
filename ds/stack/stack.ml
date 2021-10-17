type 'a stack_imperative = {
    empty : unit -> bool;
    push : 'a -> unit;
    pop : unit -> 'a
};;

(** [stack_of_array t] returns a stack implemented with array t *)
let stack_of_array t =
  let n = ref 0 in (* number of elemnts in the stack *)
  {
    empty = (fun () -> !n = 0);
    push = (fun e -> if !n >= Array.length t 
            then failwith "Full stack"
            else (t.(!n) <- e; incr n));
    pop = (fun () -> if !n = 0
          then failwith "Empty stack"
          else (decr n; t.(!n)))
  };;

(** [stack_to_list s] converts a stack to a list *)
let stack_to_list s =
  let rec make_list () =
    if s.empty () then []
    else let top = s.pop () in
      top::make_list () in
  let l = List.rev (make_list ()) in
  List.iter s.push l;
  l;;
