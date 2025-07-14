# FROM ocaml/opam:debian
#
# USER opam
# WORKDIR /home/opam/ocamlino
#
# COPY --chown=opam:opam . .
#
# RUN opam update && opam install dune 
# RUN bash -c "eval $(opam env)"
#
# RUN bash -c "eval \"\$(opam env)\" && dune build @all && dune runtest"
#

FROM alpine:3.14

# Install basic tools
RUN apk add --no-cache bash curl git gmp gmp-dev build-base \
    ocaml ocaml-compiler-libs opam

# Create non-root user
RUN adduser -D -u 1000 opam
USER opam
WORKDIR /home/opam/ocamlino

# Initialize opam (for the opam user)
RUN opam init -y --disable-sandboxing && \
    bash -c "eval \"\$(opam env)\" && opam install -y dune"

# Copy project
COPY --chown=opam:opam . .

# Build and test
RUN bash -c "eval \"\$(opam env)\" && dune build @all && dune runtest"
