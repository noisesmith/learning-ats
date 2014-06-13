(* INTEROP *)

#include "share/atspre_staload.hats"

%{^
double D[] = {0.0, 1.0, 2.0, 4.0, 8.0, 16.0};
%}
extern fn display_d ():void = "mac#display_d_c"
extern fn get_d (i: int):double = "mac#get_d_c"

extern fn atoi(s: string): int = "mac#atoi"

implement main () = let
  val () = println! "\nhello\n"
  val () = println! (atoi "123")
in
  display_d ();
  println! (get_d 4);
  0
end
  

%{^
void display_d_c() {
  printf("\n%f\n", D[3]);
}
%}

%{
double get_d_c(int where) {
  return D[where];
}
%}

