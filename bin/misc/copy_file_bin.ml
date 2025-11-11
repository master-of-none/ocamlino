open Dsa.Copy_file

let () =
  if Array.length Sys.argv <> 3 then (
    Printf.printf
      "Arguments are provided via command line\n\
      \ If error, Usage: dune exec ./bin/copy_file_bin.exe <file1> <file2>";
    exit 1);
  copy_file Sys.argv.(1) Sys.argv.(2)
