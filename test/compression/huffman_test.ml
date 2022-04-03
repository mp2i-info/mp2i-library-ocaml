open Mp2i__Huffman

let%test "huffman" = 
  let _ = [|(20, 'a'); (15, 'b'); (7, 'c'); (14, 'd'); (44, 'e')|]
  |> build_huffman in true
