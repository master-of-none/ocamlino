open Base

let solve nums =
  let set = Hash_set.create (module Int) in
  let rec aux = function
    | [] -> false
    | x :: xs ->
        if Hash_set.mem set x then true
        else (
          Hash_set.add set x;
          aux xs)
  in
  aux nums

let () =
  let nums = [ 1; 2; 3; 4 ] in
  Stdio.printf "%b\n" (solve nums)
