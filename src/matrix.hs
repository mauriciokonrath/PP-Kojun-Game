module Matrix (matrix) where

-- a module to manipulate matrixes.

import Generic

type Element = [Int]
type Matrix = [[Element]]
type Pos = (Int, Int)


-- generates a new ixj 2D matrix.
newMatrix :: Int -> Int -> Matrix
newMatrix i j = [ [[0, 0]|x<-[1..j]] | x<-[1..i] ]

-- replaces an element in a matrix at a given position.
setElement :: Matrix -> Pos -> Element -> Matrix
set mat (i, j) e = replace mat j ( replace (mat !! i) j e )

-- returns an element in a matrix at a given position.
getElement :: Matrix -> Pos -> Element
getElement mat (i, j) = (mat !! i) !! j
