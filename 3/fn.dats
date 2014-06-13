#include "share/atspre_staload.hats"

fn extract
  (a: double,b: double,c: double): double =
  a + b * c

implement main () = (
  print "\n\n\n";
  print (extract (1.133, 2.92, 3.11111));
  print "\n\n\n";
  0
)
