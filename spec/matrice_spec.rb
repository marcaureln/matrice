# TODO 
# [ ] puissance
# [ ] transposée

require './lib/matrice.rb'

describe 'matrice' do
    matriceA = [[2, 0, 1], [-1, 1, 2]]
    matriceB = [[0, 2, 1], [1, 1, 0], [-1, -2, -1]] 
    matriceC = [[1, 4, -2], [2, 7, 3]]
    matriceD = [[5, -1, 6], [-2, 1, -3]]

    it 'return the right matrix A*B' do
        matrice = [[-1, 2, 1], [-1, -5, -3]]
        expect(produit(matriceA, matriceB)).to eq matrice
    end

    it 'should return false because B*A does not exist' do
        expect(produit(matriceB, matriceA)).to eq false
    end

    it 'return the right matrix C+D' do 
        matrice = [[6, 3, 4], [0, 8, 0]]
        expect(addition(matriceC,matriceD)).to eq matrice
    end

    it 'should return false because matrix B and D do not have the same format' do 
        expect(addition(matriceB, matriceD)).to eq false
    end

    it 'return the right matrix -D' do 
        matriceD = [[5, -1, 6], [-2, 1, -3]]
        matrice = [[-5, 1, -6], [2, -1, 3]]
        expect(produit_scalaire(matriceD, -1)).to eq matrice
    end
end