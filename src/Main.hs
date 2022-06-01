-- principal

import Matrix
import Print
import Solver
--
-- mapF :: [[Int]] -> (Int -> Int) -> [[Int]]
-- mapF mat f = map (map f) mat

main = do
  let m = newMatrix 6 6
  -- printMatrix m
  -- let m = mapMatrix m (add)
  -- printMatrix m
  printMatrix (solve (mapMatrix m (setElementRegion)))

  -- printMatrix m
  -- mapMatrix (setRegion) m
  -- printMatrix m
  -- print(mapF [[0, 2], [2, 1]] (+1))
