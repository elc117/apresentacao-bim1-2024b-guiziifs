{-
    Crie uma função para obter as bounding boxes com scores maiores que um dado valor. 
    Essa função deve receber a lista de bounding boxes, a lista de classes e o valor do limiar.
    Resolva esta função sem usar lambda, só usando outras funções existentes ou que você declarar. 
    Pesquise a função zip, que será útil aqui.

    Exemplo de uso:
    ghci> selectBoundingBoxesWithHighScore boundingBoxes scores 0.7
    [(34.0,60.0,200.0,320.0),(100.0,150.0,250.0,380.0)]

    Nome e tipo da função:
    selectBoundingBoxesWithHighScore :: [(Float, Float, Float, Float)] -> [Float] -> Float -> [(Float, Float, Float, Float)]
-}


zipBoxesAndScores :: [(Float, Float, Float, Float)] -> [Float] -> [((Float, Float, Float, Float), Float)]
zipBoxesAndScores boundingBoxes scores = zip boundingBoxes scores 

isHighScore :: Float -> ((Float, Float, Float, Float), Float) -> Bool
isHighScore limiar (_, score) = score > limiar

selectBoundingBoxesWithHighScore :: [(Float, Float, Float, Float)] -> [Float] -> Float -> [(Float, Float, Float, Float)]
selectBoundingBoxesWithHighScore boundingBoxes scores limiar =  map fst (filter (isHighScore limiar) (zipBoxesAndScores boundingBoxes scores))