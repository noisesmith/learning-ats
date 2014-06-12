#include "share/atspre_staload.hats"
fn pp () = print "\n\n\n";

implement main() = let
  var A = @[double](1.0, 2.0, 4.0, 8.0, 16.0)
  var d = A[2]
in
  pp();
  print d;
  pp();
  0
end

////

datatype intopt =
  | no_i of ()
  | an_i of (int)

datatype btree =
  | empty of ()
  | branch of (stree, intopt,
               stree, intopt,
               stree, intopt,
               stree, intopt,
               stree, intopt,
               stree, intopt,
               stree)

fun empty_equal (i: int, I: intopt): bool =
  case+ I of
  | no_i() => true
  | an_i(n) => i = n

fun pr_intopt (i: intopt): void = (
  print("<");
  case+ i of
  | no_i() => print("NaN")
  | an_i(n) => print(n);
  print(">")
)

fun pr_level(level: int): void =
  if (level > 0) then (print("\t"); pr_level(level - 1))

fun pr_stree(s: stree): void =
  pr(b, 0) where {
    fun p_branch(l: int, s: stree, c: char) = (
      pr_level(l);
      print(c);
      print(":\n");
      pr(s, l + 1)
    )
    and print_empty(l: int): void = (pr_level(l); print("empty"))
    and pr(s: stree, lv: int): void = (
      case+ s of
      | empty() => print_empty(lv)
      | branch(a, i,
               b, j,
               c, k,
               d, l,
               e, m,
               f, n,
               g) => (
          p_branch(lv, a, 'a');
          print("\n");
          pr_level(lv); pr_intopt(i);
          print("\n");
          p_branch(lv, b, 'b');
          print("\n");
          pr_level(lv); pr_intopt(j);
          print("\n");
          p_branch(lv, c, 'c');
          print("\n");
          pr_level(lv); pr_intopt(k);
          print("\n");
          p_branch(lv, d, 'd');
          print("\n");
          pr_level(lv); pr_intopt(l);
          print("\n");
          p_branch(lv, e, 'e');
          print("\n");
          pr_level(lv); pr_intopt(m);
          print("\n");
          p_branch(lv, f, 'f');
          print("\n");
          pr_level(lv); pr_intopt(n);
          print("\n");
          p_branch(lv, g, 'g');
          print("\n");
         )
    )
}

fun insert(s: stree, i: int): stree = let
  fun ins_a (s: stree, I: int) stree =
    case+ s of | empty() => ins_(s, I)
    | (a, i, b, j, c, k, d, l, e, m, f, n, g) =>
        let a = insert(a, I) in
        (a, i b, j, c, k, d, l, e, m, f, n, g)
  and ins_b (s: stree, I: int) stree =
    case+ s of | empty() => ins_(s, I)
    | (a, i, b, j, c, k, d, l, e, m, f, n, g) =>
        let b = insert(b, I) in
        (a, i, b, j, c, k, d, l, e, m, f, n, g)
  and ins_c (s: stree, I: int) stree =
    case+ s of | empty() => ins_(s, I)
    | (a, i, b, j, c, k, d, l, e, m, f, n, g) =>
        let c = insert(c, I) in
        (a, i, b, j, c, k, d, l, e, m, f, n, g)
  and ins_d (s: stree, I: int) stree =
    case+ s of | empty() => ins_(s, I)
    | (a, i, b, j, c, k, d, l, e, m, f, n, g) =>
        let d = insert(d, I) in
        (a, i, b, j, c, k, d, l, e, m, f, n, g)
  and ins_e (s: stree, I: int) stree =
    case+ s of | empty() => ins_(s, I)
    | (a, i, b, j, c, k, d, l, e, m, f, n, g) =>
        let e = insert(e, I) in
        (a, i, b, j, c, k, d, l, e, m, f, n, g)
  and ins_f (s: stree, I: int) stree =
    case+ s of | empty() => ins_(s, I)
    | (a, i, b, j, c, k, d, l, e, m, f, n, g) =>
        let f = insert(f, I) in
        (a, i, b, j, c, k, d, l, e, m, f, n, g)
  and ins_g (s: stree, I: int) stree =
    case+ s of | empty() => ins_(s, I)
    | (a, i, b, j, c, k, d, l, e, m, f, n, g) =>
        let g = insert(g, I) in
        (a, i, b, j, c, k, d, l, e, m, f, n, g)
  and ins_ (s: stree, I: int): stree =
    case+ s of
    | empty() => branch(empty(), no_i(),
                        empty(), no_i(),
                        empty(), no_i(),
                        empty(), an_i(I),
                        empty(), no_i(),
                        empty(), no_i(),
                        empty())
    | branch(a, i,
             b, j,
             c, k,
             d, l,
             e, m,
             f, n,
             g) => let
          val pos = case+ l of
                    | no_i() => 0
                    | an_i(v) where v = I => 0
                    | an_i(v) where v > I => -1
                    | an_i(v) where v < I => 1
  
implement main () = (
  pp();
  pr_btree(empty());
  pp();
  pr_btree(branch(empty(), an_i(3), empty()));
  pp();
  pr_btree(branch(branch(empty(), an_i(~1), empty()), an_i(3), empty()));
  pp();
  pr_btree(insert(empty(), 3));
  pp();
  pr_btree(t) where {
    val t = insert(empty(), 3)
    val t = insert(t, 100)
    val t = insert(t, ~127)
    val t = insert(t, ~1)
  };
  pp();
)
//// comment to end of file
