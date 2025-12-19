open Base

let longest_consec nums =
  let hashset = Hash_set.of_list (module Int) nums in
  let longest = ref 0 in

  Hash_set.iter hashset ~f:(fun num ->
      if not (Hash_set.mem hashset (num - 1)) then begin
        let length = ref 1 in

        while Hash_set.mem hashset (num + !length) do
          Int.incr length
        done;
        longest := Int.max !longest !length
      end);
  !longest

let longest_consec_func nums =
  let hashset = Hash_set.of_list (module Int) nums in

  let is_start num = not (Hash_set.mem hashset (num - 1)) in

  let rec length num =
    if Hash_set.mem hashset num then 1 + length (num + 1) else 0
  in

  nums
  |> List.filter ~f:is_start
  |> List.map ~f:(fun num -> length num)
  |> List.fold ~init:0 ~f:Int.max

let () =
  let nums = [ 100; 40; 200; 1; 3; 2 ] in
  Stdio.printf "%d\n" (longest_consec nums);
  Stdio.printf "%d\n" (longest_consec_func nums)
