open Mp2i__Queue
open Mp2i__Stack

module Q = TwoStackQueue(ListStack)

let%test "queue" = Q.(empty |> push 42 |> push 7 |> pop |> peek = 7)
