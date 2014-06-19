#include "share/atspre_staload.hats"

implement main () = let
  val b: bool = true
  val () = println! ("b is: ", b)
  val c: char = 'a'
  val () = println! ("c is: ", c)
// does not typecheck
//  val s: schar = ~20
//  val () = println! ("s is: ", s)
in
0
end
