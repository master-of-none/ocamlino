(*! The codes written here are only to test various codes from the textbook *)
(*! These are just for understanding and dont implement any algorithms. *)
(*! These were just used for testing and learning purposes *)

let division x y =
  try
    let q = x / y in
    Printf.printf "Quotient is: %d\n" q
  with Division_by_zero ->
    Printf.printf "Error: Division_by_zero not possible\n"

let () =
  Printf.printf "Enter x\n";
  let x = read_int () in
  Printf.printf "Enter y\n";
  let y = read_int () in
  division x y
