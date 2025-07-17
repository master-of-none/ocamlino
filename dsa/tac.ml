let tac lines =
  try
    while true do
      lines := read_line () :: !lines
    done
  with End_of_file -> ()

let rec print_list l =
  match l with
  | [] -> ()
  | s :: r ->
      print_endline s;
      print_list r
