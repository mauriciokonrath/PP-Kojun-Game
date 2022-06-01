-- principal

import Matrix
import Print

main = do
  let m = newMatrix 10 10
  mapMatrix m (+3)
  printMatrix m
