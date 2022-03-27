let%test "search" = Mp2i__Search.(
  boyer_moore "afo e inform" "nfo" = 7 &&
  boyer_moore "blabla" "bl" = 0 &&
  boyer_moore "this is a test" "tt" = -1 &&
  boyer_moore "this is a test" "this is a test" = 0 &&
  boyer_moore "this is a test" "test" = 10
)