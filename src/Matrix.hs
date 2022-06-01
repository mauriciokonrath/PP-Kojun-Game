module Matrix where

-- a module to manipulate matrixes.

import Utils
import Colors
import Input

data Element = Element {
    getValue :: Int,
    getRegion :: Integer,
    getI :: Int,
    getJ :: Int
}
-- type ElementContent = Int | String
type Matrix = [[Element]]
type Pos = (Int, Int)


-- generates a new ixj 2D matrix.
newMatrix :: Int -> Int -> Matrix
newMatrix i j = [ [ (Element 0 0 i j) | x<-[1..j]] | x<-[1..i] ]


-- setRegions :: Matrix -> Pos -> Matrix
-- setRegions mat (i, ) =
-- setRegions mat (i, j) = setRegions ( setElement mat ( i, j ) ( setElementRegion (getElement mat (i, j)) ), ( i+1, j+1 ))

mapRow :: [Element] -> (Element -> Element) -> [Element]
mapRow (e:row) f = f e : mapRow row f

mapMatrix :: Matrix -> (Element -> Element) -> Matrix
mapMatrix (row:mat) f = mapRow row f : mapMatrix mat f

setElementRegion :: Element -> Element
setElementRegion e = Element (getValue e) ((input !! (getI e)) !! (getJ e)) (getI e) (getJ e)

add :: Element -> Element
add e = Element (getValue e + 1) (getRegion e) (getI e) (getJ e)

-- returns an element in a matrix at a given position.
getElement :: Matrix -> Pos -> Element
getElement mat (i, j) = (mat !! i) !! j

-- replaces an element in a matrix at a given position.
setElement :: Matrix -> Pos -> Element -> Matrix
setElement mat (i, j) e = replace mat j ( replace (mat !! i) j e )
--
-- setValue :: Element -> Int -> Element
-- setValue e value = (Element value  )
