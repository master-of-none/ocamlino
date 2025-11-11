open Dsa.Sieve

let () =
  print_string "Enter max: ";
  let max = read_int () in
  let primes = calculate_prime max in
  for n = 2 to max do
    if primes.(n) then Printf.printf "%d " n
  done;
  print_newline ()
