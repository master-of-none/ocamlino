open Alcotest
open Dsa.Leap_year

let test_2000 () = check bool "2000 is leap year" true (leap_year 2000)

let () =
  run "Leap Year Tests"
    [ ("leap year check", [ test_case "Year 2000" `Quick test_2000 ]) ]
