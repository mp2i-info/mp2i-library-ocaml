open Mp2i.Dict

let%test "dict" =
  DictList.(empty |> add 1 3 |> get 1) = 3;;

(* frequent [3; 1; 2; 3; 3; 4; 2; 1; 2; 2] (module DictList : DictFun) *)