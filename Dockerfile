FROM master0fn0n3/ocaml-base:1.1

USER opam
WORKDIR /home/opam/ocamlino
COPY --chown=opam:opam . .
CMD ["bash", "-c", "eval \"$(opam env)\" && dune build @all && dune runtest"]


# Command to build the Dockerfile.base
# docker buildx build \
#   --platform linux/amd64,linux/arm64 \
#   --provenance=false \
#   -f Dockerfile.base \
#   -t master0fn0n3/ocaml-base:1.1 \
#   --push .