#include "share/atspre_staload.hats"

val area =
  PI * radius * radius where {
    val PI = 3.14 and radius = 11.0
}

val round =
  d where {
    val d = "12"
}

val tupper = (area, round)

implement main () = begin
  print("\n\n");
  print (tupper.0);
  print_newline();
  print (tupper.1);
  print_newline();
  0
end

