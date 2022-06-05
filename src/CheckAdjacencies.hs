module CheckAdjacencies where

import Matrix


formatMatrix :: Matrix -> Matrix -> Matrix
formatMatrix refMat [] = (replicate ((length refMat)+2) (Element 0 6 0 0)) : []
-- formatMatrix refMat mat | ( compareMatrix refMat mat ) = formatMatrix refMat ((replicate ((length refMat)-2) (Element 0 6 0 0)) : mat)
formatMatrix refMat (row:mat) = ([Element 0 6 0 0] ++ row ++ [Element 0 6 0 0]) : (formatMatrix refMat mat)


-- Checa se existe valores adjacentes iguais ao elemento (esquerda direita, cima e baixo)
hasEqAdjacenct :: Matrix -> Element -> Bool
hasEqAdjacenct mat e | ( getValue (getElement (formatMatrix mat ((replicate ((length mat)-2) (Element 0 6 0 0)):mat)) ((getI e)+1, (getJ e))) ) == ( getValue e ) = True  -- de baixo
                     | ( getValue (getElement (formatMatrix mat ((replicate ((length mat)-2) (Element 0 6 0 0)):mat)) ((getI e)-1, (getJ e))) ) == ( getValue e ) = True  -- de cima
                     | ( getValue (getElement (formatMatrix mat ((replicate ((length mat)-2) (Element 0 6 0 0)):mat)) ((getI e), (getJ e)+1)) ) == ( getValue e ) = True  -- da direita
                     | ( getValue (getElement (formatMatrix mat ((replicate ((length mat)-2) (Element 0 6 0 0)):mat)) ((getI e), (getJ e)-1)) ) == ( getValue e ) = True  -- da esquerda
                     | otherwise = False
