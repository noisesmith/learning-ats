#include "share/atspre_staload.hats"

implement main() = let
  val x = 1 + 2
  val PI = 3.14
  and radius = 10.0
  val area = PI * radius * radius
in
println! ("x is: ", x);
println! ("area is: ", area);
0
end
