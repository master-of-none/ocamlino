open Base

let solve nums target =
  let hashmap = Hashtbl.create (module Int) in

  let rec aux i = function
    | [] -> None
    | x :: xs -> (
        let diff = target - x in
        match Hashtbl.find hashmap diff with
        | Some j -> Some (j, i)
        | None ->
            Hashtbl.set hashmap ~key:x ~data:i;
            aux (i + 1) xs)
  in
  aux 0 nums

let () =
  match solve [ 1; 2; 3; 4 ] 4 with
  | Some (i, j) -> Stdio.printf "Indices are: %d %d\n" i j
  | None -> Stdio.printf "Not found"
