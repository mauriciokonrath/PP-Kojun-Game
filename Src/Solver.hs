module Src.Solver where

import Src.Matrix
import Tests.Adjacency
import Tests.Empty
import Tests.Region

-- retorna tamanho da regiao
lenRegion :: Matrix -> Element -> Int
lenRegion mat e = sum [1 | row <- mat, element <- row, ( ((getRegion e) == (getRegion element)) && ((getValue e) == 0 ) )]


-- procura elemento invalido (retorna primeiro que achar) --
-- procura na linha
searchInRow :: Matrix -> [Element] -> Pos
searchInRow refMat [] = (-1, -1)
searchInRow refMat (e:row) | ( not (valid refMat e) ) = ((getI e), (getJ e))
                           | otherwise = searchInRow refMat row

-- procura em toda matriz
searchInvalid :: Matrix -> Matrix -> Pos
searchInvalid refMat [] = (-1, -1)
searchInvalid refMat (row:mat) | ( (searchInRow refMat row) /= (-1, -1) ) = searchInRow refMat row
                               | otherwise = searchInvalid refMat mat


-- testa se determinado elemento eh valido na matriz
valid :: Matrix -> Element -> Bool
valid mat e | (hasEqAdjacenct mat e) || (existsInRegion mat e) || (emptyElement e) = False
            | otherwise = True

-- tenta inserir elemento em determinada posicao (tentando de len(region) ate 1)
tryEveryPossible :: Matrix -> Pos -> Int -> Matrix
tryEveryPossible mat pos 0 = mat
tryEveryPossible mat (i, j) possible | valid mat (Element possible (getRegion (getElement mat (i, j))) i j) =
                                        setElement mat (i, j) (Element possible (getRegion (getElement mat (i, j))) i j)
                                     | otherwise = (tryEveryPossible mat (i, j) (possible-1))

-- checa posicao invalida encontrada para iniciar processo de tentativas
tryResolvePos :: Matrix -> Pos -> Matrix
tryResolvePos mat (-1, -1) = mat      -- erro (matriz pronta)
tryResolvePos mat pos = tryEveryPossible mat pos (lenRegion mat (getElement mat pos))

-- resolve matriz de kojun, termina se matriz mandada para o processo for igual a recebida
solve :: Matrix -> Matrix
solve mat | ( compareMatrix mat (tryResolvePos mat (searchInvalid mat mat)) ) = mat
          | otherwise = solve (tryResolvePos mat (searchInvalid mat mat))
