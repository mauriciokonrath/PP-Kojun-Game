# sudoku.py
# funções para manipular um jogo sudoku em uma matriz


from matriz import *


def print_sudoku(matriz: list):
    """
    Imprime na formatação de um jogo de sudoku\n\n
    O valor é impresso:
    -> Vermelho: se ele não é válido
 /home/pet/Desktop/   -> Verde: se é válido 
    """

    for i in range(len(matriz)):
        if not i % 3 and i != 0: print("--"*(len(matriz)+1))
        linha = ""
        for j in range(len(matriz)):
            char = str(matriz[i][j])

            if valido(matriz, matriz[i][j], (i, j)): char = '\033[92m' + char + '\033[0m'
            else: char = '\033[91m' + char + '\033[0m'
            if not j % 3 and j != 0: char = "| " + char

            linha += char + " "

        print(linha)


def valido(matriz: list, valor: int, coord: tuple) -> bool:
    """Checa se determinado valor e na posicao escolhida é valida"""

    # Check row
    for i in range(len(matriz[0])):
        if matriz[coord[0]][i] == valor and coord[1] != i:
            return False

    # Check column
    for i in range(len(matriz)):
        if matriz[i][coord[1]] == valor and coord[0] != i:
            return False

    # Check matrizx
    matrizx_x = coord[1] // 3
    matrizx_y = coord[0] // 3

    for i in range(matrizx_y*3, matrizx_y*3 + 3):
        for j in range(matrizx_x * 3, matrizx_x*3 + 3):
            if matriz[i][j] == valor and (i,j) != coord:
                return False

    return True


def procurar_invalido(matriz: list) -> tuple:
    """retorna a primeira posição invalida que encontrar em uma matriz de sudoku"""

    for i in range(len(matriz)):
        for j in range(len(matriz)):
            if not valido(matriz, matriz[i][j], (i, j)):
                return (i, j)


def resolver(matriz: list) -> bool:
    """Resolve um jogo de Sudoku"""

    achado = procurar_invalido(matriz)
    if not achado: return True
    else: linha, coluna = achado

    for valor_possivel in range(1, 10):
        if valido(matriz, valor_possivel, achado):
            matriz[linha][coluna] = valor_possivel

            if resolver(matriz): return True

            matriz[linha][coluna] = 0

    return False