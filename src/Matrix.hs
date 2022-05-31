module Matrix where

-- a module to manipulate matrixes.

import Utils
import Colors

data Element = Normal Int String
type Matrix = [[Element]]
type Pos = (Int, Int)


-- generates a new ixj 2D matrix.
newMatrix :: Int -> Int -> Matrix
newMatrix i j = [ [[(0, "")]|x<-[1..j]] | x<-[1..i] ]

-- replaces an element in a matrix at a given position.
setElement :: Matrix -> Pos -> Element -> Matrix
setElement mat (i, j) e = replace mat j ( replace (mat !! i) j e )

-- returns an element in a matrix at a given position.
getElement :: Matrix -> Pos -> Element
getElement mat (i, j) = (mat !! i) !! j
