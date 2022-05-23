module Print (printMatrix) where

-- a module to print things.

import Matrix


-- converts a list to a formatted string
listToString :: [Element] -> String
listToString [] = "\n"
listToString (a:b) = (show (a !! 0)) ++ " " ++ (listToString b)

-- converts a matrix to a single formatted string
matrixToString :: Matrix -> String
matrixToString [] = ""
matrixToString (a:b) = (listToString a) ++ (matrixToString b)

-- prints a matrix
printMatrix :: Matrix -> IO()
printMatrix mat = putStrLn (matrixToString mat)
