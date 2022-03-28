let samples = [("afo e inform", "nfo", 7); ("blabla", "bl", 0); ("this is a test", "tt", -1); ("this is a test", "this is a test", 0); ("this is a test", "test", 10); ("ttetestest", "test", 3); ("ttetesetes", "test", -1)]

let%test "boyer_moore" = List.for_all (fun (t, w, v) -> Mp2i__Search.boyer_moore t w = v) samples;;

let%test "rabin_karp" = List.for_all (fun (t, w, v) -> Mp2i__Search.rabin_karp t w = v) samples;;
