open Mp2i__Stack

let%test "list_stack" = ListStack.(empty |> push 42 |> push 7 |> pop |> peek = 42)

let%test "list_stack_exn" = ListStack.(
  try let _ = empty |> push 42|> pop |> pop |> peek in false
  with Empty -> true)