module Src.Print where

-- a module to print things.

import Src.Matrix
import Src.Colors

-- pega cor com base na regiao, ou, se vazio, retorna cor erro
getColor :: Element -> String
getColor e | ( (getValue e) /= 0 ) = translateColor (getRegion e)
           | otherwise = eColor

-- converte linha para string com cores
rowToString :: [Element] -> String
rowToString [] = "\n"
rowToString (e:l) = ( "\ESC[1m" ++ (getColor e) )
                    ++ (show (getValue e)) ++ endColor
                    ++ " " ++ (rowToString l) ++ "\ESC[0m"

-- coverte a matriz inteira a uma string foramatada
matrixToString :: Matrix -> String
matrixToString [] = ""
matrixToString (row:mat) = (rowToString row) ++ (matrixToString mat)

-- printa uma matriz 2d
printMatrix :: Matrix -> IO()
printMatrix mat = putStrLn (matrixToString mat)
