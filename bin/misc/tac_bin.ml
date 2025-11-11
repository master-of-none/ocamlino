open Dsa.Tac

let () =
  let lines = ref [] in
  Printf.printf "Enter lines (To stop press <C-d>)\n";
  tac lines;
  Printf.printf "Output in reverse order\n";
  print_list !lines
