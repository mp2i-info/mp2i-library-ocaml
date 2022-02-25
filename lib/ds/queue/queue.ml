

module TwoStackQueue (S : Mp2i__Stack.FunStack) = struct
  type 'a t = 'a S.t * 'a S.t
  let empty = S.empty, S.empty
  let peek (s1, _) = S.peek s1
  let push e (s1, s2) = s1, S.push e s2
  let pop (s1, s2) = 
    try S.pop s1, s2
    with S.Empty -> S.rev s2 |> S.pop, S.empty
end
