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

#                            $$\               $$\                     
#                            $$ |              \__|                    
#  $$$$$$\$$$$\   $$$$$$\  $$$$$$\    $$$$$$\  $$\  $$$$$$$\  $$$$$$\  
#  $$  _$$  _$$\  \____$$\ \_$$  _|  $$  __$$\ $$ |$$  _____|$$  __$$\ 
#  $$ / $$ / $$ | $$$$$$$ |  $$ |    $$ |  \__|$$ |$$ /      $$$$$$$$ |
#  $$ | $$ | $$ |$$  __$$ |  $$ |$$\ $$ |      $$ |$$ |      $$   ____|
#  $$ | $$ | $$ |\$$$$$$$ |  \$$$$  |$$ |      $$ |\$$$$$$$\ \$$$$$$$\ 
#  \__| \__| \__| \_______|   \____/ \__|      \__| \_______| \_______|
#                                                                      
#                                                                      
#    
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
        matriceT = transposee(matrice)
        puts "\nTransposée de la Matrice"
        afficher_matrice(matriceT)
    when 5 # choix de la puissance d'une matrice | TEST NEEDED!!!
        puts "\nCréation de la matrice A"
        matriceA = creer_matrice()

        print "\nValeur de n : "
        n = gets.chomp.to_i
        
        if carre?(matriceA) # test dans un premier temps si la multiplication est possible
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