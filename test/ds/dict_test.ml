open Mp2i.Dict

let%test "dict" =
  DictList.(empty |> add 1 3 |> get 1) = Some 3;;