let two_sum_sorted nums target =
  let arr = Array.of_list nums in
  let l = ref 0 in
  let r = ref (Array.length arr - 1) in
  let result = ref None in

  while !l < !r && Option.is_none !result do
    let sum = arr.(!l) + arr.(!r) in
    if sum = target then result := Some (!l, !r)
    else if sum > target then r := !r - 1
    else l := !l + 1
  done;

  !result

let () =
  match two_sum_sorted [ 1; 2; 3; 4; 5 ] 7 with
  | None -> Stdio.printf "No solution"
  | Some (i, j) -> Printf.printf "%d %d\n" i j
