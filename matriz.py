# matriz.py
# funções para manipular uma matriz


from random import randint


def nova_matriz(n: int) -> list:
    """Cria uma nova matriz de tamanho NxN"""

    mat = [0] * n
    for i in range(n):
        mat[i] = [0] * n
    return mat


def print_matriz(matriz: list):
    """Imprime linha por linha de uma dada matriz"""

    linha = ""
    for i in range(len(matriz)):
        for j in range(len(matriz)):
            linha += " " + str(matriz[i][j])
        print(linha)
        linha = ""


# não funfa direito com o solucionador
def random_set(matriz: list, n: int):
    """adiciona n valores aleatórios a uma determinada matriz"""

    if not n: return
    for i in range(len(matriz)):
        for j in range(len(matriz)):
            if (i, j) == (randint(0, len(matriz)), randint(0, len(matriz))):
                set(matriz, (i,j), randint(1, 9))
                random_set(matriz, n-1)
                return
    random_set(matriz, n)


def set(matriz: list, coord: tuple, value: int):
    """Altera um valor de uma determinada posição"""

    matriz[coord[0]][coord[1]] = value


def get(matriz: list, coord: tuple) -> int:
    """Retorna um valor de uma determinada posição"""

    return matriz[coord[0]][coord[1]]
