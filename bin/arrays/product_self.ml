let product_self_loop nums =
  let n = List.length nums in
  let arr = Array.of_list nums in
  let res = Array.make n 1 in

  let prefix = ref 1 in
  for i = 0 to n - 1 do
    res.(i) <- !prefix;
    prefix := !prefix * arr.(i)
  done;

  let postfix = ref 1 in
  for i = n - 1 downto 0 do
    res.(i) <- res.(i) * !postfix;
    postfix := !postfix * arr.(i)
  done;
  Array.to_list res

let () =
  let result = product_self_loop [ 1; 2; 3; 4 ] in
  List.iter (fun x -> Printf.printf "%d " x) result;
  Printf.printf "\n"
