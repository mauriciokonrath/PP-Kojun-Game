def nova_matriz(tamanho: int):
    mat = [0] * tamanho
    for i in range(tamanho):
        mat[i] = [0] * tamanho
    return mat

def print_matriz(matriz: list):
    for i in range(len(matriz)):
        print(matriz[i])

def set(matriz: list, coord: tuple, value: int):
    matriz[coord[0]][coord[1]] = value

def get(matriz: list, coord: tuple):
    return matriz[coord[0]][coord[1]]
