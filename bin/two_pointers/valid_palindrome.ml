open Base

let is_alpha_num c = Char.is_alpha c || Char.is_digit c

let valid_palidrome str =
  let chars =
    str
    |> String.to_list
    |> List.filter ~f:is_alpha_num
    |> List.map ~f:Char.lowercase
  in
  List.equal Char.equal chars (List.rev chars)
(*!! TODO - Two Pointers *)

let () =
  let str = "Was it a car or a cat I saw?" in
  Stdio.printf "%b\n" (valid_palidrome str)
