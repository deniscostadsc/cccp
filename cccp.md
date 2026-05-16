# Cartilha de Combate para Competições de Programação

## Sobre a cartilha

A Cartilha de Combate para Competições de Programação, ou CCCP, é mantida no
Github de maneira aberta e colaborativa. Para mais informações acesse:
https://github.com/deniscostadsc/cccp/.

Esta cartilha está, e talvez esteja pra sempre, em desenvolvimento. Caso
encontre alguma erro, sinta-se livre para submeter um Pull Request no
repositório citado.

A ideia não é, e nunca será ser um guia completa para aprendizado de programação
necessária para essas competições. Para isso recomendo o [Competitive
Programmer’s Handbook][1].

### Objetivo desta cartilha

Esta cartilha se proprões a ser uma referência rápido para consulta e uma forma
de reuniar dicas para evitar erros em competições de programação. Não espere uma
referência técnica aprofundada.

### Como usar a cartilha

## Qual linguagem usar?

As maratonas de programação da ACM aceitam C, C++, Java, Ada, Python e Kotlin.
Mas eu recomendo que se domine C++ e Python. C++ é a linguagem padrão para
competidores, pois é extremamente rápida, comparada com Java e Python, e menos
verbosa que Java. Já Python, que apesar de ser mais lenta que C++ apresenta uma
biblioteca padrão muito vasta e normalmente resulta em códigos mais concisos e
legíveis, ótima para resolver problemas mais fáceis.

Ambas as linguagens possuem vasta documentação na internet e é fácil encontrar
soluções para problemas de competições de programação escritas nessas
linguagens.

A baixo temos dois templates de código para C++ a Python. Em sessões futuras
explicaremos em mais detalhes o que elas fazem.

### Template C++

```cpp
#include <iostream>
#include <cstdint>

int main() {
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

for line in sys.stdin:
    a, b = map(int, line.split())
    print(a + b)
```
## Tipos básicos

## Entrada

Existem algums padrões de arquivos de entrada e você deve saber de cor como ler
todos esse diferentes formatos.

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
        std::cin >> a + b;
    }

    return 0;
}
```

#### Python

```python
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

    while (std::cin >> a + b) {

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

### Linha final zero

```
3 4
2 4
1 2
5 6
4 1
0 0
```

```c++
#include <iostream>
#include <cstdint>

int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(0);

    int16_t a, b;

    while (std::cin >> a + b && a != 0 && b != 0) {

    }

    return 0;
}
```

```python
import sys

for line in sys.stdin:
    a, b = map(int, line.split())
    if not a and not b:
        break
```

## Saída

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

## Estratégia de resolução de problemas

## No dia da competição

### Estrutura das pastas

As maratonas da ACM usam letras como código para cada problema. Para facilitar a
organização do código, e evitar problemas, crie a seguinte estrutura de pastas:

Para isso basta digitar o seguinte comando no terminal (Linux):

```shell
mkdir -p maratona/templates maratona/problemas/{A..K}/ maratona/aquecimento
```

Após esse comado, você terá a seguinte estrutura de pastas no seu computador:

```
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

E dentro de cada pasta respectiva, você adicionará os arquivos específicos para
cada problema.

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
```

e execute da seguinte forma:

```shell
g++ -std=c++20 -O2 -lm a.cpp
./a.o < entrada.txt > resultado.txt
```

Para identificar possível diferenças no resultado use a ferramenta `diff`:

```shell
diff resultado.txt saída.txt
```

## Problemas comuns

### verificar se um número é primo
#### C++

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
````

#### Python

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

## Apêndice

[1]: https://www.cses.fi/book/index.php
