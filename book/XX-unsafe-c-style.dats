#include "share/atspre_staload.hats"

// fun strcmp (str1: string, str2: string): int

local
staload UN = "prelude/SATS/unsafe.sats"
in
fn
strcmp (str1: string, str2: string): int = let
fun loop
  (p1: ptr, p2: ptr): int = let
val c1 = $UN.ptr0_get<uchar> (p1)
val c2 = $UN.ptr0_get<uchar> (p2)
in
  case+ 0 of
  | _ when c1 > c2 => 1
  | _ when c1 < c2 => ~1
  | _ =>
    (
      if $UN.cast{int}(c1) = 0
      then 0
      else loop (ptr0_succ<uchar> (p1), ptr0_succ<uchar> (p2))
    )
end
in
  loop (string2ptr(str1), string2ptr(str2))
end
end

implement main () = let
  val a = "hello"
  val b = "world"
in
println! ("comaring \"", a, "\" to \"", b, "\", gets: ", strcmp(a, b));
0
end
