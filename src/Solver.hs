module Solver where

import Matrix
import CheckAdjacencies
import CheckRegion



lenRegion :: Matrix -> Element -> Int
lenRegion mat e = sum [1 | row <- mat, element <- row, (getRegion e) == (getRegion element)]

searchInRow :: Matrix -> [Element] -> Pos
searchInRow mat [] = (-1, -1)
searchInRow mat (e:row) | not (valid mat e) = ((getI e), (getJ e))
                        | otherwise = searchInRow mat row

searchInvalid :: Matrix -> Matrix -> Pos
searchInvalid matx [] = (-1, -1)
searchInvalid matx (row:mat) | (searchInRow matx row) == (-1, -1) = (-1, -1)
                             | otherwise = searchInvalid matx mat

emptyElement :: Element -> Bool
emptyElement e = ((getValue e) == 0)

valid :: Matrix -> Element -> Bool
valid mat e | (hasEqAdjacenct mat e) || (existsInRegion mat e) || (emptyElement e) = False
            | otherwise = True

tryEveryPossible :: Matrix -> Pos -> Int -> Matrix
tryEveryPossible mat pos possible | valid mat (Element possible (getRegion (getElement mat pos))
                                      (getI (getElement mat pos)) (getJ (getElement mat pos))) =
                                        tryEveryPossible mat pos (possible-1)
                                  | otherwise = tryEveryPossible mat pos (possible-1)

tryCandidates :: Matrix -> Pos -> Matrix
tryCandidates mat (-1, -1) = mat
tryCandidates mat pos = tryEveryPossible mat pos (lenRegion mat (getElement mat pos))

solve :: Matrix -> Matrix
solve mat | ( compareMatrix (tryCandidates mat (searchInvalid mat mat)) mat ) = mat
          | otherwise = solve mat
