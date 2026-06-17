let two_sum nums target =
  let hashmap = Hashtbl.create (List.length nums) in

  let rec aux i = function
    | [] -> None
    | x :: xs -> (
        let diff = target - x in
        match Hashtbl.find_opt hashmap diff with
        | Some j -> Some (j, i)
        | None ->
            Hashtbl.replace hashmap x i;
            aux (i + 1) xs)
  in
  aux 0 nums

let test_1 () =
  Alcotest.(check (option (pair int int)))
    "Test 1"
    (Some (0, 1))
    (two_sum [ 3; 4; 5; 6 ] 7)

let test_2 () =
  Alcotest.(check (option (pair int int)))
    "Test 2"
    (Some (0, 2))
    (two_sum [ 4; 5; 6 ] 10)

let test_3 () =
  Alcotest.(check (option (pair int int)))
    "Test 3"
    (Some (0, 1))
    (two_sum [ 5; 5 ] 10)

let test_set =
  [ ("Test 1", `Quick, test_1)
  ; ("Test 2", `Quick, test_2)
  ; ("Test 3", `Quick, test_3)
  ]

let () = Alcotest.run "Two Sum" [ ("tests", test_set) ]
