#include "share/atspre_staload.hats"

// lexical closure
// functions can be closed over or not

extern fn closing (n: int): double

implement closing (n) =
  let
    fun closed (i: int, acc: double):<cloref1> double = (
      if i <= n then closed (i+1, acc*acc) else acc
    )
  in
    closed(0, 1.41)
end

implement main () = (
  print "\n\n\n";
  print(closing 10);
  print "\n\n\n";
  0
)
