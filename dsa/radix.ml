let list_of_string s =
  let digits = ref [] in
  for i = 0 to String.length s - 1 do
    digits := s.[i] :: !digits
  done;
  !digits

let digit_of_char c =
  match c with
  | '0' .. '9' -> Char.code c - Char.code '0'
  | 'A' .. 'Z' -> 10 + Char.code c - Char.code 'A'
  | c -> failwith (Printf.sprintf "Invalid Character %c" c)

let check_digit d base =
  if d < 0 || d >= base then
    failwith (Printf.sprintf "Invalid digit %d for base %d" d base)

let convert_to_decimal base s =
  let cl = list_of_string s in
  let dl = List.map digit_of_char cl in
  List.iter (fun d -> check_digit d base) dl;
  List.fold_right (fun d acc -> d + (base * acc)) dl 0
