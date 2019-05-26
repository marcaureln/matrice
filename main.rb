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
        saisie = gets.chomp # récupère la ligne en chaine de caractère
        ligne = saisie.split(" ") # divise la chaine de caractère en "substring" (sous-chaine) et retourne un tableau des différentes petites chaines
        ligne.map!{ |x| x.to_i } # converti tous les éléments (string) du tableau en entier
        for j in 0..col-1 do # j représente l'index dans le tableau ligne = numero de la colonne dans la matrice
            matrice[i-1][j] = ligne[j] # a-1 car le tableau commence à l'index 0     
        end
    end
    return matrice # la fonction retourne la matrice (c'est un Array ou tableau)
end

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
    # L'addition est possible uniquement sur les matrices carrées de même format
    # Ce qui implique que lignesA = lignesB = colA = colB = taille
    taille = matriceA.length 
    matrice = Array.new(taille) {Array.new(taille, 0)}

    for i in 0..taille-1 do 
        for j in 0..taille-1 do            
            matrice[i][j] = matriceA[i][j]+matriceB[i][j]
        end
    end
    
    return matrice
end

def puissance(matriceA, n)
    taille = matriceA.length
    matrice = Array.new(taille) {Array.new(taille, 1)}
    while n > 1
        matriceR = produit(matrice, matriceA)
        n -= 1                
    end
    return matrice
end

def transposee(matrice)
    taille = matrice.length

    matriceT = Array.new(taille) {Array.new(taille, 0)}

    for i in 0..taille-1 do 
        for j in 0..taille-1 do 
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
    if carree?(matriceA) and carree?(matriceB) # vérifie d'abord si les matrices sont carrées
        # si la matrice est carrée l'on n'a juste à comparer le nombre de lignes (car le nbre de lignes égal au nbre de colonnes)
        formatA = matriceA.length 
        formatB = matriceB.length

        if formatA == formatB # si les matrices ont le même format
            return true # la fonction retourne vrai
        else
            return false # sinon elle retourne faux
        end
    else
        return false # l'addition est possible qu'avec les matrices carrées
    end
end

def afficher_menu()
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
end

# PROGRAM START HERE !
puts "ALGORITHME - OPERATIONS SUR LES MATRICES"

while true
    afficher_menu()
    puts "" 
    print "Veuillez faire un choix : " # contrairement au puts le print n'éffectue pas de saut de ligne avant ou après la chaine de caractère
    choix = gets.chomp.to_i # récupère le choix de l'utilisateur

    case choix 
    when 1 # choix de l'addition
        puts "\nCréation de la matrice A"
        matriceA = creer_matrice()

        puts "\nCréation de la matrice B"
        matriceB = creer_matrice()

        if addition?(matriceA, matriceB) # retourne vrai si les matrices sont compatibles
            matriceR = addition(matriceA, matriceB) 
            puts "\nRésultat MatriceA+MatriceB"
            afficher_matrice(matriceR)
        else # sinon on affiche que le calcul est impossible
            puts "\nAddition impossible - Matrices incompatibles"
        end
    when 2 # choix de la multiplication de matrices
        puts "\nCréation de la matrice A"
        matriceA = creer_matrice()

        puts "\nCréation de la matrice B"
        matriceB = creer_matrice()
        
        if produit?(matriceA, matriceB) # test dans un premier temps si la multiplication est possible
            matriceR = produit(matriceA, matriceB) # si oui
            puts "\nRésultat MatriceA*MatriceB"
            afficher_matrice(matriceR)            
        else # sinon on affiche que le calcul est impossible
            puts "\nProduit impossible - Matrices incompatibles"
        end
    when 3 # choix de la multiplication de matrice avec un réel
        puts "\nCréation de la matrice A"
        matriceA = creer_matrice()

        print "\nValeur de a : "
        a = gets.chomp.to_i
        
        matriceR = produit_scalaire(matriceA, a)
        puts "\nRésultat a*MatriceA"
        afficher_matrice(matriceR)
    when 4 # choix de la transposée | TEST NEEDED!!!
        puts "\nCréation de la matrice"
        matrice = creer_matrice()

        if carree?(matrice)
            matriceT = transposee(matrice)
            puts "\nTransposée de la Matrice"
            afficher_matrice(matriceT)
        else
            puts "\nCalcul impossible"
        end
    when 5 # choix de la puissance d'une matrice | TEST NEEDED!!!
        puts "\nCréation de la matrice A"
        matriceA = creer_matrice()

        print "\nValeur de n : "
        n = gets.chomp.to_i
        
        if produit?(matriceA, matriceA) # test dans un premier temps si la multiplication est possible
            matriceR = puissance(matriceA)
            puts "\nRésultat MatriceA^n"
            afficher_matrice(matriceR)            
        else # sinon on affiche que le calcul est impossible
            puts "\nCalcul impossible"
        end
    when 6
        puts "Option indisponible actuellement - En cours de développement..."
    when 7
        puts "Option indisponible actuellement - En cours de développement..."
    when 0 # quand l'utilisateur décide de quitter le programme
        break
    else # affiche choix incorrect lorsque l'utilisateur saisi n'importe quoi
        puts "Choix incorrect!"
    end
end 

print "\nAppuyer sur entrée..."
gets