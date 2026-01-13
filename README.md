# OCamlino

**OCamlino** is a personal playground for learning **OCaml** through:

-   Data Structures and Algorithms (DSA)
-   LeetCode-style problem solving
-   Experimenting with functional programming patterns

Built with OCaml, `dune`, and automated via Docker and GitHub Actions for CI/CD.

---

## Project Structure

```
ocamlino/
├── bin/                      # Executable problem solutions
│   ├── arrays/              # Array problems (two-sum, anagrams, sudoku, etc.)
│   ├── two_pointers/        # Two-pointer technique problems
│   └── misc/                # Miscellaneous binaries and utilities
├── dsa/                      # Core DSA library
│   ├── arrays/              # Bit vector, persistent array, ropes, resizable array
│   ├── trees/               # Binary search tree (BST)
│   └── [algorithms]         # Radix, sieve, leap year, file ops, quad trees
├── unsorted/algos/          # Learning algorithms collection
├── test/                     # Unit tests (alcotest)
├── Dockerfile[.base]        # Docker build environments
├── Jenkinsfile              # Jenkins CI pipeline
├── .github/workflows/       # GitHub Actions CI
└── Configuration files      # dune-project, .ocamlformat, Makefile, etc.
```

---

## Implemented Data Structures

### Arrays
-   **Bit Vector** - Efficient boolean array using bit manipulation
-   **Persistent Array** - Immutable array with path copying and rerooting
-   **Resizable Array** - Dynamic array with amortized O(1) append
-   **Ropes** - String data structure (in progress, needs fresh implementation)

### Trees
-   **Persistent Binary Search Tree** - Functor-based immutable BST with add, remove, membership operations

---

## Tech Stack

-   **OCaml** — Functional programming language
-   **dune** (v3.20+) — OCaml's build system
-   **Docker** — Reproducible development environment
-   **GitHub Actions** — CI/CD pipeline automation
-   **Jenkins** — Alternative CI pipeline

---

## Dependencies

OCamlino relies on the following dependencies:

-   [**ocaml**](https://ocaml.org/) — The OCaml compiler
-   [**dune**](https://dune.build/) — Build system for OCaml projects
-   [**alcotest**](https://github.com/mirage/alcotest) — Lightweight test framework
-   [**base**](https://github.com/janestreet/base) — Standard library replacement (used in some binaries)
-   [**stdio**](https://github.com/janestreet/stdio) — I/O library (used in some binaries)
-   [**batteries**](https://github.com/ocaml-batteries-team/batteries-included) — Extended standard library (used in top_k)
-   [**graphics**](https://github.com/ocaml/graphics) — Graphics library (used in quad_trees)

You can install the dependencies using [opam](https://opam.ocaml.org/):

```bash
opam install ocaml dune alcotest base stdio batteries graphics
```

Alternatively, use the provided Docker setup to run everything in a containerized environment:

```bash
docker build -t ocamlino .
docker run --rm -it -v $(pwd):/app ocamlino
```

---

## Development

### Build
```bash
make build
# or
dune build
```

### Run Tests
```bash
make test
# or
dune runtest
```

### Watch Mode
```bash
make watch
```

### Clean
```bash
make clean
```

---

## Why OCamlino?

OCamlino is a solo journey through the depths of functional problem solving. Whether it's implementing a persistent binary search tree, solving array manipulation problems, or exploring elegant recursion — it's all about sharpening your thinking through code.

---

## Goals

-   Practice functional problem solving
-   Build reusable data structures with proper abstractions
-   Master core OCaml concepts:
    -   Pattern matching
    -   Immutability and persistent data structures
    -   Modules and Functors
    -   Tail recursion and higher-order functions
-   Maintain automated CI/CD pipeline
-   Explore type-safe algorithm implementations

---

## Known TODOs

-   Complete Rope data structure implementation (currently stubbed)
-   Implement two-pointer technique in valid_palindrome (currently uses naive approach)
-   Expand test coverage beyond current 2 test files
-   Add documentation to public modules
-   Standardize dependency usage (Base vs stdlib)

---

## Recent Additions

-   Persistent Binary Search Tree with functor-based design
-   Persistent Array with path copying and reroot algorithm
-   Bit Vector with efficient bitwise operations
-   Array problem solutions (two-sum, valid anagram, group anagrams, top-k frequent, etc.)

---

Built by a solo dev exploring OCaml the hard and fun way.
