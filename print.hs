printMatrix :: [Int] -> Int -> Int -> IO()
-- printMatrix _ n tamanho = if n == tamanho then putStrLn "" else putStr ""
printMatrix (a:b) n tamanho | (n == tamanho) = putStrLn ""
                            | otherwise = putStr show a


addSpaces :: Int -> String
addSpaces n = replicate n ' '


maind = do
     
