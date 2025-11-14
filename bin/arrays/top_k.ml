open Base

let top_k_frequent nums k =
  let freq = Base.Hashtbl.create (module Base.Int) in

  Base.List.iter nums ~f:(fun n ->
      Base.Hashtbl.update freq n ~f:(function
        | None -> 1
        | Some c -> c + 1));

  let heap = ref BatHeap.empty in
  Base.Hashtbl.iteri freq ~f:(fun ~key:n ~data:count ->
      heap := BatHeap.insert !heap (count, n);

      if BatHeap.size !heap > k then heap := BatHeap.del_min !heap);

  let pairs = BatHeap.to_list !heap in
  Base.List.map pairs ~f:(fun (_, n) -> n)

let () =
  let nums = [ 1; 2; 2; 3; 3; 3 ] in
  let output = top_k_frequent nums 2 in
  List.iter output ~f:(fun n -> Stdio.printf "%d " n);
  Stdio.printf "\n"
