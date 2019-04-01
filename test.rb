begin
    load "main.rb"    
rescue => exception
    puts "Impossible de charger le fichier main.rb"
    puts exception.message
end

# déclaration des matrices pour les tests

matriceA = [
    [2, 0, 1], # [0][0] [0][1] [0][2]
    [-1, 1, 2] # [1][0] [1][1] [1][2]
]
matriceB = [
    [0, 2, 1],    # [0][0] [0][1] [0][2]
    [1, 1, 0],    # [1][0] [1][1] [1][2]
    [-1, -2, -1]  # [2][0] [2][1] [2][2]
]  

matriceC = [
    [1, 4, -2],
    [2, 7, 3]
]

matriceD = [
    [5, -1, 6],
    [-2, 1, -3]
]

# -------------- PRODUIT -------------------------------

# matriceA*matriceB : Résultat du produit
# -1  2  1 # [0][0] [0][1] [0][2]
# -1 -5 -3 # [1][0] [1][1] [1][2]

matriceP = produit_matrice(matriceA, matriceB) # résultat du produit

puts "Matrice A"
afficher_matrice(matriceA)

puts "\nMatrice B"
afficher_matrice(matriceB)

puts "\nProduit A*B"
afficher_matrice(matriceP)

# -------------- ADDITION -------------------------------

# matriceC+matriceD : Résultat de la somme
# 6  3  4 # [0][0] [0][1] [0][2]
# 0  8  0 # [1][0] [1][1] [1][2]

matriceS = addition_matrice(matriceB, matriceC) # résultat de la somme

puts "Matrice C"
afficher_matrice(matriceC)

puts "\nMatrice D"
afficher_matrice(matriceD)

puts "\nAddition C+D"
afficher_matrice(matriceS)

# ---------------- MULTIPLICATION PAR UN REEL ------------

# matriceC-matriceD : Résultat de la différence
# -4  5 -8 # [0][0] [0][1] [0][2]
#  4  6  6 # [1][0] [1][1] [1][2]

matriceN = produit_reel(matriceD, -1) 
matriceR = addition_matrice(matriceC, matriceN)

puts "\nDifférence C-D"
afficher_matrice(matriceR)

# --------------- FIN DES TESTS -------------------------

print "\nAppuyer sur une touche..."
gets