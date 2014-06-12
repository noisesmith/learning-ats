#include "share/atspre_staload.hats"

typedef point = @{ x= double, y= double }

val origin = @{ x= 1.02, y= 2.31 }

fn frob (p: point) : double =
  p.x * p.y * p.x * p.y

fn pr (p: point) : void = (
  print("@{ x= ");
  print(p.x);
  print(", y= ");
  print(p.y);
  print(" }")
)

implement main () = (
  print "\n\n\n";
  pr(origin);
  print(' ');
  print(frob(origin));
  print "\n\n\n";
  0
)

