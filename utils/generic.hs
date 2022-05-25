module Generic (generic) where

-- a generic module with generic functions :P.


-- replaces an value in a list at a given index.
replace :: [t] -> Int -> t -> [t]
replace l i v = take i l ++ [v] ++ drop (i+1) l
