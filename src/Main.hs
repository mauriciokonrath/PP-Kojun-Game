-- principal

import Matrix
import Print
--
-- mapF :: [[Int]] -> (Int -> Int) -> [[Int]]
-- mapF mat f = map (map f) mat

main = do
  let m = newMatrix 5 5
  printMatrix m
  let m = mapMatrix m (add)

  print( show (getValue (( m !! 0) !! 0)) )
  -- printMatrix m
  -- mapMatrix (setRegion) m
  -- printMatrix m
  -- print(mapF [[0, 2], [2, 1]] (+1))
