require './lib/matrice.rb'

describe 'matrice' do
    it 'return the right matrix A*B' do
        matriceA = [[2, 0, 1], [-1, 1, 2]]
        matriceB = [[0, 2, 1], [1, 1, 0], [-1, -2, -1]] 
        matriceR = [[-1, 2, 1], [-1, -5, -3]]
        expect(produit(matriceA, matriceB)).to eq matriceR
    end
end