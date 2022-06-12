.PHONY: test
doc:
	dune build @doc
	firefox _build/default/_doc/_html/index.html

top:
	dune utop lib -- -implicit-bindings

test:
	dune build
	dune runtest

install:
	opam install ocaml-lsp-server ocamlformat dune utop ocamlformat-rpc ppx_inline_test base core batteries bisect_ppx

coverage:
	dune runtest --instrument-with bisect_ppx --force && bisect-ppx-report html
