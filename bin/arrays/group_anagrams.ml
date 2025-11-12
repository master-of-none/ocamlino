open Base

let solve strs =
  let hashmap = Hashtbl.create (module String) in
  List.iter strs ~f:(fun s ->
      let sorted_s =
        s
        |> String.to_list
        |> List.sort ~compare:Char.compare
        |> String.of_char_list
      in
      Hashtbl.update hashmap sorted_s ~f:(function
        | None -> [ s ]
        | Some group -> s :: group));
  Hashtbl.data hashmap

let () =
  let input = [ "eat"; "tea"; "tan"; "ate"; "nat"; "bat" ] in
  let grouped = solve input in
  List.iter grouped ~f:(fun group ->
      Stdio.printf "[ %s ]\n" (String.concat ~sep:", " group))
