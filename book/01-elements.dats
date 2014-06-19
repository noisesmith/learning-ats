#include "share/atspre_staload.hats"

// elements of programming

implement main0 () = (
  println! ("number ",  1);
  println! ("negative ", ~2); // unique notation for negative numbers
  println! ("basic math (1+2)/(3-4) ", ((1+2)/(3-4)));
  println! ("floating point 31416E-4, 3. ", 31416E-4, " ", 3.);
  println! ("booleans:",
            "\n\ttrue: ", true,
            "\n\tfalse: ", false,
            "\n\ttrue andalso (1 > 0): ", true andalso (1 > 0),
            "\n\t(~1 <= 0) && true: ", (~1 <= 0) && true,
            "\n\ttrue andalso not(1 >= 0): ", true andalso not(1 >= 0),
            "\n\ttrue && false: ", true && false,
            "\n\tnot(true): ", not(true),
            "\n\ttrue orelse false: ", true orelse false,
            "\n\ttrue || false: ", true || false
  );
  println! ("strings and chars:",
            "\n'a', '\\n', 'b', '\\{': ",
            "\"", 'a', "\", \"", '\n', "\", \"", 'b', "\", \"", '\{',
            "\n\\\"string\\\" quoting rules: ", "\"string\" quoting rules"
  );
  println! ("prefix versions of infix, op+(1, 1): ", op+(1, 1)
  )
)
