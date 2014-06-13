#include "share/atspre_staload.hats"
fn pp () = print "\n\n\n";


// datatypes

datatype intopt =
  | intopt_none of ()
  | intopt_some of (int)

fun safe_div (x: int, y: int): intopt =
  if (y = 0)
  then intopt_none()
  else intopt_some(x/y)

fun pr_intopt (i: intopt): void =
  case i of
  | intopt_none() => print("NaN")
  | intopt_some(n) => print(n)

implement main () = (
  pp();
  pr_intopt(safe_div (1, 0));
  pp();
  pr_intopt(safe_div (5, 2));
  pp();
  0
)
