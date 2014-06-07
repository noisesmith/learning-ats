(* some steps in learning ats *)

fn pp () = (
  print_newline();
  print_newline()
)

implement main () = (
  pp()
)

//// comment to end of file

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
