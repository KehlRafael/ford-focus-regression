# ford-focus-regression
Esta uma implementação simples de descida gradiente para criar um modelo polinomial que estima o preço de um Ford Focus no Reino Unido, dado a kilometragem que ele já rodou. A descida gradiente foi implementada e testa no Octave, mas provavelmente funciona sem problemas no Matlab também.

Além disso, essa implementação é geral o suficiente para resolver problemas gerais de minimização polinomial.

## Dataset
O [dataset](data/focus.csv) que temos na pasta [data](data) é parte do [100,000 UK Used Car Data set](https://www.kaggle.com/adityadesai13/used-car-dataset-ford-and-mercedes/), disponibilizada no Kaggle pelo usuário [Aditya](https://www.kaggle.com/adityadesai13). Para treinar o algoritmo, eu extrai 500 entradas aleatórias do [conjunto de dados](data/focus.csv) original e criei uma [amostra](data/focusSample.csv). Eu uso a amostra para treinar tanto o modelo linear, quanto o quadrático.

## Usabilidade
Para simplesmente executar a descida gradiente na amostra, abra o Octave e selecione a pasta do projeto como o diretório atual e digite `main` para executar o treinamento do modelo linear e `mainQuadratic` para executar o treinamento quadrático. Os coeficientes do modelo serão guardados na variável `theta` e gráficos mostrarão os dados de treino e o modelo resultante. Além disso, uma animação no formato GIF com 50 passos do treinamento do modelo será salva na pasta [img](img).

Você pode mudar quaisquer parâmetros diretamente no script [`main`](main.m) ou [`mainQuadratic`](mainQuadratic.m), ou usar as funções diretamente. Para executar somente a descida gradiente no seu próprio dataset ou polinômio, você deve usar o seguinte comando:
```
[theta, costFunction_history, theta_history] = gradientDescent(X, y, theta, alpha, num_iters);
```
Onde `num_iters` é o número de iterações que você quer que o gradiente execute, `alpha` é a taxa de aprendizado do algoritmo, `theta` é um vetor de ordem `n` com o valor inicial dos coeficiente do polinômio (`n` é o número de coeficientes do seu polinômio), `y` são os resultados, ou rótulos, dos dados de treino, e `X` é uma matriz `n x m` com a entrada dos dados de treino (`n` é o número de coeficientes do seu polinômio e `m` é o número de entradas dos dados de treino). Esta função retornará os coeficientes do seu polinômio (`theta`), o histórico da sua função custo, ou objetivo, (`costFunction_history`) e o histórico dos valores dos coeficientes (`theta_history`).

Um exemplo de `X` válido para um polinômio quadrático completo é o seguinte:
```
X = [ones(length(training_inputs), 1), training_inputs, training_inputs.^2];
```
Para qualquer polinômio de ordem maior você só precisa adicionar colunas para cada coeficiente. Por exemplo, para adicionar um coeficiente de ordem `6` bastaria adicionar a coluna `training_inputs.^6` na matriz.
