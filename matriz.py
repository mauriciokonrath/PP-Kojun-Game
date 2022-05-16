from random import randint


def nova_matriz(tamanho: int):
    mat = [0] * tamanho
    for i in range(tamanho):
        mat[i] = [0] * tamanho
    return mat


def random_set(matriz:list, numero_valores: int):
    if not numero_valores: return
    for i in range(len(matriz)):
        for j in range(len(matriz)):
            if (i, j) == (randint(0, len(matriz)), randint(0, len(matriz))):
                set(matriz, (i,j), randint(1, 9))


def print_matriz(matriz: list):
    linha = ""
    for i in range(len(matriz)):
        for j in range(len(matriz)):
            valor_atual = matriz[i][j]
            if valor_atual == 0:
                linha += " " + str(valor_atual)
            else:
                linha += "\033[92m " + str(valor_atual) + '\033[0m'
        print(linha)
        linha = ""



def random_set(matriz:list, numero_valores: int):
    if not numero_valores: return
    for i in range(len(matriz)):
        for j in range(len(matriz)):
            if (i, j) == (randint(0, len(matriz)), randint(0, len(matriz))):
                set(matriz, (i,j), randint(1, 9))
                random_set(matriz, numero_valores-1)
                return
    random_set(matriz, numero_valores)


def set(matriz: list, coord: tuple, value: int):
    matriz[coord[0]][coord[1]] = value


def get(matriz: list, coord: tuple):
    return matriz[coord[0]][coord[1]]
