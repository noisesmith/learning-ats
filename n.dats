#include "share/atspre_staload.hats"
fn pp () = print "\n\n\n";
// alternate version of m.dats

// playing with abstract data types

// mutual recursion

extern fun a(i: int): void
extern fun b(i: int): void

fn doit (): void = a 10

implement a (i) = begin
  print("a-> ");
  print(i);
  print("\n");
  b(i - 2)
end

implement b (i) =
  if(i > 0)
  then begin
    print("b-> ");
    print(i);
    print("\n");
    a(i + 1)
  end


implement main () = (
  pp();
  doit();
  pp();
  0
)
