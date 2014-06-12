#include "share/atspre_staload.hats"

// two alternate ways of expressing locals
val area = let
  val PI = 3.14 and radius = 10.0 in PI * radius * radius
end

val area2 =
  PI * radius * radius where {
    val PI = 3.14 and radius = 11.0
}


(* **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** *)

implement main () = begin
  print "\n\n\n";
  print (area);
  print "\n\n\n";
  print (area2);
  print "\n\n\n";
  0
end

