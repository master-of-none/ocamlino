# OCamlino

**OCamlino** is a personal playground for learning **OCaml** through:

- Data Structures and Algorithms (DSA)
- Advent of Code (AoC) challenges
- Experimenting with functional programming patterns

Built with OCaml, `dune`, and automated via Docker and Jenkins for CI/CD.

---

## Project Structure

```
ocamlino/
├── dune-project          # Root Dune project file
├── dsa/                  # Classic data structure and algorithm problems
│   ├── reverse_list.ml
│   ├── merge_sort.ml
│   └── dune              # Dune file to build the DSA library
├── aoc/                  # Advent of Code solutions
│   ├── 2023/
│   │   ├── day01.ml
│   │   └── dune          # Dune file for AoC 2023 executables
│   └── dune              # Optional: group-level dune file
├── test/                 # Unit tests for DSA and AoC
│   ├── test_reverse_list.ml
│   ├── test_merge_sort.ml
│   └── dune              # Test stanzas
├── Dockerfile            # Docker setup for clean OCaml builds
└── Jenkinsfile           # CI pipeline definition
```

---

## Tech Stack

- OCaml — functional programming language
- dune — OCaml's build system
- Docker — reproducible development environment (Done)
- Jenkins — CI/CD pipeline automation (Done)
- Github CI - Alternate for Jenkins

---

## Why OCamlino?

OCamlino is a solo journey through the depths of functional problem solving.  
Whether it’s implementing a red-black tree, solving AoC Day 15, or exploring elegant recursion — it’s all about sharpening your thinking through code.

---

## Goals

- Practice functional problem solving
- Build a reusable test + CI pipeline
- Explore core OCaml concepts:
  - Pattern matching
  - Immutability
  - Modules and Functors
  - Tail recursion and higher-order functions

---

## Coming Soon

- Benchmarks for DSA solutions
- AOC streaks

---

Built by a solo dev exploring OCaml the hard and fun way.
