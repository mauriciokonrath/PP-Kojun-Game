module Tests.Adjacency where

import Src.Matrix

-- retorna vizinhos vizinahnca de 4)
getUpperNeighbor :: Matrix -> Element -> Element      -- de cima
getUpperNeighbor mat e | ( (getI e) == 0 ) = (Element (-1) 0 0 0)
                       | otherwise = (getElement mat (((getI e)-1), (getJ e)))

getLowerNeighbor :: Matrix -> Element -> Element      -- de baixo
getLowerNeighbor mat e | ( (getI e) == (length mat)-1 ) = (Element (-1) 0 0 0)
                       | otherwise = (getElement mat (((getI e)+1), (getJ e)))

getLeftNeighbor :: Matrix -> Element -> Element       -- da esquerda
getLeftNeighbor mat e | ( (getJ e) == 0 ) = (Element (-1) 0 0 0)
                       | otherwise = (getElement mat ((getI e), ((getJ e)-1)))

getRightNeighbor :: Matrix -> Element -> Element      -- da direita
getRightNeighbor mat e | ( (getJ e) == (length mat)-1 ) = (Element (-1) 0 0 0)
                       | otherwise = (getElement mat ((getI e), ((getJ e)+1)))


-- Checa se existe valores adjacentes iguais ao elemento (esquerda direita, cima e baixo)
hasEqAdjacenct :: Matrix -> Element -> Bool
hasEqAdjacenct mat e = ( ((getValue (getUpperNeighbor mat e)) == (getValue e) ) ||
                          ((getValue (getLowerNeighbor mat e)) == (getValue e) ) ||
                          ((getValue (getLeftNeighbor mat e)) == (getValue e) ) ||
                          ((getValue (getRightNeighbor mat e)) == (getValue e) ) )
