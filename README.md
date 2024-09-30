# Função 3 - Bounding Boxes com Scores

## Descrição do problema

Crie uma função para obter as bounding boxes com scores maiores que um dado valor. Essa função deve receber a lista de bounding boxes, a lista de scores e o valor do limiar.
Resolva esta função sem usar lambda, só usando outras funções existentes ou que você declarar.


## Estrutura do problema

Para esse problema temos inputs principais

- Uma lista de Bounding Boxes onde cada Bounding Box é representado por uma tupla de 4 Floats
- Uma lista de Scores do tipo Float
- Um valor limiar a qual vamos usar como parâmetro para a filtragem


## Desenvolvimento do exercício

### `zipBoxesAndScores` - **Agrupamento de BBoxes e Scores**
A primeira função é responsável por agrupar as Bounding Boxes com 1 Score, ou seja, para cada tupla teremos um score associado a ela, e fazemos isso através da função `zip`

``` haskell
zipBoxesAndScores :: [(Float, Float, Float, Float)] -> [Float] -> [((Float, Float, Float, Float), Float)]
zipBoxesAndScores boundingBoxes scores = zip boundingBoxes scores 
```
- **Parâmetros:** Lista de Bounding Boxes e a lista de Scores
- **Saída:** Uma lista de pares, onde cada par é uma Bounding Box e seu Score


### `isHighScore` - **Comparando o Score e o Limiar**
O intuito dessa função é servir como função auxiliar para a próxima. Essa função recebe o limiar e um par de dados (Bounding Box e Score), a fim de comparar o valor do limiar com o score e retornar se o score é maior que o limiar.

``` haskell
isHighScore :: Float -> ((Float, Float, Float, Float), Float) -> Bool
isHighScore limiar (_, score) = score > limiar
```
- **Parâmetros:** Limiar e o par de dados
- **Saída:** Valor booleano, indicando se o limiar é maior que o score


### `selectBoundingBoxesWithHighScore` - **Seleção de Bounding Boxes**
Por fim, temos a função principal, que filtra as Bounding Boxes com score maior que o limiar digitado. Para ter tal efeito, foi preciso combinar as duas funções auxiliares para produzir o resultado desejado. Primeiro ela cria um par de dados com `zipBoxesAndScores` e filtra os dados de acordo com `isHighScore`, para no fim extrair apenas as Bounding Boxes com `map fst`

``` haskell
selectBoundingBoxesWithHighScore :: [(Float, Float, Float, Float)] -> [Float] -> Float -> [(Float, Float, Float, Float)]
selectBoundingBoxesWithHighScore boundingBoxes scores limiar =  
  map fst (filter (isHighScore limiar) (zipBoxesAndScores boundingBoxes scores))
```
- **Parâmetros:** Bounding Boxes, Scores e Limiar
- **Saída:** Apenas as Bounding Boxes com Score maior que o limiar


## Referências
1. [Listas de Duplas ZIP](https://www.youtube.com/watch?v=BGpVTurVPo4)
2. [Tuplas - Linguagem Haskell](https://www.facom.ufu.br/~madriana/PF/Haskell3.pdf)
