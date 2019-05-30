# TODO 
# [ ] puissance
# [ ] transposée
# [ ] carree?

require './lib/matrice.rb'

describe 'matrice' do
    matriceA = [[2, 0, 1], [-1, 1, 2]]
    matriceB = [[0, 2, 1], [1, 1, 0], [-1, -2, -1]] 
    matriceC = [[1, 4, -2], [2, 7, 3]]
    matriceD = [[5, -1, 6], [-2, 1, -3]]

    context 'Basic operations' do 
        it 'Multiplication' do
            expect(produit(matriceA, matriceB)).to eq [[-1, 2, 1], [-1, -5, -3]]
        end

        it 'Addition' do 
            expect(addition(matriceC,matriceD)).to eq [[6, 3, 4], [0, 8, 0]]
        end

        it 'Scalar multiplication' do 
            expect(produit_scalaire(matriceD, -1)).to eq [[-5, 1, -6], [2, -1, 3]]
        end

        it 'Transposition' do
            expect(transposee(matriceA)).to eq [[2, -1], [0, 1], [1, 2]] 
        end
    end

    context 'Verify possible operations' do
        it 'Multiplication?' do
            expect(produit?(matriceB, matriceA)).to eq false
        end

        it 'Addition?' do 
            expect(addition?(matriceB, matriceD)).to eq false
        end
    end
end