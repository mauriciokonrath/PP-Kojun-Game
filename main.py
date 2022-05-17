from matriz import *
from sudoku import *
from random import randint


tab = nova_matriz(9)
resolver(tab)

# set(tab, (randint(0, 8), randint(0, 8)), randint(1, 9))      # para visualizar/testar o print de numeros inválidos no tabuleiro 
                                                               # obs.: existe a chance dele setar o mesmo valor e n alterar o jogo
print_sudoku(tab)
