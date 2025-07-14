(** Main entry point for running executable OCaml programs in the project.

    This file is meant to serve as a central launcher for running and testing
    various algorithmic modules implemented under the [dsa/] folder.

    Each module encapsulates one or more algorithmic problems or utilities, such
    as checking leap years, generating prime numbers, sorting lists, etc.

    Future enhancements:
    - Add a simple CLI menu to choose which module to run
    - Support command-line arguments instead of interactive input *)

let () =
  print_endline "Run a specific program:";
  print_endline "  dune exec bin/sieve.exe";
  print_endline "  dune exec bin/leap_year.exe"
