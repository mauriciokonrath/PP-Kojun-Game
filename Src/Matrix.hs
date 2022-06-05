module Src.Matrix where

-- a module to manipulate kojun matrixes.

import Src.Colors
import Src.Input
import Config

data Element = Element {
    getValue :: Int,      -- valor da celula
    getRegion :: Integer, -- id da regiao
    getI :: Int,          -- posicao linha
    getJ :: Int           -- posicao coluna
} deriving Eq

type Matrix = [[Element]] -- lista de listas de elementos
type Pos = (Int, Int)     -- tupla de posicao (IxJ)


-- gera uma nova matrix IxJ conforme o mapa de regioes (input)
newMatrix :: Int -> Int -> Matrix
newMatrix r c = [ [ (Element 0 (readRegion (i, j)) i j) | j<-[0..c-1]] | i<-[0..r-1] ]

-- le um id de regiao na posicao especifica (regionMap eh uma constante de config)
readRegion :: Pos -> Integer
readRegion (i, j) = (regionMap !! i) !! j


-- implementacao de == entre matrizes --
-- eq entre duas linhas
compareRow :: [Element] -> [Element] -> Bool
compareRow rowx row = ( rowx == row )

-- eq entre matrizes
compareMatrix :: Matrix -> Matrix -> Bool
compareMatrix [] [] = True
compareMatrix (rowx:matx) (row:mat) | (compareRow rowx row) = compareMatrix matx mat
                                    | otherwise = False


-- -- funcao map versao matrizes (lista de listas) --
-- -- map de linhas
-- mapRow :: [Element] -> (Element -> Element) -> [Element]
-- mapRow [] f = []
-- mapRow (e:row) f = f e : mapRow row f
--
-- -- map da matriz em si
-- mapMatrix :: Matrix -> (Element -> Element) -> Matrix
-- mapMatrix [] f = []
-- mapMatrix (row:mat) f = mapRow row f : mapMatrix mat f

--
-- -- seta regiao de um elemento com base no mapa de regioes (input)
-- setElementRegion :: Element -> Element
-- setElementRegion e = Element (getValue e) ((CONFIG !! (getI e)) !! (getJ e)) (getI e) (getJ e)


-- retorna um elemento em uma posicao especifica
getElement :: Matrix -> Pos -> Element
getElement mat (i, j) = (mat !! i) !! j

-- seta um elemento em uma especifica posicao
setElement :: Matrix -> Pos -> Element -> Matrix
setElement m (r,c) x =
  take r m ++
  [take c (m !! r) ++ [x] ++ drop (c + 1) (m !! r)] ++
  drop (r + 1) m
