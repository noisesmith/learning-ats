#include "share/atspre_staload.hats"

// fun strcmp (str1: string, str2: string): int

extern fn malloc(i: int): ptr = "mac#malloc"
extern fn free(p: ptr): void = "mac#free"

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

fn
strlen (str: string): int = let
fun loop
  (p: ptr, count: int): int = let
  val c = $UN.ptr0_get<uchar> (p)
  in
    if $UN.cast{int}(c) = 0
    then count
    else loop (ptr0_succ<uchar> (p), count + 1)
  end
in
  loop(string2ptr(str), 0)
end

fn
strcat (str1: string, str2: string): string = let
val c1 = strlen str1
and c2 = strlen str2
fun fill (* takes a source and a dest, reads until source or countdown is  0,
            returns final dest *)
  (p_src: ptr, p_dest: ptr, countdown: int): ptr = let
  val c = $UN.ptr0_get<uchar> (p_src)
  in
    if $UN.cast{int}(c) = 0 orelse countdown < 1
    then p_dest
    else (
      $UN.ptr0_set<uchar> (p_dest, c);
      fill (ptr0_succ<uchar> (p_src), ptr0_succ<uchar> (p_dest), countdown - 1)
    )
  end
val buff = malloc((c1+c2) * $UN.cast{int}(sizeof<uchar>))
val fill_ptr = fill(string2ptr(str1), buff, c1)
val end_ptr = fill(string2ptr(str2), fill_ptr, c2)
in
  $UN.cast{string}(buff)
end

end

implement main () = let
  val a = "hello"
  val b = "world"
  val c = strcat (a, b)
in
println! ("comparing \"", a, "\" to \"", b, "\", gets: ", strcmp(a, b));
println! ("counting \"", a, "\" gets ", strlen a);
println! ("concat: ", c);
free (string2ptr(c));
println! ("concat, freed: ", c);
// free (string2ptr(c)); this of course will puke
0
end
