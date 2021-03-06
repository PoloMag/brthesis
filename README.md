# brthesis

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

Existem três opções possíveis:

1. Se você sabe trabalhar com `git`, clone esse repositório para uma pasta dentro do seu projeto, e declasse a classe como `\documentclass{brthesis/brthesis}` (acho que você pode seguramente ignorar a advertência de que a classe é declarada como `brthesis` e não `brthesis/brthesis`)
2. Faça um download desse repositório como arquivo zip e copie o arquivo `brthesis.cls` para dentro do seu projeto e use `\documentclass{brthesis}`.
3. Consulte a documentação do seu sistema TeX sobre "como instalar classes e pacotes".

## Uso

Veja os arquivos `example.tex` e `exemplo.tex` para templates básicos de teses relativamente completas. Algumas explicações seguem abaixo.

(Substitua `brthesis` por `brthesis/brthesis` conforme instruções acima).

### Tamanho de papel

`brthesis` suporta duas construções comuns no meu trabalho. Para imprimir em A4 **e** simultaneamente usar fonte 12pt:

	\documentclass[a4]{brthesis}

Para imprimir A5 e, condizente com o tamanho menor, imprimir em 10pt:

	\documentclass[a5]{brthesis}

Note que as opções são diferentes dos usuais `a4paper` e `a5paper` porque, como falei, as opções de `brthesis` automaticamente ajustam o tamanho da fonte para melhor resultados.

Se você não declarar nada, o padrão da classe `abntex2` será usado: tamanho A4 mas com fonte 10pt.

Obs: minha universidade pede que os documentos sejam impressos em tamanho A5 e fonte 10,5pt. Não consegui achar uma maneira segura de especificar esses tamanhos arbitrários nas instalações comuns de LaTeX e portanto optei por usar 10pt, considerando que a diferença é imperceptível. Se você sabe quiser usar `brthesis` e tiver o mesmo problema, faça-o por sua conta e risco.

### Idiomas

Para escrever em português (usando A4 como exemplo):

	\documentclass[a4,brazil]{brthesis}

Para escrever em inglês:

	\documentclass[a4,brazil,english]{brthesis}

Nota: não tenho certeza sobre isso, mas como essa classe é baseada em [abnTeX2][abntex2], acho que você precisa "carregar" a linguagem `brazil`, mesmo que você escreva todo o documento em inglês. Se você escrever apenas `\documentclass[english]{brthesis}`, a linguagem `brazil` vai ser carregada como a padrão (a última linguagem a ser declarada é a que vai ser usada), fazendo com que os títulos como "Lista de figuras" apareçam em português.

### Metadados e PDF

Veja nos arquivos de exemplos sobre como preencher o título, orientador etc. Veja a documentação da classe [abnTeX2][abntex2] sobre como usar essas informações para construir a folha de aprovação.

Um dos pontos centrais de `brthesis` é criar PDFs "inteligentes". Os dados de títulos e autor são gravados no próprio arquivo (consulte o menu *Propriedades* ou similar no seu editor de PDF). Além disso, a capa, as listas de figura, tabelas etc e os capítulos são incluídos nos *bookmarks* do PDF, desde que você utilize os comandos usados nos templates: `\printcover`, `\printtoc` etc.

Outra característica é que, com o pacote `hyperref`, é possível criar links de hipertexto dentro do documento. Para isso, em vez de usar os comandos usuais de referência como `\ref`, use `\autoref` para tudo que você for referenciar, sem precisar escrever o nome do elemento; por exemplo, em vez de escrever `ver Fig.~\ref{fig:1}`, escreva `ver \autoref{fig:1}` que o resultado será o mesmo. Com as customizações feitas por `brthesis`, `\autoref` produzirá "Fig. X", "Tab. X", "Eq. (X.Y)", "Cap. X", "Seção X" e correspondentes termos em inglês.

### Pasta com figuras

Para melhor organização de projetos, é possível incluir figuras dentro de uma pasta `fig` no seu projeto, e utilizar os comandos de figuras normalmente.

### Arquivos a serem incluidos

Veja os templates desse repositório como um lembrete de outros arquivos `.tex` a serem incluídos para uma tese mais completa.

### nomenclature

É incluído o pacote `nomencl` para produção da lista de símbolos. A ajuda do [abnTeX2][abntex2] contém informações de como utilizá-lo.


### Outras informações

Como já repetido, essa classe apenas configura as opções padrões do sistema [abnTeX2][abntex2], que deve ser consultado para mais informações.



[abntex2]: http://www.abntex.net.br/
[texlive]: https://www.tug.org/texlive/
