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
    
    # V là ça devient chaud !!!    
    puts "Remplissez votre matrice : "
    for a in 1..lignes do # boucle qui part de 1 au nombre de lignes renseigné par l'utilisateur
        print "Ligne #{a} : " # affiche le numéro de la ligne
        saisie = gets.chomp # récupère la signe en chaine de caractère
        ligne = saisie.split(" ") # divise la chaine de caractère en "substring" (sous-chaine) et retourne un tableau des différentes petites chaines
        ligne.map!{ |x| x.to_i } # converti tous les éléments (string) du tableau en entier
        c = 0 # représente l'index dans le tableau ligne = numero de la colonne
        for b in 0..col-1 do # b = numero de colonne dans la matrice
            matrice[a-1][b] = ligne[c] # a-1 car le tableau commence à l'index 0     
            b+=1 # incrémante de 1 
            c+=1 # idem
        end
    end
    return matrice # la fonction retourne la matrice (c'est un Array ou tableau)
end

def afficher_matrice(matrice)
    # plus besoin d'entrer le nbre de lignes ou de colonnes en parametres
    lignes = matrice.length # le nbre de lignes correspond au nombre d'elts du tableau parent
    col = matrice[0].length # le nbre de colonnes correspond au nombre d'elts d'un des tableaux enfants

    for a in 1..lignes do # boucle qui affiche les lignes de la matrice
        for b in 0..col-1 do # la boucle affiche une ligne de la matrice
            nombre = matrice[a-1][b]
            print " " if nombre >= 0 # pour résoudre le problème de décalage causé par les nombres négatifs
            print "#{nombre} "       
        end
        print "\n"
    end
end

def produit_matrice(matriceA, matriceB)
    # initialisation de la matrice résultat
    matrice = Array.new(matriceA.length) {Array.new(matriceB[0].length, 0)}
    # stocker le nombre de lignes et de colonnes pour pouvoir les utiliser plus facilement
    lignes = matrice.length 
    col = matrice[0].length

    # V trop complexe à expliquer en commentaire
    for lignesA in 0..matriceA.length-1 do 
        for colonneB in 0..matriceB[0].length-1 do
            somme = 0
            for i in 0..matriceA[0].length-1 do 
                somme += matriceA[lignesA][i]*matriceB[i][colonneB]  
            end
            matrice[lignesA][colonneB] = somme
        end
    end
    
    return matrice
end

def addition_matrice(matriceA, matriceB)
    matrice = Array.new(matriceA.length) {Array.new(matriceB[0].length, 0)}
    lignes = matrice.length
    col = matrice[0].length

    for i in 0..lignes-1 do 
        for ii in 0..col-1 do            
            matrice[i][ii] = matriceA[i][ii]+matriceB[i][ii]
        end
    end
    
    return matrice
end

def produit_reel(matriceA, a)
    matrice = Array.new(matriceA.length) {Array.new(matriceA[0].length, 0)}
    lignes = matrice.length
    col = matrice[0].length

    for i in 0..lignes-1 do 
        for ii in 0..col-1 do            
            matrice[i][ii] = matriceA[i][ii]*a
        end
    end
    
    return matrice
end

def test_produit(matriceA, matriceB) 
    colA = matriceA[0].length
    lignesB = matriceB.length
    if colA == lignesB
        return true 
    else
        return false
    end
end

def test_matrice_carree(matrice)
    if matrice.length == matrice[0].length
        return true
    else
        return false
    end
end

def test_addition(matriceA, matriceB)
    if test_matrice_carree(matriceA) || test_matrice_carree(matriceB)
        colA = matriceA[0].length
        colB = matriceB[0].length
        lignesA = matriceA.length
        lignesB = matriceB.length

        if colA == colB and lignesA == lignesB
            return true
        else
            return false
        end
    else
        return false
    end
end

# PROGRAM START HERE !
puts "ALGORITHME - OPERATIONS SUR LES MATRICES"
puts ""
puts "-------------- Menu -----------------"
puts "1. Addition A+B"
puts "2. Produit A*B"
puts "3. Produit λ*A"
puts "4. Transposée tA"
puts "5. Puissance A^n"
puts "6. Déterminant det(A)"
puts "7. Inverse A^-1"
puts "0. Quitter le programme\n"

while true 
    print "Veuillez faire un choix : " # contrairement au puts le print n'éffectue pas de saut de ligne avant ou après la chaine de caractère
    choix = gets.chomp.to_i # récupère le choix de l'utilisateur

    case choix 
    when 1 # choix de l'addition
        puts "\nCréation de la matrice A"
        matriceA = creer_matrice()

        puts "\nCréation de la matrice B"
        matriceB = creer_matrice()

        if test_addition(matriceA, matriceB) # retourne vrai si les matrices sont compatibles
            matriceR = addition_matrice(matriceA, matriceB) 
            puts "\nRésultat MatriceA+MatriceB"
            afficher_matrice(matriceR)
        else # sinon on affiche que le calcul est impossible
            puts "\nAddition impossible - Matrices incompatibles"
        end
        break
    when 2 # choix de la multiplication de matrices
        puts "\nCréation de la matrice A"
        matriceA = creer_matrice()

        puts "\nCréation de la matrice B"
        matriceB = creer_matrice()
        
        if test_produit(matriceA, matriceB) # test dans un premier temps si la multiplication est possible
            matriceR = produit_matrice(matriceA, matriceB) # si oui
            puts "\nRésultat MatriceA*MatriceB"
            afficher_matrice(matriceR)            
        else # sinon on affiche que le calcul est impossible
            puts "\nProduit impossible - Matrices incompatibles"
        end
        break
    when 3 # choix de la multiplication de matrice avec un réel
        puts "\nCréation de la matrice A"
        matriceA = creer_matrice()

        print "\nValeur de a : "
        a = gets.chomp.to_i
        
        matriceR = produit_reel(matriceA, a)
        puts "\nRésultat a*MatriceA"
        afficher_matrice(matriceR)
        break
    when 0 # quand l'utilisateur décide de quitter le programme
        break
    else 
        puts "choix indisponible\n\n"
    end
end 

print "\nAppuyer sur une touche..."
gets