from matriz import *
from sudoku import *


tab = nova_matriz(9)
random_set(tab, 5)
print_matriz(tab)
print("--"*len(tab))
resolver(tab)
print_matriz(tab)