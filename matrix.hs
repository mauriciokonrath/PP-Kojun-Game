newMatrix :: [[Int]]
newMatrix = 
    [0,0,0,0,0,0]:[0,0,0,0,0,0]:[0,0,0,0,0,0]:[0,0,0,0,0,0]:[0,0,0,0,0,0]:[0,0,0,0,0,0]:[]

searchEmpty :: [[Int]] -> (Int)
searchEmpty m =
    -- imcompleto

set :: [[Int]] -> [Int] -> Int -> [[Int]]
set mat coord value =
    mat[coord[0]][coord[1]] = value
    mat

get :: [[Int]] -> [Int] -> Int
get mat coord =
    mat[coord[0]][coord[1]]