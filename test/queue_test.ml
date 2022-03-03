open Mp2i__Queue
open Mp2i__Stack

module Q = TwoStackQueue(ListStack)

let%test "queue" = Q.(empty |> push 42 |> push 7 |> pop |> peek = 7)

module ImpQ = FunToImpQueue(Q)

let q = ImpQ.empty ();;
  ImpQ.push 42 q;;
  ImpQ.push 7 q;;
let%test "imp_queue" = 
  ImpQ.peek q = 42;;
