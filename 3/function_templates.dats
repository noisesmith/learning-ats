#include "share/atspre_staload.hats"

typedef charint = (char, int)
typedef intchar = (int, char)

fn swap_char_int (xy: charint): intchar = (xy.1, xy.0)
fn swap_int_char (yx: intchar): charint = (yx.1, yx.0)

fn {a,b:t@ype} swap (xy: (a, b)): (b, a) = (xy.1, xy.0)
fn swci (xy: charint): intchar = swap(*<char,int>*) xy // commented type tags
fn swic (yx: intchar): charint = swap(*<int,char>*) yx // from the example

implement main () = let
  val a = ('a', 0)
  val a2 = swap_char_int a
  val a3 = swic a2
  val b = (1, 'b')
  val b2 = swap_int_char b
  val b3 = swci b2
in
print "\n\n('"; print a.0; print "',"; print a.1; print ")\n\n";
print "("; print a2.0; print ",'"; print a2.1; print "')\n\n";
print "('"; print a3.0; print "',"; print a3.1; print ")\n\n";
print "("; print b.0; print ",'"; print b.1; print "')\n\n";
print "('"; print b2.0; print "',"; print b2.1; print ")\n\n";
print "("; print b3.0; print ",'"; print b3.1; print "')\n\n";
0
end
