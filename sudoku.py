def procurar_vazio(matriz: list) -> tuple:
    for i in range(len(matriz)):
        for j in range(len(matriz)):
            if matriz[i][j] == 0:
                return (i, j)


def valido(matriz: list, valor: int, coord: tuple) -> bool:
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


def resolver(matriz: list) -> bool:
    achado = procurar_vazio(matriz)

    if not achado: return True
    else: linha, coluna = achado

    for valor_possivel in range(10):
        if valido(matriz, valor_possivel, achado):
            matriz[linha][coluna] = valor_possivel

            if resolver(matriz): return True

            matriz[linha][coluna] = 0

    return False