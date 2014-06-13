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

implement main () = let
  val () = print "\n\n\n";
  val () = print (area);
  val () = print "\n\n\n";
  val () = print (area2);
  val () = print "\n\n\n";
in
0
end

