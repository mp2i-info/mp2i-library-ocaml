open Mp2i.Stack

let%test "list_stack" = ListStack.(empty |> push 42 |> push 7 |> pop |> peek = 42)
let%test "list_stack_is_empty" = ListStack.(empty |> push 42 |> push 7 |> pop |> pop |> is_empty)
let%test "list_stack_is_not_empty" = not ListStack.(empty |> push 42 |> push 7 |> is_empty)

let%test "list_stack_exn" = ListStack.(
  try let _ = empty |> push 42|> pop |> pop |> peek in false
  with Empty -> true)