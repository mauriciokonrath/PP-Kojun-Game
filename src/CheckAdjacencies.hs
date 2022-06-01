module CheckAdjacencies where

import Matrix

-- Checa se os valores adjacentes (esquerda direita, cima e baixo) são diferentes de si mesmo
hasEqAdjacenct :: Matrix -> Element -> Bool
hasEqAdjacenct mat e | ( getValue (getElement mat ((getI e)+1, (getJ e))) ) == ( getValue e ) = True  -- de baixo
                     | ( getValue (getElement mat ((getI e)-1, (getJ e))) ) == ( getValue e ) = True  -- de cima
                     | ( getValue (getElement mat ((getI e), (getJ e)+1)) ) == ( getValue e ) = True  -- da direita
                     | ( getValue (getElement mat ((getI e), (getJ e)-1)) ) == ( getValue e ) = True  -- da esquerda
                     | otherwise = False
