let is_contain nums =
  let hashset = Hashtbl.create (List.length nums) in
  let rec traverse nums =
    match nums with
    | [] -> false
    | x :: xs ->
        if Hashtbl.mem hashset x then
          true
        else (
          Hashtbl.add hashset x 1;
          traverse xs
        )
  in
  traverse nums

let test_contains () =
  Alcotest.(check bool) "Contains Duplicate" true (is_contain [ 1; 2; 3; 1 ])

let test_does_not_contain () =
  Alcotest.(check bool)
    "Does not contain Duplicate" false
    (is_contain [ 1; 2; 3; 4 ])

let test_set =
  [ ("Contains", `Quick, test_contains)
  ; ("Does not contain", `Quick, test_does_not_contain)
  ]

let () = Alcotest.run "LeetCode Contains " [ ("Tests", test_set) ]
