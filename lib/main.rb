require_relative 'matrice.rb'

def afficher_menu()
    puts ""
    puts "=========== MENU ==========="
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
puts "OPERATIONS SUR LES MATRICES"

while true
    afficher_menu()
    print "\nVeuillez faire un choix : "
    choix = gets.chomp.to_i # récupère le choix de l'utilisateur

    case choix 
    when 1 # choix de l'addition
        matriceA, matriceB = creer_matrice("A"), creer_matrice("B")

        if addition?(matriceA, matriceB) # retourne vrai si les matrices sont compatibles
            matriceR = addition(matriceA, matriceB) 
            puts "\nRésultat MatriceA+MatriceB"
            afficher_matrice(matriceR)
        else # sinon on affiche que le calcul est impossible
            puts "\nAddition impossible - Matrices incompatibles"
        end
    when 2 # choix de la multiplication de matrices
        matriceA, matriceB = creer_matrice("A"), creer_matrice("B")
        
        if produit?(matriceA, matriceB)
            matriceR = produit(matriceA, matriceB)
            puts "\nRésultat MatriceA*MatriceB"
            afficher_matrice(matriceR)            
        else
            puts "\nProduit impossible - Matrices incompatibles"
        end
    when 3 # choix de la multiplication de matrice avec un réel
        print "\nValeur de λ : "
        a = gets.chomp.to_i
        
        matriceR = produit_scalaire(creer_matrice(), a)
        puts "\nRésultat λ*M"
        afficher_matrice(matriceR)
    when 4 # choix de la transposée
        matriceT = transposee(creer_matrice())
        puts "\nTransposée de la Matrice"
        afficher_matrice(matriceT)
    when 5 # choix de la puissance d'une matrice
        matriceA = creer_matrice("A")
        
        if carre?(matriceA) # test dans un premier temps si la multiplication est possible
            print "\nValeur de n : "
            n = gets.chomp.to_i
            matriceR = puissance(matriceA)
            puts "\nRésultat A^n"
            afficher_matrice(matriceR)            
        else # sinon on affiche que le calcul est impossible
            puts "\nCalcul impossible - La matrice n'est pas carrée"
        end
    when 6, 7
        puts "En cours de développement..."
    when 0 # quand l'utilisateur décide de quitter le programme
        break
    else # affiche choix incorrect lorsque l'utilisateur saisi n'importe quoi
        puts "Choix incorrect!"
    end
end 

print "\nAppuyer sur entrée..."
gets