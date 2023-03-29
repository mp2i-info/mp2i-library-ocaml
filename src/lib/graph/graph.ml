module type Graph = sig
  type vertex
  type t
  val empty : int -> t
  val n : t -> int
  val is_edge : vertex -> vertex -> t -> bool
  val add_edge : vertex -> vertex -> t -> unit
  val del_edge : vertex -> vertex -> t -> unit
  val neighbors : vertex -> t -> vertex list
  val vertices : t -> vertex list
  val copy : t -> t
end

module MatrixGraph : (Graph with type vertex := int) = struct
  type vertex = int
  type t = vertex array array
  let empty n = Array.make_matrix n n 0
  let n = Array.length
  let is_edge i j m = m.(i).(j) <> 0
  let add_edge i j m = m.(i).(j) <- 1
  let del_edge i j m = m.(i).(j) <- 0
  let neighbors i m =
    let rec aux j =
      if j = n m then []
      else if m.(i).(j) <> 0 then j::aux (j+1)
      else aux (j+1) in
    aux 0
  let vertices m = Base.List.range 0 (n m)
  let copy m = Array.map Array.copy m
end

(* module ListGraph : G = struct
  type vertex =  int
  type t = vertex vertex array
  let empty n : t = Array.make_matrix n n 0
  let is_edge i j m = m.(i).(j) <> 0
  let add_edge i j m = m.(i).(j) <- 1
  let del_edge i j m = m.(i).(j) <- 0
  let neighbors i m = Array.to_list m.(i)
end *)

module GraphDraw (G : Graph with type vertex := int) = struct
  let to_pdf file_out g =
    let open Printf in
    let tex = sprintf "%s.tex" file_out in
    let f = open_out tex in
    fprintf f "\\documentclass[convert={outfile=\\jobname.png}]{standalone}\n
\\usepackage{tikz}\n
\\begin{document}\n
\\tikzset{every node/.style={draw, circle}}\n
\\usetikzlibrary {graphs,graphdrawing} \\usegdlibrary {force}
\\tikz \\graph [spring layout] {\n";
    let seen = Array.make (G.n g) false in
    let rec dfs p v =
      if not seen.(v) then (
        seen.(v) <- true;
        if p <> -1 then fprintf f "%i -- %i;\n" v p;
        List.iter (dfs v) (G.neighbors v g)
      ) in
    List.iter (dfs (-1)) (G.vertices g);
    fprintf f ";\n};\n\\end{document}\n";
    close_out f;
    let _ = sprintf "lualatex -shell-escape %s > /dev/null 2>&1" tex 
    |> Sys.command in
    let _ = Format.sprintf "rm -f %s.aux" file_out
    |> Sys.command in
    ()
end
