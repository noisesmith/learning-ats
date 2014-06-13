#include "share/atspre_staload.hats"

local // like let, but no return value
  val a = 4.1
  and b = 2.2 in
val c = a * b * b + a
end

fun run () = (
  print "\n\n\n";
  print (c);
  print (' ');
  print (c);
  print "\n\n\n";
  0
)


implement main () = run()
