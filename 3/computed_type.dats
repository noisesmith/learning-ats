#include "share/atspre_staload.hats"
fn pp () = print "\n\n\n";

// HOF and computed type signatures

typedef I (a: t@ype) = a -<cloref1> a

fun adder (x: double): I(double) = lam y => x + y

val inc = adder 1.0
val dec = adder ~1.0

fun twice (f: I(double)): I(double) = lam x => f(f(x))

val plpl = twice inc

val mnmn = twice dec

implement main () = (
  pp();
  print(plpl 1.0);
  pp();
  print(mnmn 1.0);
  pp();
  0
)
