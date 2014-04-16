# Repositório com arquivos R para a modelagem de tópicos (topic modelling).

Aqui estão os códigos necessários para fazer uma modelagem de tópicos com o uso do R utilizando a biblioteca ``topicmodels`` para a modelagem do LDA e ``tm`` para o pré-processamento do texto e criação do corpus.

## Passo a passo para a modelagem.

### 1. Fornecer uma caminho onde estejam todos os textos (em arquivo .txt) dentro, ler os arquivos e instalar os pacotes necessários.
```
source('funcoes_uteis.R')
check.packages()

diretorio <- 'textos' 
textos <- leTexto('textos/') # path para pasta onde vai ler os .txts
```

 ### 2. Pre-processar os textos (remoção de pontuação, stopwords, etc...)
 ```
textos<-criaCorpus(textos) # Cria um corpus
textos<-trataCorpus(textos) # remove pontuação, stopwords, ...
 ```
 
 ## 3. Fazer o LDA e explorá-lo
 ```
ntopics <- 30
LDA <- fazLDA(textos, ntopics) 

top10_termos <- terms(LDA, 10) # Vê o top 10 termos de cada um dos tópicos
 ```
