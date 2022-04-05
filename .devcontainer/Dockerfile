FROM ocamlpro/ocaml

USER ocaml

RUN apk add bash &&\
    opam update && \
    opam switch create 4.12.0 && \
    opam install ocaml-lsp-server ocamlformat dune utop ocamlformat-rpc ppx_inline_test base core batteries
