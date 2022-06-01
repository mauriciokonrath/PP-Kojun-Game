module Print where

-- a module to print things.

import Matrix
import Colors


-- converts a list to a formatted string
rowToString :: [Element] -> String
rowToString [] = "\n"
rowToString (e:l) = ( "\ESC[1m" ++ translateColor (getRegion e) )
                      ++ (show (getValue e)) ++ endColor
                      ++ " " ++ (rowToString l) ++ "\ESC[0m"

-- converts a matrix to a single formatted string
matrixToString :: Matrix -> String
matrixToString [] = ""
matrixToString (a:b) = (rowToString a) ++ (matrixToString b)

-- prints a matrix
printMatrix :: Matrix -> IO()
printMatrix mat = putStrLn (matrixToString mat)
