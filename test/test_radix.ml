open Alcotest
open Dsa.Radix

let test_base_10 () =
  let result = convert_to_decimal 10 "123" in
  check int "123 in base 10" 123 result

let test_base_16 () =
  let result = convert_to_decimal 16 "1A" in
  check int "1A in base 16" 26 result

let test_invalid_digit () =
  try
    let _ = convert_to_decimal 10 "1Z" in
    fail "Execption is imminent here"
  with Failure msg ->
    check string "error message" "Invalid digit 35 for base 10" msg

let () =
  run "Base Tests"
    [ ( "conversion"
      , [ test_case "Base 10 conversion" `Quick test_base_10
        ; test_case "Base 16 conversion" `Quick test_base_16
        ; test_case "Invalid Digit Error" `Quick test_invalid_digit
        ] )
    ]
