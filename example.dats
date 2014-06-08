(* some steps in learning ats *)

fn pp () = (
  print_newline();
  print_newline()
)

datatype intopt =
  | no_i of ()
  | an_i of (int)

datatype wtree =
  | empty of ()
  | branch of (intopt, wtree,
               intopt, wtree,
               intopt, wtree,
               intopt, wtree,
               intopt, wtree,
               intopt, wtree,
               intopt, wtree)

fun insert (t: wtree, i: int) =
  case t of
  | empty() => (no_i(), empty(),
                no_i(), empty(),
                no_i(), empty(),
                an_i(i), empty(),
                no_i(), empty(),
                no_i(), empty(),
                no_i(), empty())
  | branch(t, a, u, b, v, c, w, d, x, e, y, f, z, g) => 

implement main () = (
  pp();
  p_wtree(insert(0, empty()));  
  pp();
)

//// comment to end of file

// datatypes

datatype intopt =
  | intopt_none of ()
  | intopt_some of (int)

fun safe_div (x: int, y: int): intopt =
  if (y = 0)
  then intopt_none()
  else intopt_some(x/y)

fun pr_intopt (i: intopt): void =
  case i of
  | intopt_none() => print("NaN")
  | intopt_some(n) => print(n)

implement main () = (
  pp();
  pr_intopt(safe_div (1, 0));
  pp();
  pr_intopt(safe_div (5, 2));
  pp();
)

// HOF and computed type signatures

typedef I (a: t@ype) = a -<cloref1> a

fun adder (x: double): I(double) = lam y => x + y

val inc = adder 1.0
val dec = adder ~1.0

fun twice (f: I(double)): I(double) = lam x => f(f(x))

val plpl = twice inc

val mnmn = twice dec

implement main () = (
  pp();
  print(plpl 1.0);
  pp();
  print(mnmn 1.0);
  pp();
)

// we can return a function at runtime

fun adder (x: int): int -<cloref1> int = lam y => x + y

val inc = adder 1
val dec = adder ~1

implement main () = (
  pp();
  print(inc 3);
  pp();
  print(dec 3);
  pp()
)

// lexical closure
// functions can be closed over or not

fun closing (n: int): double =
  let
    fun closed (i: int, acc: double):<cloref1> double = (
      if i <= n then closed (i+1, acc*acc) else acc
    )
  in
    closed(0, 1.3)
end

implement main () = (
  pp();
  print(closing 10);
  pp()
)

// we have tail recursion!
fun sump (n: int, acc: int): int = if n >= 1 then sump (n-1, acc+n) else acc

fun suml (n: int): int = sump( n, 0 )

implement main () = (
  pp ();
  print(suml 1000000);
  pp ();
)


// this is not how we do function overloading, it is just wrong
// fn abs (x: int): int = if x >= 0 then x else ~x

fn abs (x: double): double = if x >= 0.0 then x else ~x

implement main () = (
  pp ();
  print (abs ~1.0);
  pp ();
  print (abs 1.0);
  pp ()
)

// another way to do args, yay currying
implement main () = (
  pp ();
  print "hello";
  pp ();
)

val t = if true then ~1 else 1
// val t = if true then ~1 // this is an error because of the implicit else ()
// var t = if true then ~1 else 1 // this is an error because of scoping


implement main () = (
  pp();
  print(t);
  pp()
)

typedef point = @{ x= double, y= double }

val origin = @{ x= 1.02, y= 2.31 }

fn frob (p: point) : double =
  p.x * p.y * p.x * p.y

fn pr (p: point) : void = (
  print("@{ x= ");
  print(p.x);
  print(", y= ");
  print(p.y);
  print(" }")
)

implement main () = (
  pp();
  pr(origin);
  print(' ');
  print(frob(origin));
  pp()
)

fn extract (a: double,b: double,c: double): double =
    a + b * c

implement main () = (
  pp();
  print(extract(1.133,2.92,3.11111));
  pp()
)

local // similar to let, but for making bindings not returning a value

val a = 4.1 and b = 2.2

in

val c = a * b * b + a

end

fun run () = (
  print (c);
  print (' ');
  print (c);
  print_newline();
)


implement main () = run()

implement main () = begin
  print ("Hello, world!");
  print_newline ()
end

(* **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** *)

// two alternate ways of expressing locals
val area = let
  val PI = 3.14 and radius = 10.0 in PI * radius * radius
end

val area2 =
  PI * radius * radius where {
    val PI = 3.14 and radius = 11.0
}


(* **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** *)

implement main () = begin
  print (area);
  print_newline();
  print (area2);
  print_newline()
end

(* **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** *)

val area =
  PI * radius * radius where {
    val PI = 3.14 and radius = 11.0
}

val round =
  d where {
    val d = "12"
}

val tupper = (area, round)

implement main () = begin
  print (tupper.0);
  print_newline();
  print (tupper.1);
  print_newline();
end

(* **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** *)

val a = 'O';

implement main () = begin
  print ('\{'); // this need the \ or there is an error
  print (a);
  print ('}');
  print_newline();
end
(* **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** *)

val a = "this worked\n"

// another way to do main
implement main () = (
  print (a);
  print (a);
  print (a)
)
(* **** **** **** **** **** **** **** **** **** **** **** **** **** **** **** *)
