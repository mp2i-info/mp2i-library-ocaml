open Mp2i.ArrayUtils

let a = [|-5; 1; 4; 6; 9; 12|]

let%test "binary_search" = binary_search 1 a && not (binary_search 2 a)
