(lang dune 3.18)
(name ocamlino)


(package
 (name ocamlino)
 (synopsis "Playground for OCaml DSA and AoC")
 (description "Personal OCaml projects for DSA, AoC, and learning.")
 (authors "Shrikrishna Bhat")
 (depends ocaml dune alcotest))


(generate_opam_files)
; (using alcotest 1.9)
