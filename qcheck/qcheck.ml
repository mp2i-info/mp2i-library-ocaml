let test_mergesort l = List.sort Int.compare l = Mp2i.Mergesort.sort l
let t = QCheck.(Test.make ~count:1000 (list int) test_mergesort);;

QCheck_runner.run_tests [ t ]

let test_binary_search e a = Array.mem e a = Mp2i.ArrayUtils.binary_search e a

let t =
  QCheck.(
    Test.make ~count:1000
      QCheck.(pair int (array int))
      (fun (x, y) -> test_binary_search x y))
;;

QCheck_runner.run_tests [ t ]
