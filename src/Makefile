.PHONY: test

switch:
	opam switch create . --deps-only ocaml-base-compiler.4.14.0; \
	eval $(opam env)

install:
	opam install .; \
	eval $(opam env)

build:
	dune build

top: build
	dune utop lib -- -implicit-bindings

test: build
	dune runtest

doc:
	dune build @doc
	firefox _build/default/_doc/_html/index.html

coverage:
	dune runtest --instrument-with bisect_ppx --force && bisect-ppx-report html
