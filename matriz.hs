--Prototipo nao sei fazer recursividade direito

newMatrix1 :: Int -> List
newMatrix1 n = 
    mat = [0] * n

newMatrix2 :: Int -> Int -> List -> List
newMatrix2 i n mat =
    if i == n then
        mat
    else
        mat[i] = [0] * n
        i = i + 1
        newMatrix2 i n mat
        