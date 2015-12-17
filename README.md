# brthesis

AINDA NÃO FOI TESTADA!

Essa é uma personalização da classe [abntex2][abntex2] para uma universidade brasileira. Como essa é uma versão não-oficial, eu não quero associar este projeto ao nome da instituição. Além disso, as características de `brthesis` devem ser claras e podem ser usados por alunos de outras instituições.

Essa classe foi desenvolvida para dissertações e teses. As suas características são as seguintes:

* Uso do pacote `abntex2cite` com a opção alfabética
* Margem esquerda de 2,5 cm
* Margem direita de 1,5 cm
* Margem superior de 2,0 cm
* Margem inferior de 1,5 cm
* Indentação do parágrado de 1,0 cm
* Sem espeçamento entre parágrados
* Espaçamento entre-linhas 1,5
* Impressão em ambos os lados
* Os títulos dos capítulos são formatados em caixa alta
* Os títulos de seções são formatados em negrito
* Os títulos de subseções são formatados em itálico

Alguns pacotes comuns em produções científicas, especialmente na área de engenharia, são carregados. Todos eles podem ser instalados pelo [TeX Live][texlive].


## Instalação

Clone esse repositório para uma pasta dentro do seu projeto, e declasse a classe como `\documentclass{brthesis/brthesis}`

[abntex2]: http://www.abntex.net.br/
[texlive]: https://www.tug.org/texlive/
