-- principal

import Src.Matrix
import Src.Solver
import Src.Print


main = do
  let m = newMatrix 6 6

  -- antes
  printMatrix m

  -- depois
  printMatrix ( solve m )
