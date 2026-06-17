let valid_anagram s t =
  if String.length s <> String.length t then
    false
  else
    let s_map = Hashtbl.create (String.length s) in
    let t_map = Hashtbl.create (String.length t) in

    String.iter
      (fun c ->
        let count = Hashtbl.find_opt s_map c |> Option.value ~default:0 in
        Hashtbl.replace s_map c (count + 1))
      s;

    String.iter
      (fun c ->
        let count = Hashtbl.find_opt t_map c |> Option.value ~default:0 in
        Hashtbl.replace t_map c (count + 1))
      t;

    Hashtbl.fold
      (fun key value acc ->
        acc && value = (Hashtbl.find_opt t_map key |> Option.value ~default:0))
      s_map true

let test_valid_anagram () =
  Alcotest.(check bool) "Valid Anagram" true (valid_anagram "anagram" "nagaram")

let test_invalid_anagram () =
  Alcotest.(check bool) "Invalid Anagram" false (valid_anagram "hello" "world")

let test_different_length () =
  Alcotest.(check bool) "Different Length" false (valid_anagram "aaa" "aa")

let test_set =
  [ ("valid anagram", `Quick, test_valid_anagram)
  ; ("invalid anagram", `Quick, test_invalid_anagram)
  ; ("different length", `Quick, test_different_length)
  ]

let () = Alcotest.run "Valid Anagram" [ ("tests", test_set) ]
