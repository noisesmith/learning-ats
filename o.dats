#include "share/atspre_staload.hats"

(* some steps in learning ats *)

// binary tree impl

fn pp (): void = print("\n***************************************\n");

datatype intopt =
  | no_i of ()
  | an_i of (int)

datatype btree =
  | empty of ()
  | branch of (btree, intopt, btree)

fn pr_intopt (i: intopt): void = (
  print("<");
  case+ i of
  | no_i() => print("NaN")
  | an_i(n) => print(n);
  print(">");
)

fn pr_level(level: int): void = let
  fun loop(level: int): void =
    if level > 0
    then begin
      print("\t");
      loop(level - 1)
    end
    else ();
in
  loop(level)
end

fn pr_btree(b: btree): void =
  pr(b, 0) where {
    fun p_branch(l: int, b: btree, c: char) = (
      pr_level(l);
      print(c);
      print(":\n");
      pr(b, l + 1)
    )
    and print_empty(l: int): void = (pr_level(l); print("empty"))
    and pr(b: btree, l: int): void = (
      case+ b of
      | empty() => print_empty(l)
      | branch(a, i, b) => (
          p_branch(l, a, 'a');
          print("\n");
          pr_level(l);
          pr_intopt(i);
          print("\n");
          p_branch(l, b, 'b')
         )
    )
}

fun insert(b: btree, i: int): btree =
  case+ b of
  | empty() => branch(empty(), an_i(i), empty())
  | branch(a, n, b) =>
    case n of
    | no_i() => branch(a, an_i(i), b)
    | an_i(j) => if (j > i)
                 then branch(insert(a, i), n, b)
                 else branch(a, n, insert(b, i))

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
  0
)
