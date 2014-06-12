#include "share/atspre_staload.hats"
fn pp () = print "\n\n\n";

// playing with abstract data types

// mutual recursion

fn doit (): void =
  a(10) where {
    fun a(i: int): void = (print("a-> "); print(i); print("\n"); b(i - 2))
    and b(i: int): void = if(i > 0) then (print("b-> "); print(i); print("\n");
                                          a(i + 1))
  }

implement main () = (
  pp();
  doit();
  pp();
  0
)
