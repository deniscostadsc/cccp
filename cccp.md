---
title: "Cartilha de Combate para Competições de Programação"
toc: true
toc-own-page: true
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

e execute da seguinte forma para C++:

```shell
g++ -std=c++20 -O2 -lm a.cpp
./a.o < entrada.txt > resultado.txt
```

E para Python:

```shell
python a.py < entrada.txt > resultado.txt
```

Para identificar possível diferenças no resultado use a ferramenta `diff`:

```shell
diff resultado.txt saída.txt
```

## Templates

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

input = sys.stdin.readline
output = sys.stdout.write

while line := input().strip():
    a, b = map(int, line.split())
    output(f'{a + b}')
```

## Tipos básicos

### C++

```c++
#include <cstdint>  // biblioteca para inteiros exatos

int main(){
    // inteiros com sinal
    int8_t i8;
    int16_t i16;
    int32_t i32;
    int64_t i66

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

## Entradas mais comuns

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

#### C++

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

#### Python

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

## Algoritmos comuns

### Matemática
#### verificar se um número é primo
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
````

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


## Estratégia de resolução de problemas

