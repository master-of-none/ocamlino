open Base

let solve_sort s t =
  let sorted str = str |> String.to_list |> List.sort ~compare:Char.compare in
  List.equal Char.equal (sorted s) (sorted t)

let solve_map s t =
  if String.length s <> String.length t then false
  else
    let s_map = Hashtbl.create (module Char) in
    let t_map = Hashtbl.create (module Char) in

    String.iter s ~f:(fun c ->
        Hashtbl.update s_map c ~f:(function
          | None -> 1
          | Some count -> count + 1));
    String.iter t ~f:(fun c ->
        Hashtbl.update t_map c ~f:(function
          | None -> 1
          | Some count -> count + 1));

    Hashtbl.equal Int.equal s_map t_map

let () =
  let s = "anagram" in
  let t = "nagvram" in
  Stdio.printf "%b\n" (solve_sort s t)

let () =
  let s = "anagram" in
  let t = "nagaarm" in
  Stdio.printf "%b\n" (solve_map s t)
