#include "share/atspre_staload.hats"

// we have tail recursion!
// and pre-declaration of functions
extern fun sump (n: int, acc: int): int

fn suml (n: int): int = sump( n, 0 )

implement sump (n, acc) = if n >= 1 then sump (n-1, acc+n) else acc

implement main () = (
  print "\n\n\n";
  print(suml 1000000);
  print "\n\n\n";
  0
)
