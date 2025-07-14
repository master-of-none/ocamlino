(** Main entry point for running executable OCaml programs in the project.

    This file is meant to serve as a central launcher for running and testing
    various algorithmic modules implemented under the [dsa/] folder.

    Each module encapsulates one or more algorithmic problems or utilities, such
    as checking leap years, generating prime numbers, sorting lists, etc.

    Future enhancements:
    - Add a simple CLI menu to choose which module to run
    - Support command-line arguments instead of interactive input *)

open Dsa.Sieve

let () =
  print_string "Enter max: ";
  let max = read_int () in
  let primes = calculate_prime max in
  for n = 2 to max do
    if primes.(n) then Printf.printf "%d " n
  done;
  print_newline ()
