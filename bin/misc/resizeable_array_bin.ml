open Arrays.Resizable_array

let print_array a =
  let elements =
    Array.sub a.data 0 (length a)
    |> Array.to_list
    |> List.map string_of_int
    |> String.concat "; "
  in
  Printf.printf "Size = %d\n [%s]\n" (length a) elements

let () =
  Printf.printf "Initial Array";
  let a = make 5 0 in
  print_array a;

  Printf.printf "Set";
  set a 1 69;
  set a 2 100;
  Printf.printf "After set";
  print_array a;
  Printf.printf "Resize";
  resize a 10;
  print_array a
