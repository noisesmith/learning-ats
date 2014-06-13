#include "share/atspre_staload.hats"
fn pp () = print "\n\n\n";

// we can return a function at runtime

fun adder (x: int): int -<cloref1> int = lam y => x + y

val inc = adder 1
val dec = adder ~1

implement main () = (
  pp();
  print(inc 3);
  pp();
  print(dec 3);
  pp();
  0
)
