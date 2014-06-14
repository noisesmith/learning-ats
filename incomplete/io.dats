// file:///media/justin/806084F16084EEEA/justin/ats/doc/HTML/x1635.html

#include "share/atspre_staload.hats"

// staload "libats/ML/SATS/filebas.sats"
// staload "prelude/SATS/filebas.sats"

// fun fileref_get_line_string (fil: FILEref): Strptr1

implement
main0 (
// argumentless
) = loop () where
{
//
fun loop (): void = let
  val isnot = fileref_isnot_eof (stdin_ref)
in
//
if isnot then let
  val line =
    fileref_get_line_string (stdin_ref)
  val ((*void*)) = fprintln! (stdout_ref, line)
  val ((*void*)) = strptr_free (line)
in
  loop ()
end else ((*loop exits as the end-of-file is reached*))
//
end (* end of [loop] *)
//
} (* end of [main0] *)

////

macdef fileref_isnot_eof (inp) = ~fileref_is_eof (,(inp))
macdef fileref_isnot_eof (inp) = ~fileref_is_eof (,(inp))

implement main() = if (fileref_isnot_eof stdin_ref)
then let
  val line = fileref_get_line_string stdin_ref
  val () = print "\n\nhello, "
  val () = print line
in
strptr_free line
0
end
else
1

