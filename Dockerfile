FROM master0fn0n3/ocaml-base:1.1

USER opam
WORKDIR /home/opam/ocamlino
COPY --chown=opam:opam . .
CMD ["bash", "-c", "eval \"$(opam env)\" && dune build @all && dune runtest"]