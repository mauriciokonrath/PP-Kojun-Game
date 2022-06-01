module Matrix where

-- a module to manipulate matrixes.

import Utils
import Colors

data Element = Element {
    getValue :: Int,
    getRegion :: Int,
    getColor :: String
}
-- type ElementContent = Int | String
type Matrix = [[Element]]
type Pos = (Int, Int)
--
-- setRegion :: Element -> Int -> Element
-- setRegion e regionId = (Element (getValue e) regionId (getColor e))

-- map matrix
-- mapMatrix :: Matrix -> (Element -> Int -> Element) -> Matrix
-- mapMatrix mat f = (map (map f) mat)

-- generates a new ixj 2D matrix.
newMatrix :: Int -> Int -> Matrix
newMatrix i j = [ [(Element 0 0 "")|x<-[1..j]] | x<-[1..i] ]

-- replaces an element in a matrix at a given position.
setElement :: Matrix -> Pos -> Element -> Matrix
setElement mat (i, j) e = replace mat j ( replace (mat !! i) j e )

-- returns an element in a matrix at a given position.
getElement :: Matrix -> Pos -> Element
getElement mat (i, j) = (mat !! i) !! j
