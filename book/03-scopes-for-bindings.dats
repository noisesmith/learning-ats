#include "share/atspre_staload.hats"
// various scopes for bindings


local // local is for creating top level delimited blocks with bindings
    val PI = 3.14
    and radius = 10.0
    val area = PI * radius * radius;
in
val area2 = area
end;

implement main () =  let
  val area0 = let
    val PI = 3.14
    and radius = 10.0
    in PI * radius * radius
    end
  and area1 =
    PI * radius * radius where {
      val PI = 3.14
      and radius = 10.0
    }
in
println! ("area0 is: ", area0);
println! ("area1 is: ", area1);
println! ("area2 is: ", area2);
0
end
