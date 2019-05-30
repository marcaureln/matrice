# matrice

![matrix transpositions](https://media.giphy.com/media/35v2AuS45pUre/giphy.gif)

`matrice` est un petit programme de calcul de matrice entièrement réalisé en Ruby sans aucune librairie. Il a été codé *from scratch*. Il sert à éffectuer différentes opération sur les matrices telles que la multiplication, l'addition, etc.

#### TODO

- [x] afficher correctement les matrices, gérer les décalages créés par les nbrs négatifs
- [x] remplacer les bloc par des methodes (pour plus de modularité)
- [x] gérer les erreurs liées aux format des matrices (pour l'addition et le produit)
- [x] ajouter des tests rspec
- [ ] build un executable
- [ ] construire une classe matrice et un module contenant toutes les opérations sur les matrices
- [ ] calcul du déterminant et de l'inverse d'une matrice
- [ ] gestion des erreurs (math_error, synthax_error, ...)
- [ ] reconnaissance du type des matrices (carrée, diagonale, unitaire, ...)
- [ ] refractoring, optimization 

## Comment l'utiliser ?
0. Téléchargez et installez Ruby (si vous ne l'avez pas déjà)
1. Téléchargez ou cloner le dépot sur votre ordinateur
2. Ouvrez votre terminal et rendez vous dans le dossier `lib`
3. Faites `ruby main.rb` pour lancer le programme

**N.B.:** Une version exectutable sera bientôt disponible.

## Contribution

Le projet est ouvert aux contributions et aux suggestion.

#### Comment contribuer ?

1. Fork le repository et le cloner localement
2. Créez une branche pour y faire vos modifications
3. Ajoutez vos modifications
4. Push sur github
5. Faire une pull request

**Remarque :** Veuillez écrire un code propre et avec assez de commentaire. Respectez aussi le format de déclaration des variables (camel case). 