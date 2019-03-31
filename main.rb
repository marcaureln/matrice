# TO-DO : 
# _ afficher correctement les matrices, gérer les décalages créés par les nbrs négatifs --DONE
# _ remplacer les bloc par des methodes (pour plus de modularité) --DOING
# _ construire une classe matrice et un module contenant toutes les opérations sur les matrices
# _ gestion des erreurs (math_error, synthax_error, ...)
# _ gérer les erreurs liées aux format des matrices (pour l'addition et le produit)
# _ reconnaissance du type des matrices (carrée, diagonale, unitaire, ...)
# _ refractoring, optimization

def creer_matrice(lignes, col)
    
    # initialise un tableau de tableaux;
    # le nbre d'elts du tableau parent correspond au nombre de ligne;
    # le nbre d'elts des tableaux enfants correspond au nombre de colonne;
    matrice = Array.new(lignes) {Array.new(col, 0)} #=> [[0, 0, 0], [0, 0, 0], [0, 0, 0], ...]
    
    # V là ça devient chaud !!!    
    puts "Remplissez votre matrice : "
    for a in 1..lignes do
        print "Ligne #{a} : "
        saisie = gets.chomp
        ligne = saisie.split(" ")
        ligne.map!{ |x| x.to_i } 
        c = 0
        for b in 0..col-1 do
            matrice[a-1][b] = ligne[c]      
            b+=1  
            c+=1
        end
    end
    return matrice
end

def afficher_matrice(matrice)
    # plus besoin d'entrer le nbre de lignes ou de colonnes en parametres
    lignes = matrice.length # le nbre de lignes correspond au nombre d'elts du tableau parent
    col = matrice[0].length # le nbre de colonnes correspond au nombre d'elts d'un des tableaux enfants

    # puts "Votre matrice : "
    for a in 1..lignes do
        for b in 0..col-1 do
            nombre = matrice[a-1][b].to_i
            print " " if nombre >= 0
            print "#{nombre} "       
        end
        print "\n"
    end
end

# PROGRAM START HERE !
puts "Matrice"

=begin
print "Entrez les dimensions de votre matrice (lignes colonnes): "
saisie = gets.chomp # récupérer la saisie de l'utilisateur

dimension = saisie.split(" ") # sépare la chaine de caractère en élément du tableau dimension
dimension.map!{ |x| x.to_i } # converti les string du tableau en integer (entier)

lignes = dimension[0]; # récupère le nombre de lignes à l'index 0 du tableau dimension
col = dimension[1]; # récupère le nombre de colonnes à l'index 1 du tableau dimension
puts "Format de votre matrice : #{lignes} lignes et #{col} colonnes" # affiche le format de la matrice
=end

matriceA = 
        [   
            [2, 0, 1], # [0][0] [0][1] [0][2]
            [-1, 1, 2] # [1][0] [1][1] [1][2]
        ]
matriceB = 
        [
            [0, 2, 1],    # [0][0] [0][1] [0][2]
            [1, 1, 0],    # [1][0] [1][1] [1][2]
            [-1, -2, -1]  # [2][0] [2][1] [2][2]
        ]     

# matriceR : Résultat du produit
# -1  2  1 # [0][0] [0][1] [0][2]
# -1 -5 -3 # [1][0] [1][1] [1][2]

puts "Matrice A"
afficher_matrice(matriceA)

puts "\nMatrice B"
afficher_matrice(matriceB)

def produit_matrice(matriceA, matriceB)
    # initialisation de la matrice résultat
    matrice = Array.new(matriceA.length) {Array.new(matriceB[0].length, 0)}
    lignes = matrice.length
    col = matrice[0].length

    for lignesA in 0..matriceA.length-1 do 
        for colonneB in 0..matriceB[0].length-1 do
            somme = 0
            for i in 0..col-1 do 
                somme += matriceA[lignesA][i]*matriceB[i][colonneB]
            end
            matrice[lignesA][colonneB] = somme
        end
    end
    
    return matrice
end

matriceR = produit_matrice(matriceA, matriceB)

puts "\nProduit A*B"
afficher_matrice(matriceR)
