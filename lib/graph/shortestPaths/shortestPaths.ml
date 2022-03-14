open PriorityQueue.BstQueue

let sum x y =
  if x = max_int || y = max_int then max_int
  else x + y  
  
let dijkstra g w r =
  let n = Array.length g in
  let q = empty () in
  let d = Array.make n max_int in
  add q (0, r);
  while not (is_empty q) do
    let du, u = take_min q in
    if d.(u) = max_int then (
      d.(u) <- du;
      List.iter (fun v -> add q (v, sum du (w u v))) g.(u)
    )
  done;
  d

let bellman g w r =
  let n = Array.length g in
  let d = Array.make n max_int in
  d.(r) <- 0;
  for k = 0 to n - 2 do
    for u = 0 to n - 1 do
      List.iter (fun v -> d.(v) <- min d.(v) (sum d.(u) (w u v))) g.(u)
    done
  done;
  d