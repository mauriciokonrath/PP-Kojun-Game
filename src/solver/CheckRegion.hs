module CheckRegion where

-- Checa no quadrante se ha numeros repedidos
checkRegion:: Matrix -> Int -> Matrix
checkRegion mat region =
    -- Checar regiao

    {- if (((mat !! i) !! j) getRegion) == region then
        -- Logica de verificação de regiao
        if verifyUp then -- verifica se é a maior pos
            if verifyUpBigger then -- verifica se ja foi colocar o maior valor na maior pos
                (((mat !! i) !! j) setValue 6) -- seta o maior valor possivel para esta pos
        else -}
