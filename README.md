# Bibliothèque OCaml pour l'informatique en MP2I

Pour poser des questions : https://github.com/mp2i-fsm/mp2i-2021/discussions  

Suivre les étapes suivantes pour la mise en place de la bibliothèque :
- Faire un fork du dépôt en cliquant sur le bouton Fork en haut à droite  
Ce fork contient les mêmes fichiers que ce dépôt, mais vous pouvez les modifier / ajouter des nouveaux fichiers.  
- Si vous utilisez Docker, vous pouvez télécharger le dépôt puis lancer Docker dans le repertoire cloné. 
(Si vous utilisez en plus git, vous pouvez cloner (git clone https://github.com/utilisateur/depot) au lieu de télécharger
puis git add/git commit/git push pour mettre à jour le dépôt sur github)
- Si vous utilisez Binder, il faut générer un lien qui vous permettra d'utiliser Binder avec vos fichiers dedans.
Pour cela allez sur https://jupyterhub.github.io/nbgitpuller/link.html, cliquez sur Binder en haut à droite puis :
  - Dans Git Environment Repository URL : https://github.com/fortierq/mp2i-binder  
  - Dans Git Content Repository URL : l'adresse URL de votre fork  
  - Sélectionnez JupyterLab  
  - Puis copier-coller et conservez l'adresse URL qui est apparue en haut de la page : c'est elle qui vous permettra d'utiliser Binder avec vos fichiers.  

Travail demandé :
- Vous devez implémenter les algorithmes/structures de données du cours et/ou vus en TD.
- Regroupez les algorithmes/structures de données dans des dossiers et fichiers pour que ce soit bien organisé.
- Les implémentations des algorithmes/structures de données se feront dans des fichiers .ml (fichiers OCaml) et 
les tests, obligatoirements présents, seront dans des notebooks Jupyter.  
Pour créer un fichier .ml avec Binder : clic droit dans l'arborescence de fichier (sur la partie gauche) puis New file 
et changer l'extension en .ml.
- Les algorithmes/structures de données dans les .ml doivent être commentés.
- Le dépôt contient déjà des fichiers d'exemples, notamment pour importer un .ml (avec #use "..."). Veuillez vous en inspirer. ds (Data Structures) est un dossier qui contient des structures de données, algo contient des algorithmes (avec un exemple d'algorithme de tri : le tri à bulles). Ces fichiers constituent juste un exemple, vous pouvez les remplacer/supprimer si vous voulez faire autrement. 

Je vous laisse des libertés sur les algorithmes/structures de données que vous voulez implémenter, et sur la façon exacte
de le faire, suivant votre niveau et vos ambitions. Voici une liste de suggestions :
- Algorithmes classiques sur les listes (dans list.ml) : recherche d'un élément, inverser une liste, dire si une liste est croissante...
- Recherche par dichotomie/trichotomie, exponentiation rapide
- Tri fusion, tri rapide
- Tableau dynamique
- Pile, file (avec ou sans type abstrait)
- Table de hachage, dictionnaire
- Liste doublement chaînée (cyclique)
- Recherche de la tranche maximum dans un tableau/une liste
- Recherche d'un doublon dans un tableau/une liste
- Recherche d'un cycle dans une liste chaînée
- ...  

Vous pouvez regrouper les fonctions similaires dans le même fichier (exemple : toutes les fonctions de base sur les listes dans list.ml).
