module Tests.Empty where

import Src.Matrix

-- testa se elemento eh vazio (sem valor)
emptyElement :: Element -> Bool
emptyElement e = ( (getValue e) == 0 )
