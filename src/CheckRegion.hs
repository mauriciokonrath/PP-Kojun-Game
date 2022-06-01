module CheckRegion where


import Matrix


-- checa se elemento existe na linha
inRow :: [Element] -> Element -> Bool
inRow [] candidate  = False
inRow (e:row) candidate | ((getRegion candidate) == (getRegion e)) &&
                            ((getValue candidate) == (getValue e)) = True
                        | otherwise = inRow row candidate

-- Checa se elemento ja existe na regiao
existsInRegion :: Matrix -> Element -> Bool
existsInRegion [] candidate = False
existsInRegion (row:mat) candidate | inRow row candidate = True
                                   | otherwise = existsInRegion mat candidate
