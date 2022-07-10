# Installation et utilisation

Se placer dans le dossier src. Puis :
- Si besoin, créer un switch : `opam switch create . --deps-only ocaml-base-compiler.4.14.0; eval $(opam env)`  
- Installer les dépendances : `opam install .; eval $(opam env)`  
- Lancer un toplevel : `dune utop`  
- Lancer les tests : `dune test`
