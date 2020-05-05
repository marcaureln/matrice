def creer_matrice(nom = "")
    puts "Création de la matrice #{nom}"
    print "Entrez les dimensions de votre matrice (lignes colonnes): "
    saisie = gets.chomp.split(" ").map!{ |x| x.to_i }

    lignes = saisie[0]; # récupère le nombre de lignes à l'index 0 du tableau dimension
    col = saisie[1]; # récupère le nombre de colonnes à l'index 1 du tableau dimension
    puts "Format de votre matrice : #{lignes} lignes et #{col} colonnes" # affiche le format de la matrice

    matrice = Array.new(lignes) {Array.new(col, 0)} #=> [[0, 0, 0], [0, 0, 0], [0, 0, 0], ...]
    
    # Remplissage de la matrice
    puts "\nRemplissez votre matrice : "
    for i in 0..lignes-1 do
        print "Ligne #{i+1} : "
        matrice[i] = gets.chomp.split(" ").map!{ |x| x.to_i } # converti tous les elts (string) du tableau en entier
    end
    return matrice # la fonction retourne la matrice (c'est un Array ou tableau)
end

#TODO: gérer l'affichage des grands nombres 
def afficher_matrice(matrice)
    lignes = matrice.length # le nbre de lignes correspond au nombre d'elts du tableau parent
    col = matrice[0].length # le nbre de colonnes correspond au nombre d'elts d'un des tableaux enfants

    for i in 0..lignes-1 do # boucle qui affiche les lignes de la matrice
        for j in 0..col-1 do # la boucle affiche une ligne de la matrice
            nombre = matrice[i][j] # récupère le coefficient situé à la position a,b de la matrice
            print " " if nombre >= 0 # pour résoudre le problème de décalage causé par les nombres négatifs
            print nombre, " " # affiche le coefficient contenu dans la variable      
        end
        print "\n" # saut de ligne après l'affichage d'une ligne
    end
end

def produit(matriceA, matriceB)
    # la matrice résultante possède le même nombre de lignes que la matrice A et le même nombre de colonne que la matrice B
    matrice = Array.new(matriceA.length) {Array.new(matriceB[0].length, 0)}

    for ligneA in 0..matriceA.length-1 do 
        for colB in 0..matriceB[0].length-1 do
            for i in 0..matriceA[0].length-1 do 
                matrice[ligneA][colB] += matriceA[ligneA][i]*matriceB[i][colB]  
            end
        end
    end
    
    return matrice
end

def produit_scalaire(matriceA, k)
    return matriceA.map{ |ligne| ligne.map { |elt| elt*k } }
end

def addition(matriceA, matriceB)
    # L'addition est possible uniquement sur les matrices de même format
    # Ce qui implique que lignesA = lignesB et colA = colB
    lignes = matriceA.length 
    col = matriceA[0].length
    matrice = Array.new(lignes) {Array.new(col, 0)}

    for i in 0..lignes-1 do 
        for j in 0..col-1 do            
            matrice[i][j] = matriceA[i][j]+matriceB[i][j]
        end
    end
    
    return matrice
end

def puissance(matrice, n)
    return matrice_identite(matrice.length) if n == 0
    matriceN = matrice
    (n-1).times { matriceN = produit(matriceN, matrice) }
    return matriceN
end

def matrice_identite(n) # une matrice identité d'ordre n possède n lignes et n colonnes
    matrice = Array.new(n) {Array.new(n, 0)}
    (0...n).each { |i| matrice[i][i] = 1 }
    return matrice
end

def transposee(matrice)
    lignes = matrice.length
    col = matrice[0].length
    matriceT = Array.new(col) {Array.new(lignes, 0)}

    for i in 0..lignes-1 do 
        for j in 0..col-1 do 
            matriceT[j][i] = matrice[i][j]   
        end
    end

    return matriceT
end

def determinant(matrice)
    return matrice[0][0] if (matrice.length == 1)
    return matrice[0][0]*matrice[1][1]-matrice[0][1]*matrice[1][0] if (matrice.length == 2)
    det = 0
    for i in 0..matrice.length-1 do
        com = []
        for j in 1..matrice.length-1 do 
            ligne = []
            (0...matrice.length).each { |k| ligne.push(matrice[j][k]) if (k != i) }
            com.push(ligne)
        end
        det += ((-1)**(i))*matrice[0][i]*determinant(com)
    end
    return det
end

def produit?(matriceA, matriceB) # test si le produit A*B existe
    # vérifie si le nombre de colonnes de A est égal au nombre de lignes de B
    return matriceA[0].length == matriceB.length ? true : false 
end

def carree?(matrice) # test si la matrice est carrée
    # vérifie si le nombre de lignes est égal au nombre de colonnes
    return matrice.length == matrice[0].length ? true : false 
end

def addition?(matriceA, matriceB) # test si l'addition est possible
    # vérifie si les matrices sont de même format
    if (matriceA.length == matriceB.length) and (matriceA[0].length == matriceB[0].length)
        return true
    end
    return false
end

def inversible?(matrice)
    return (determinant(matrice) != 0 && carree?(matrice) == true)? true : false
end