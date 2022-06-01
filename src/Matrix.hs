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
newMatrix r c = [ [ (Element 0 0 i j) | j<-[0..c-1]] | i<-[0..r-1] ]


compareElement :: [Element] -> [Element] -> Bool
compareElement [] [] = True
compareElement (ex:rowx) (e:row) | (getValue ex) == (getValue e) = compareElement rowx row
                                 | otherwise = False

compareMatrix :: Matrix -> Matrix -> Bool
compareMatrix [] [] = True
compareMatrix (rowx:matx) (row:mat) | (compareElement rowx row) = compareMatrix matx mat
                                    | otherwise = False


mapRow :: [Element] -> (Element -> Element) -> [Element]
mapRow [] f = []
mapRow (e:row) f = f e : mapRow row f

mapMatrix :: Matrix -> (Element -> Element) -> Matrix
mapMatrix [] f = []
mapMatrix (row:mat) f = mapRow row f : mapMatrix mat f

setElementRegion :: Element -> Element
setElementRegion e = Element (getValue e) ((input !! (getI e)) !! (getJ e)) (getI e) (getJ e)


-- returns an element in a matrix at a given position.
getElement :: Matrix -> Pos -> Element
getElement mat (i, j) = (mat !! i) !! j

-- replaces an element in a matrix at a given position.
setElement :: Matrix -> Pos -> Element -> Matrix
setElement mat (i, j) e = replace mat j ( replace (mat !! i) j e )
