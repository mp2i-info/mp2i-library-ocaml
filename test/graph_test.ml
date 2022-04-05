open Mp2i__Graph
(* module D = DirectedGraph(MatrixGraph) *)

let g = MatrixGraph.empty 4;;
(* let g_dir = D.empty 4;; *)
let edges = [(0, 1); (1, 2); (0, 2); (2, 3)];;
List.iter (fun (u, v) -> MatrixGraph.add_edge u v g) edges;;
(* List.iter (fun (u, v) -> D.add_edge u v g_dir) edges;; *)

let%test "edges" =
  List.for_all (fun (u, v) -> MatrixGraph.is_edge u v g) edges;;

let%test "neighbors" =
  MatrixGraph.neighbors 1 g = [2] && MatrixGraph.neighbors 2 g = [3]

(* let%test "to_pdf" =
  let module D = GraphDraw(MatrixGraph) in
  D.to_pdf "draw_graph" g; 
  Sys.file_exists "draw_graph.pdf" *)
  