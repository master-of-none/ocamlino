open Base

let valid_sudoku board =
  let rows = Array.init 9 ~f:(fun _ -> Hash_set.create (module Char)) in
  let cols = Array.init 9 ~f:(fun _ -> Hash_set.create (module Char)) in
  let squares = Array.init 9 ~f:(fun _ -> Hash_set.create (module Char)) in

  let valid = ref true in

  for r = 0 to 8 do
    for c = 0 to 8 do
      let ch = board.(r).(c) in

      if not (Char.equal ch '.') then begin
        let sq = (r / 3 * 3) + (c / 3) in
        if
          Hash_set.mem rows.(r) ch
          || Hash_set.mem cols.(c) ch
          || Hash_set.mem squares.(sq) ch
        then valid := false
        else begin
          Hash_set.add rows.(r) ch;
          Hash_set.add cols.(c) ch;
          Hash_set.add squares.(sq) ch
        end
      end
    done
  done;

  !valid

let () =
  let board =
    [| [| '5'; '3'; '.'; '.'; '7'; '.'; '.'; '.'; '.' |]
     ; [| '6'; '.'; '.'; '1'; '9'; '5'; '.'; '.'; '.' |]
     ; [| '.'; '9'; '8'; '.'; '.'; '.'; '.'; '6'; '.' |]
     ; [| '8'; '.'; '.'; '.'; '6'; '.'; '.'; '.'; '3' |]
     ; [| '4'; '.'; '.'; '8'; '.'; '3'; '.'; '.'; '1' |]
     ; [| '7'; '.'; '.'; '.'; '2'; '.'; '.'; '.'; '6' |]
     ; [| '.'; '6'; '.'; '.'; '.'; '.'; '2'; '8'; '.' |]
     ; [| '.'; '.'; '.'; '4'; '1'; '9'; '.'; '.'; '5' |]
     ; [| '.'; '.'; '.'; '.'; '8'; '.'; '.'; '7'; '9' |]
    |]
  in

  Stdio.printf "%b\n" (valid_sudoku board)
