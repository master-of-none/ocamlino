let copy_file f1 f2 =
  let c1 = open_in f1 in
  let c2 = open_out f2 in

  try
    while true do
      output_char c2 (input_char c1)
    done
  with End_of_file ->
    close_in c1;
    close_out c2
