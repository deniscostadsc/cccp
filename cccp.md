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

### Python

```python
# LISTA (array dinâmico)
arr = [1, 2, 3]
arr.append(4)  # O(1) amortizado
arr.pop()  # O(1)
arr.insert(0, 0)  # O(n)
x = arr[2]  # O(1)
arr.sort()  # O(n log n)

# PILHA (usando list como LIFO)
pilha = []
pilha.append(1)  # O(1) - push
pilha.append(2)  # O(1) - push
topo = pilha[-1]  # O(1) - top
elemento = pilha.pop()  # O(1) - pop

# FILA (usando collections.deque como FIFO)
from collections import deque
fila = deque()
fila.append(1)  # O(1) - enqueue
fila.append(2)  # O(1) - enqueue
primeiro = fila[0]  # O(1) - olhar frente
elemento = fila.popleft()  # O(1) - dequeue

# FILA DE PRIORIDADE (heapq - min-heap)
import heapq
heap = []
heapq.heappush(heap, 5)  # O(log n) - inserir
heapq.heappush(heap, 2)  # O(log n) - inserir
menor = heap[0]  # O(1) - menor elemento
elemento = heapq.heappop(heap)  # O(log n) - remover menor

# CONJUNTO (set)
s = set()
s.add(10)  # O(1) médio
s.add(20)  # O(1) médio
if 10 in s:  # O(1) médio - busca
    print("tem")
s.discard(10)  # O(1) médio - remove seguro
s.remove(20)  # O(1) médio - remove (erro se não existir)

# DICIONÁRIO (dict)
d = {}
d["chave"] = 1  # O(1) médio - inserção/atualização
valor = d.get("chave", 0)  # O(1) médio - busca
del d["chave"]  # O(1) médio - remoção
for k, v in d.items():  # O(n) - iteração
    pass

# DEFAULTDICT (dicionário com valor padrão)
from collections import defaultdict
dd = defaultdict(int)  # valor padrão = 0
dd["contagem"] += 1  # O(1) médio - não dá KeyError

dd2 = defaultdict(list)  # valor padrão = []
dd2["chave"].append(1)  # O(1) médio - lista já existe

# COUNTER (para contagem de frequências)
from collections import Counter
contador = Counter([1, 2, 2, 3, 3, 3])  # O(n) - conta elementos
# Counter({3: 3, 2: 2, 1: 1})
mais_comum = contador.most_common(2)  # O(n log k) onde k=2

# BISECT (busca binária em lista ordenada)
from bisect import bisect_left, insort
lista = [1, 3, 5, 7, 9]
pos = bisect_left(lista, 5)  # O(log n) - retorna índice 2
insort(lista, 6)  # O(n) - insere mantendo ordem

# GCD e LCM (máximo divisor comum e mínimo múltiplo comum)
from math import gcd, lcm
a, b = 12, 18
mdc = gcd(a, b)  # O(log min(a,b)) - retorna 6
mmc = lcm(a, b)  # O(log min(a,b)) - retorna 36
```

### C++

```c++
// VECTOR (array dinâmico)
#include <vector>
vector<int> v = {1, 2, 3};
v.push_back(4);                 // O(1) amortizado
v.pop_back();                   // O(1)
v.insert(v.begin(), 0);         // O(n)
int x = v[2];                   // O(1)
// - precisa de #include <algorithm>
sort(v.begin(), v.end());       // O(n log n)

// PILHA (stack - LIFO)
#include <stack>
stack<int> pilha;
pilha.push(1);  // O(1)
pilha.push(2);  // O(1)
int topo = pilha.top();  // O(1)
pilha.pop();  // O(1)

// FILA (queue - FIFO)
#include <queue>
queue<int> fila;
fila.push(1);  // O(1) - enqueue
fila.push(2);  // O(1) - enqueue
int frente = fila.front();  // O(1)
fila.pop();  // O(1) - dequeue

// FILA DUPLA (deque)
#include <deque>
deque<int> dq = {1, 2, 3};
dq.push_front(0);  // O(1)
dq.push_back(4);  // O(1)
dq.pop_front();  // O(1)
dq.pop_back();  // O(1)
int primeiro = dq[0];  // O(1)

// FILA DE PRIORIDADE (priority_queue - max-heap)
#include <queue>
priority_queue<int> pq;
pq.push(5);  // O(log n)
pq.push(2);  // O(log n)
int maior = pq.top();  // O(1)
pq.pop();  // O(log n)

// MIN-HEAP (priority_queue com greater)
#include <queue>
#include <vector>
#include <functional>
priority_queue<int, vector<int>, greater<int>> minHeap;
minHeap.push(5);  // O(log n)
minHeap.push(2);  // O(log n)
int menor = minHeap.top();  // O(1)
minHeap.pop();  // O(log n)

// CONJUNTO ORDENADO (set)
#include <set>
set<int> s;
s.insert(10);  // O(log n)
s.insert(20);  // O(log n)
if (s.find(10) != s.end())  // O(log n)
    cout << "tem" << endl;
s.erase(10);  // O(log n)

// CONJUNTO NÃO ORDENADO (unordered_set)
#include <unordered_set>
unordered_set<int> us;
us.insert(10);  // O(1) médio
us.insert(20);  // O(1) médio
if (us.count(10))  // O(1) médio
    cout << "tem" << endl;
us.erase(10);  // O(1) médio

// DICIONÁRIO ORDENADO (map)
#include <map>
map<string, int> m;
m["chave"] = 1;  // O(log n)
int valor = m["chave"];  // O(log n)
m.erase("chave");  // O(log n)

// DICIONÁRIO NÃO ORDENADO (unordered_map)
#include <unordered_map>
unordered_map<string, int> um;
um["chave"] = 1;  // O(1) médio
int valor2 = um["chave"];  // O(1) médio
um.erase("chave");  // O(1) médio
if (um.count("chave"))  // O(1) médio
    cout << "existe" << endl;

// PAR (pair)
#include <utility>
pair<int, int> p = {1, 2};
int primeiro = p.first;  // O(1)
int segundo = p.second;  // O(1)

// GCD e LCM (C++17)
#include <numeric>
int a = 12, b = 18;
int mdc = gcd(a, b);  // O(log min(a,b)) - retorna 6
long long mmc = lcm(a, b);  // O(log min(a,b)) - retorna 36

// BUSCA BINÁRIA (vetor ordenado)
#include <algorithm>
vector<int> arr = {1, 3, 5, 7, 9};
bool found = binary_search(arr.begin(), arr.end(), 5);  // O(log n)
int pos = lower_bound(arr.begin(), arr.end(), 5) - arr.begin();  // O(log n)
int pos2 = upper_bound(arr.begin(), arr.end(), 5) - arr.begin();  // O(log n)
```

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
from math import gcd
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
from math import lcm
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

### Miscelânia

```c++
// BUSCA BINÁRIA (em vetor ordenado)
#include <algorithm>
vector<int> arr = {1, 3, 5, 7, 9};
int alvo = 5;
bool existe = binary_search(arr.begin(), arr.end(), alvo);
// O(log n)
int pos = lower_bound(arr.begin(), arr.end(), alvo) - arr.begin();
// O(log n) - primeiro >= alvo
int pos2 = upper_bound(arr.begin(), arr.end(), alvo) - arr.begin();
// O(log n) - primeiro > alvo

// TWO POINTERS (dois ponteiros - lista ordenada)
#include <vector>
vector<int> nums = {1, 2, 3, 4, 5, 6};
int l = 0, r = nums.size() - 1;
while (l < r) {
    int soma = nums[l] + nums[r];
    if (soma == alvo) break;
    else if (soma < alvo) l++;
    else r--;
}  // O(n)

// SLIDING WINDOW (janela deslizante)
#include <vector>
vector<int> nums = {1, 2, 3, 4, 5};
int k = 3, soma = 0;
for (int i = 0; i < k; i++) soma += nums[i];  // primeira janela
int melhor = soma;
for (int i = k; i < nums.size(); i++) {
    soma += nums[i] - nums[i - k];  // O(1) por passo
    melhor = max(melhor, soma);
}  // O(n)

// DFS (busca em profundidade - grafo com lista de adjacência)
#include <vector>
#include <stack>
vector<vector<int>> grafo = {{1,2}, {0,3}, {0,3}, {1,2}};
vector<bool> visitado(grafo.size(), false);
stack<int> pilha;
pilha.push(0);
while (!pilha.empty()) {
    int u = pilha.top(); pilha.pop();
    if (visitado[u]) continue;
    visitado[u] = true;
    for (int v : grafo[u]) {
        if (!visitado[v]) pilha.push(v);
    }
}  // O(V + E)

// DFS recursivo
#include <vector>
void dfs(int u, vector<vector<int>>& grafo, vector<bool>& vis) {
    vis[u] = true;
    for (int v : grafo[u]) {
        if (!vis[v]) dfs(v, grafo, vis);
    }
}  // O(V + E)

// BFS (busca em largura - menor caminho em grafo não ponderado)
#include <queue>
#include <vector>
vector<vector<int>> grafo = {{1,2}, {0,3}, {0,3}, {1,2}};
vector<int> dist(grafo.size(), -1);
queue<int> q;
dist[0] = 0;
q.push(0);
while (!q.empty()) {
    int u = q.front(); q.pop();
    for (int v : grafo[u]) {
        if (dist[v] == -1) {
            dist[v] = dist[u] + 1;
            q.push(v);
        }
    }
}  // O(V + E)

// DIJKSTRA (menor caminho em grafo ponderado - sem pesos negativos)
#include <queue>
#include <vector>
#include <climits>
using pii = pair<int, int>;
vector<vector<pii>> grafo(5);  // {vizinho, peso}
vector<int> dist(5, INT_MAX);
priority_queue<pii, vector<pii>, greater<pii>> pq;  // {dist, nodo}
dist[0] = 0;
pq.push({0, 0});
while (!pq.empty()) {
    auto [d, u] = pq.top(); pq.pop();
    if (d > dist[u]) continue;
    for (auto [v, peso] : grafo[u]) {
        if (dist[v] > dist[u] + peso) {
            dist[v] = dist[u] + peso;
            pq.push({dist[v], v});
        }
    }
}  // O((V + E) log V)

// UNION-FIND (DSU - estruturas de conjuntos disjuntos)
#include <vector>
vector<int> pai, tam;
void init(int n) {
    pai.resize(n);
    tam.assign(n, 1);
    for (int i = 0; i < n; i++) pai[i] = i;
}
int find(int x) {
    if (pai[x] != x) pai[x] = find(pai[x]);
    return pai[x];
}
void unite(int a, int b) {
    a = find(a); b = find(b);
    if (a == b) return;
    if (tam[a] < tam[b]) swap(a, b);
    pai[b] = a;
    tam[a] += tam[b];
}  // O(a(n)) ~ constante

// ORDENAÇÃO POR CONTAGEM (Counting Sort - valores pequenos)
#include <vector>
vector<int> arr = {4, 2, 2, 8, 3, 3, 1};
int max_val = 8;
vector<int> cont(max_val + 1, 0);
for (int x : arr) cont[x]++;
vector<int> saida;
for (int i = 0; i <= max_val; i++) {
    for (int j = 0; j < cont[i]; j++) saida.push_back(i);
}  // O(n + max_val)

// ORDENAÇÃO POR BASE (Radix Sort - inteiros)
#include <vector>
#include <algorithm>
void countingSort(vector<int>& arr, int exp) {
    vector<int> saida(arr.size());
    vector<int> cont(10, 0);
    for (int x : arr) cont[(x / exp) % 10]++;
    for (int i = 1; i < 10; i++) cont[i] += cont[i - 1];
    for (int i = arr.size() - 1; i >= 0; i--) {
        saida[cont[(arr[i] / exp) % 10] - 1] = arr[i];
        cont[(arr[i] / exp) % 10]--;
    }
    arr = saida;
}
void radixSort(vector<int>& arr) {
    int max_val = *max_element(arr.begin(), arr.end());
    for (int exp = 1; max_val / exp > 0; exp *= 10) {
        countingSort(arr, exp);
    }
}  // O(d * (n + 10)) onde d é número de dígitos

// KMP (busca de padrão em texto)
#include <vector>
#include <string>
vector<int> kmp(string& pat) {
    int m = pat.size();
    vector<int> lps(m, 0);
    for (int i = 1, len = 0; i < m;) {
        if (pat[i] == pat[len]) {
            lps[i++] = ++len;
        } else if (len) {
            len = lps[len - 1];
        } else {
            lps[i++] = 0;
        }
    }
    return lps;
}
void busca(string& txt, string& pat) {
    vector<int> lps = kmp(pat);
    for (int i = 0, j = 0; i < txt.size();) {
        if (txt[i] == pat[j]) {
            i++; j++;
        }
        if (j == pat.size()) {
            // padrão encontrado na posição i - j
            j = lps[j - 1];
        } else if (i < txt.size() && txt[i] != pat[j]) {
            if (j) j = lps[j - 1];
            else i++;
        }
    }
}  // O(n + m)

// CRIVO DE ERATÓSTENES (Sieve - primos até n)
#include <vector>
vector<bool> sieve(int n) {
    vector<bool> is_prime(n + 1, true);
    is_prime[0] = is_prime[1] = false;
    for (long long i = 2; i * i <= n; i++) {
        if (is_prime[i]) {
            for (long long j = i * i; j <= n; j += i) {
                is_prime[j] = false;
            }
        }
    }
    return is_prime;
}  // O(n log log n)

// FATORAÇÃO EM PRIMOS (usando sieve otimizado)
#include <vector>
vector<int> menor_primo(int n) {
    vector<int> spf(n + 1);
    for (int i = 2; i <= n; i++) spf[i] = i;
    for (int i = 2; i * i <= n; i++) {
        if (spf[i] == i) {
            for (int j = i * i; j <= n; j += i) {
                if (spf[j] == j) spf[j] = i;
            }
        }
    }
    return spf;
}
vector<int> fatorar(int x, vector<int>& spf) {
    vector<int> fatores;
    while (x > 1) {
        fatores.push_back(spf[x]);
        x /= spf[x];
    }
    return fatores;
}  // O(log n) por fatoração, pré-processamento O(n log log n)

// POTÊNCIA RÁPIDA (exponenciação modular)
long long binpow(long long a, long long b, long long mod) {
    long long res = 1;
    while (b > 0) {
        if (b & 1) res = (res * a) % mod;
        a = (a * a) % mod;
        b >>= 1;
    }
    return res;
}  // O(log b)

// MMC e MDC
#include <numeric>
int mdc = gcd(12, 18);  // O(log min(a,b))
long long mmc = lcm(12, 18);  // O(log min(a,b))
// Implementação manual do MDC (C++14 ou anterior)
int mdc_manual(int a, int b) {
    while (b) { int t = b; b = a % b; a = t; }
    return a;
}

// COMBINAÇÃO (nCr) usando pré-computação de fatoriais
#include <vector>
vector<long long> fat, inv_fat;
const int MOD = 1e9 + 7;
long long binpow_mod(long long a, long long b, int mod) {
    long long res = 1;
    while (b) {
        if (b & 1) res = (res * a) % mod;
        a = (a * a) % mod;
        b >>= 1;
    }
    return res;
}
void precompute_fat(int n) {
    fat.resize(n + 1);
    inv_fat.resize(n + 1);
    fat[0] = 1;
    for (int i = 1; i <= n; i++) {
        fat[i] = (fat[i - 1] * i) % MOD;
    }
    inv_fat[n] = binpow_mod(fat[n], MOD - 2, MOD);
    for (int i = n - 1; i >= 0; i--) {
        inv_fat[i] = (inv_fat[i + 1] * (i + 1)) % MOD;
    }
}
long long nCr(int n, int r) {
    if (r < 0 || r > n) return 0;
    return fat[n] * inv_fat[r] % MOD * inv_fat[n - r] % MOD;
}  // O(n) pré-processamento, O(1) por consulta

// FLOYD-WARSHALL (menores caminhos entre todos os pares)
#include <vector>
#include <algorithm>
vector<vector<long long>> floyd(vector<vector<long long>>& dist) {
    int n = dist.size();
    vector<vector<long long>> d = dist;
    for (int k = 0; k < n; k++)
        for (int i = 0; i < n; i++)
            for (int j = 0; j < n; j++)
                if (d[i][k] < 1e18 && d[k][j] < 1e18)
                    d[i][j] = min(d[i][j], d[i][k] + d[k][j]);
    return d;
}  // O(V³)

// BELLMAN-FORD (menor caminho com pesos negativos)
#include <vector>
#include <climits>
struct Aresta { int u, v, peso; };
vector<int> bellmanFord(int n, vector<Aresta>& arestas, int src) {
    vector<int> dist(n, INT_MAX);
    dist[src] = 0;
    for (int i = 0; i < n - 1; i++) {
        for (auto& [u, v, w] : arestas) {
            if (dist[u] != INT_MAX && dist[u] + w < dist[v])
                dist[v] = dist[u] + w;
        }
    }
    // Verifica ciclo negativo
    for (auto& [u, v, w] : arestas) {
        if (dist[u] != INT_MAX && dist[u] + w < dist[v])
            return {};  // ciclo negativo detectado
    }
    return dist;
}  // O(V * E)

// KOSARAJU (componentes fortemente conectadas - SCC)
#include <vector>
#include <stack>
void kosaraju_dfs(int u, vector<vector<int>>& grafo,
                  vector<bool>& vis, stack<int>& st) {
    vis[u] = true;
    for (int v : grafo[u]) if (!vis[v]) kosaraju_dfs(v, grafo, vis, st);
    st.push(u);
}
void kosaraju_dfs2(int u, vector<vector<int>>& grafo_rev,
                   vector<bool>& vis, vector<int>& comp) {
    vis[u] = true;
    comp.push_back(u);
    for (int v : grafo_rev[u]) if (!vis[v]) kosaraju_dfs2(v, grafo_rev, vis, comp);
}
vector<vector<int>> kosaraju(int n, vector<vector<int>>& grafo) {
    vector<vector<int>> grafo_rev(n);
    for (int u = 0; u < n; u++)
        for (int v : grafo[u]) grafo_rev[v].push_back(u);
    vector<bool> vis(n, false);
    stack<int> st;
    for (int i = 0; i < n; i++)
        if (!vis[i]) kosaraju_dfs(i, grafo, vis, st);
    fill(vis.begin(), vis.end(), false);
    vector<vector<int>> sccs;
    while (!st.empty()) {
        int u = st.top(); st.pop();
        if (!vis[u]) {
            vector<int> comp;
            kosaraju_dfs2(u, grafo_rev, vis, comp);
            sccs.push_back(comp);
        }
    }
    return sccs;
}  // O(V + E)

// TARJAN (SCC - alternativa mais compacta)
#include <vector>
#include <stack>
#include <algorithm>
vector<int> idx, low, on_stack;
vector<vector<int>> sccs;
stack<int> st;
int timer = 0;
void tarjan_dfs(int u, vector<vector<int>>& grafo) {
    idx[u] = low[u] = timer++;
    st.push(u);
    on_stack[u] = 1;
    for (int v : grafo[u]) {
        if (idx[v] == -1) {
            tarjan_dfs(v, grafo);
            low[u] = min(low[u], low[v]);
        } else if (on_stack[v]) {
            low[u] = min(low[u], idx[v]);
        }
    }
    if (low[u] == idx[u]) {
        vector<int> comp;
        while (true) {
            int v = st.top(); st.pop();
            on_stack[v] = 0;
            comp.push_back(v);
            if (v == u) break;
        }
        sccs.push_back(comp);
    }
}
vector<vector<int>> tarjan(int n, vector<vector<int>>& grafo) {
    idx.assign(n, -1);
    low.assign(n, 0);
    on_stack.assign(n, 0);
    sccs.clear();
    timer = 0;
    for (int i = 0; i < n; i++)
        if (idx[i] == -1) tarjan_dfs(i, grafo);
    return sccs;
}  // O(V + E)

// TOPOLOGICAL SORT (Kahn - ordenação topológica em DAG)
#include <queue>
#include <vector>
vector<int> topologicalSort(int n, vector<vector<int>>& grafo) {
    vector<int> grau(n, 0);
    for (int u = 0; u < n; u++)
        for (int v : grafo[u]) grau[v]++;
    queue<int> q;
    for (int i = 0; i < n; i++)
        if (grau[i] == 0) q.push(i);
    vector<int> ordem;
    while (!q.empty()) {
        int u = q.front(); q.pop();
        ordem.push_back(u);
        for (int v : grafo[u]) {
            if (--grau[v] == 0) q.push(v);
        }
    }
    return ordem.size() == n ? ordem : vector<int>();
}  // O(V + E)
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
