(* MORE INTEROP *)

#include "share/atspre_staload.hats"
staload STR = "prelude/DATS/string.dats"

extern fn fputs (s: string, f: FILEref): int = "mac#fputs"
extern fn fgets (s: string, sz: int, f: FILEref): string = "mac#fgets"

macdef r_stdin = $extval(FILEref, "stdin")
macdef r_stdout = $extval(FILEref, "stdout")

implement main () = let
//  val (pf, pfc | p) = malloc_gc (100)
//  val S = $STR.castvwtp_trans{strnptr(100)}((pf, pfc | p))
(*
  var S = @"                                                                  ";
*)
  val wrote = fputs("\n\n\nname: ", r_stdout)
(*
  val SS = fgets(S, 20, r_stdin)
  val wrote = fputs("S is: ", r_stdout)
*)
  val wrote = fputs ("\n\nhello ", r_stdout)
//  val wrote = fputs (SS, r_stdout)
  val wrote = fputs ("\n\n", r_stdout)
in
  0
end
