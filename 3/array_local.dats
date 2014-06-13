#include "share/atspre_staload.hats"
// woah, we can use arrays

fn pp () = print "\n\n\n";

implement main() = let
  var A = @[double](1.0, 2.0, 4.0, 8.0, 16.0)
  var d = A[2]
in
  pp();
  print d;
  pp();
  0
end
