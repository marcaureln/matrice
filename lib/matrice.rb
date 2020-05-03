def creer_matrice()
    print "Entrez les dimensions de votre matrice (lignes colonnes): " # demande à l'utilisateur d'enter le format de la matrice
    saisie = gets.chomp # récupérer la saisie de l'utilisateur

    dimension = saisie.split(" ") # sépare la chaine de caractère en élément du tableau dimension
    dimension.map!{ |x| x.to_i } # converti les string du tableau en integer (entier)

    lignes = dimension[0]; # récupère le nombre de lignes à l'index 0 du tableau dimension
    col = dimension[1]; # récupère le nombre de colonnes à l'index 1 du tableau dimension
    puts "Format de votre matrice : #{lignes} lignes et #{col} colonnes" # affiche le format de la matrice

    # initialise un tableau de tableaux;
    # le nbre d'elts du tableau parent correspond au nombre de ligne;
    # le nbre d'elts des tableaux enfants correspond au nombre de colonne;
    matrice = Array.new(lignes) {Array.new(col, 0)} #=> [[0, 0, 0], [0, 0, 0], [0, 0, 0], ...]
    
    # Remplissage de la matrice
    puts ""    
    puts "Remplissez votre matrice : "
    for i in 1..lignes do # boucle qui part de 1 au nombre de lignes renseigné par l'utilisateur
        print "Ligne #{i} : " # affiche le numéro de la ligne
        ligne = gets.chomp.split(" ")
        ligne.map!{ |x| x.to_i } # converti tous les éléments (string) du tableau en entier
        for j in 0..col-1 do # j représente l'index dans le tableau ligne = numero de la colonne dans la matrice
            matrice[i-1][j] = ligne[j] # a-1 car le tableau commence à l'index 0     
        end
    end
    return matrice # la fonction retourne la matrice (c'est un Array ou tableau)
end

#TODO: gérer l'affichage des grands nombres 
def afficher_matrice(matrice)
    # plus besoin d'entrer le nbre de lignes ou de colonnes en parametres
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
    lignes = matriceA.length
    col = matriceA[0].length

    matrice = Array.new(lignes) {Array.new(col, 0)}

    for i in 0..lignes-1 do 
        for j in 0..col-1 do            
            matrice[i][j] = matriceA[i][j]*k
        end
    end
    
    return matrice
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

def puissance(matriceA, n)
    matrice = matriceA
    while n > 1
        matrice = produit(matrice, matriceA)
        n -= 1                
    end
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

def produit?(matriceA, matriceB) # test si le produit A*B existe
    colA = matriceA[0].length # récupère le nombre de colonnes de la matrice A
    lignesB = matriceB.length # récupère le nombre de lignes de la matrice B
    if colA == lignesB # vérifie si le nombre de colonnes de A est égal au nombre de lignes de B
        return true # si oui retourne vrai
    else
        return false # sinon retourne faux
    end
end

def carree?(matrice) # test si la matrice est carrée
    if matrice.length == matrice[0].length # vérifie si le nombre de lignes est égal au nombre de colonnes
        return true # si oui il retourne vrai
    else
        return false # sinon il retourne faux
    end
end

def addition?(matriceA, matriceB) # test si l'addition est possible
    if (matriceA.length == matriceB.length) and (matriceA[0].length == matriceB[0].length) # vérifie si les matrices sont de même format
        return true # la fonction retourne vrai
    else 
        return false # sinon elle retourne faux
    end
end