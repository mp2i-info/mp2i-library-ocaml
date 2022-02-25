.PHONY: test
doc:
	dune build @doc
	firefox _build/default/_doc/_html/index.html

top:
	dune utop lib -- -implicit-bindings

test:
	dune runtest