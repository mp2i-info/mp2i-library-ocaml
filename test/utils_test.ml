let a = [|-5; 1; 4; 6; 9; 12|]

let%test "binary_search" = Mp2i.ArrayUtils.binary_search 1 a && not (Mp2i.ArrayUtils.binary_search 2 a)
