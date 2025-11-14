open Base

let encode strs =
  strs
  |> List.map ~f:(fun s -> Int.to_string (String.length s) ^ "#" ^ s)
  |> String.concat ~sep:""

let decode s =
  let n = String.length s in
  let rec aux i acc =
    if i >= n then List.rev acc
    else
      let j =
        let rec find_hash j =
          if Char.(String.get s j = '#') then j else find_hash (j + 1)
        in
        find_hash i
      in
      let len_str = String.sub s ~pos:i ~len:(j - i) in
      let len = Int.of_string len_str in
      let start = j + 1 in
      let str = String.sub s ~pos:start ~len in

      aux (start + len) (str :: acc)
  in
  aux 0 []

let () =
  let strs = [ "hello"; "world"; "foo#bar"; "" ] in
  let encoded = encode strs in
  Stdio.printf "Encoded: %s\n" encoded;
  let decoded = decode encoded in
  List.iter decoded ~f:(fun s -> Stdio.printf "[%s]\n" s)
