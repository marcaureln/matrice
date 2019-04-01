def creer_matrice()    
    print "Entrez les dimensions de votre matrice (lignes colonnes): "
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

def produit_matrice(matriceA, matriceB)
    # initialisation de la matrice résultat
    matrice = Array.new(matriceA.length) {Array.new(matriceB[0].length, 0)}
    lignes = matrice.length
    col = matrice[0].length

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
    # initialisation de la matrice résultat
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

# PROGRAM START HERE !
puts "ALGORITHME - OPERATIONS SUR LES MATRICES"
puts ""
puts "-------------- Menu -----------------"
puts "1. Addition MatriceA+MatriceB"
puts "2. Produit MatriceA*MatriceB"
puts "3. Produit a*MatriceA"
puts ""

print "Veuillez faire un choix : "
choix = gets.chomp.to_i # récupère le choix de l'utilisateur

while true 
    case choix 
    when 1
        puts "\nCréation de la matrice A"
        matriceA = creer_matrice()

        puts "\nCréation de la matrice B"
        matriceB = creer_matrice()
        
        matriceR = addition_matrice(matriceA, matriceB)
        puts "\nRésultat MatriceA+MatriceB"
        afficher_matrice(matriceR)
        break
    when 2
        puts "\nCréation de la matrice A"
        matriceA = creer_matrice()

        puts "\nCréation de la matrice B"
        matriceB = creer_matrice()
        
        matriceR = produit_matrice(matriceA, matriceB)
        puts "\nRésultat MatriceA*MatriceB"
        afficher_matrice(matriceR)
        break
    when 3
        puts "\nCréation de la matrice A"
        matriceA = creer_matrice()

        print "\nValeur de a : "
        a = gets.chomp.to_i
        
        matriceR = produit_reel(matriceA, a)
        puts "\nRésultat a*MatriceA"
        afficher_matrice(matriceR)
        break
    else 
        puts "choix indisponible"
    end
end 

print "\nAppuyer sur une touche..."
gets