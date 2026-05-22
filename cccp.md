---
title: "Cartilha de Combate para Competições de Programação"
---

# Cartilha de Combate para Competições de Programação

## Sobre a cartilha

A Cartilha de Combate para Competições de Programação, ou CCCP, é mantida no
Github de maneira aberta e colaborativa. Para mais informações acesse:
https://github.com/deniscostadsc/cccp/.

## No dia da competição

### Estrutura das pastas

Digitar o seguinte comando no terminal (Linux):

```shell
$ mkdir -p \
    maratona/templates \
    maratona/problemas/{A..K}/ \
    maratona/aquecimento
```

Após esse comado, você terá a seguinte estrutura de pastas no seu computador:

```
$ tree maratona/
maratona/
    aquecimento/
    problemas/
         A/
         B/
         C/
         D/
         E/
         F/
         G/
         H/
         I/
         J/
         K/
    templates/
```

Na pasta de templates, já deixe escrito os templates de C++ e Python, pra que
eles sejam copiados para a resolução de cada problema.

### Arquivos de entrada e saída

Quando for resolver um problema, não digite a entrada do problema manualmente no
terminal, caso não resolva o problema de primeira você vai precisar fazer isso
várias vezes e isso custará tempo. Salva a entrada e a saída esperada em
arquivos:

```
$ tree maratona/
maratona/
    aquecimento
    problemas/
        A/
            a.cpp
            entrada.txt
            saida.txt
...
```

e execute da seguinte forma para C++:

```shell
$ g++ -std=c++20 -O2 -lm a.cpp
$ ./a.o < entrada.txt > resultado.txt
```

E para Python:

```shell
$ python a.py < entrada.txt > resultado.txt
```

Para identificar possível diferenças no resultado use a ferramenta `diff`:

```shell
$ diff resultado.txt saída.txt
```

## Templates

### Template C++

```cpp
#include <cstdint>  // tipos numéricos (int16_t, int32_t, etc..)
#include <iomanip>  // set precision
#include <iostream>  // std::cin, std::cout

int main() {
    // nao misturar cin com scanf
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(0);

    int16_t a, b;

    while (std::cin >> a >> b) {
        std::cout << a + b << '\n';
    }

    return 0;
}
```

### Template Python

```python
import sys

input = sys.stdin.readline
output = sys.stdout.write

while line := input().strip():
    a, b = map(int, line.split())
    output(f'{a + b}')
```

## Tipos

### C++

```c++
#include <cstdint>  // biblioteca para inteiros exatos

int main(){
    // inteiros com sinal
    int8_t i8;
    int16_t i16;
    int32_t i32;
    int64_t i64

    //inteiros sem sinal
    uint8_t ui8;
    uint16_t ui16;
    uint32_t ui32;
    uint64_t ui64

    //ponto flutuante
    float f;  // 6 casas decimais de precisão
    double d;  // para mais precisão
    long double ld;

    return 0;
}
```

## Entradas

### N + N-linhas

```
5
3 4
2 4
1 2
5 6
4 1
```

#### C++

```c++
#include <iostream>
#include <cstdint>

int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(0);

    int16_t n, a, b;
    std::cin >> n;

    for (int16_t i = 0; i < n; i++) {
        std::cin >> a >> b;
    }

    return 0;
}
```

#### Python

```python
import sys

input = sys.stdin.readline

n = int(input())

for _ in range(n):
    a, b = map(int, input().split())
```

### Número indefinido de linhas

```
3 4
2 4
1 2
5 6
4 1
```

#### C++

```c++
#include <iostream>
#include <cstdint>

int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(0);

    int16_t a, b;

    while (std::cin >> a >> b) {

    }

    return 0;
}
```

#### Python

```python
import sys

for line in sys.stdin:
    a, b = map(int, line.split())
```

### Zero no final

```
3 4
2 4
1 2
5 6
4 1
0 0
```

#### C++

```c++
#include <iostream>
#include <cstdint>

int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(0);

    int16_t a, b;

    while (std::cin >> a >> b && a != 0 && b != 0) {

    }

    return 0;
}
```

#### Python

```python
import sys

for line in sys.stdin:
    a, b = map(int, line.split())
    if not a and not b:
        break
```

## Saída

### Formatação de ponto flutuante

#### C++

```c++
#include <iostream>
#include <iomanip>

int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(0);

    float pi = 3.1514;

    std::cout << std::fixed << std::setprecision(2) << pi;

    return 0;
}
```

#### Python
```python
pi = 3.1514
output(f'{pi:.2f}\n')
```

## Complexidade de espaço e tempo

| Tamanho da Entrada (n) | Complexidade Aceitável | Exemplos de Algoritmos |
|-|-|--|
| $n \leq 10$ | $O(n!)$, $O(n^6)$ | Permutações, Força Bruta com backtracking |
| $n \leq 20$ | $O(2^n)$, $O(n^5)$ | Bitmask DP, Força Bruta |
| $n \leq 100$ | $O(n^4)$ | DP com 3 estados, 4 loops aninhados |
| $n \leq 1.000$ | $O(n^3)$, $O(n^2 \log{n})$ | Floyd-Warshall, 3 loops aninhados |
| $n \leq 10.000$ | $O(n^2)$ | 2 loops aninhados, Bubble Sort |
| $n \leq 100.000$ | $O(n \log{n})$ | Merge Sort, Heap Sort, Segment Tree |
| $n \leq 1.000.000$ | $O(n)$, $O(\log{n})$ | Loop simples, Busca Binária |
| $n > 1.000.000$ | $O(1)$ | Fórmula matemática, acesso a HashMap |

## Estruturas de Dados

## Algoritmos

### Matemática

#### Máximo divisor comum (MDC)

##### C++

```c++
std::int16_t mdc(std::int16_t a, std::int16_t b) {
    std::int16_t x;

    while (b > 0) {
        x = b;
        b = a % b;
        a = x;
    }

    return a;
}
```

##### Python

```python
def mdc(a, b):
    while b > 0:
        a, b = b, a % b

    return a
```

#### Mínimo múltiplo comum (MMC)

##### C++

```c++
std::int64_t mmc(std::int64_t x, std::int64_t y) {
    return abs(x) / gcd(x, y) * abs(y);
}
```

##### Python

```python
def mmc(x, y):
    return abs(x) // mdc(x, y) * abs(y)
```

#### Número primo

##### C++

```c++
bool is_prime(std::int32_t n) {
    if (n == 2) {
        return true;
    }
    if (n % 2 == 0 || n < 2) {
        return false;
    }

    for (std::int32_t i = 3; i <= sqrt(n); i += 2) {
        if (n % i == 0) {
            return false;
        }
    }
    return true;
}
```

##### Python

```python
def is_prime(n):
    if n == 2:
        return True

    if n % 2 == 0 or n < 2:
        return False

    for i in range(3, int(math.sqrt(n)) + 1, 2):
        if n % i == 0:
            return False

    return True
```
#### Soma intervalo [n,m]

##### Python
```python
(m - n + 1) * (n + m) // 2
```

## Roteiro de depuração

### Pré-submissão:
- Escreva alguns casos de teste simples se a amostra não for suficiente.
- Os limites de tempo são apertados? Se sim, gere casos máximos.
- O uso de memória está ok?
- Algo pode estourar (overflow)?
- Certifique-se de enviar o arquivo correto.

### Resposta errada:
- Imprima sua solução! Imprima também saídas de depuração.
- Você está limpando todas as estruturas de dados entre os casos de teste?
- Seu algoritmo consegue lidar com toda a faixa de entrada?
- Leia o enunciado completo do problema novamente.
- Você lidou corretamente com todos os casos extremos?
- Você entendeu o problema corretamente?
- Alguma variável não inicializada?
- Algum overflow?
- Confundindo N e M, i e j, etc.?
- Você tem certeza de que seu algoritmo funciona?
- Quais casos especiais você não considerou?
- Você tem certeza de que as funções da STL que você usa funcionam como você pensa?
- Adicione algumas asserções (asserts), talvez reenvie.
- Crie alguns casos de teste para executar seu algoritmo.
- Execute o algoritmo para um caso simples.
- Percorra esta lista novamente.
- Explique seu algoritmo para um colega de equipe.
- Peça ao colega para olhar seu código.
- Dê uma pequena caminhada, por exemplo, até o banheiro.
- Seu formato de saída está correto? (incluindo espaços em branco)
- Reescreva sua solução do zero ou peça para um colega fazer isso.

### Erro em tempo de execução:
- Você testou todos os casos extremos localmente?
- Alguma variável não inicializada?
- Você está lendo ou escrevendo fora do intervalo de algum vetor?
- Alguma asserção que possa falhar?
- Alguma possível divisão por 0? (por exemplo, módulo 0)
- Alguma recursão infinita possível?
- Ponteiros ou iteradores invalidados?
- Você está usando memória excessiva?
- Depure com reenvios (ex.: sinais remapeados, veja "Various").

### Limite de tempo excedido:
- Você tem algum loop infinito possível?
- Qual é a complexidade do seu algoritmo?
- Você está copiando muitos dados desnecessários? (use referências)
- Qual é o tamanho da entrada e da saída? (considere usar scanf)
- Evite vector, map. (use arrays/unordered_map)
- O que seus colegas acham do seu algoritmo?

### Limite de memória excedido:
- Qual é a quantidade máxima de memória que seu algoritmo deve precisar?
- Você está limpando todas as estruturas de dados entre os casos de teste?
