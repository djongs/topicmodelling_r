source('funcoes_uteis.R') # Carrega as funções úteis

# Vê se os pacotes estão instalados e carrega/instala
check.packages()

# Pré-processamento
textos<-leTexto('.') # path para pasta onde vai ler os .txts
textos<-criaCorpus(textos) # Cria um corpus
textos<-trataCorpus(textos) # remove pontuação, stopwords, ...

# Modelagem
LDA<-fazLDA(textos,30) 

palavras<-terms(LDA,10) # Vê top 10 termos de cada um dos tópicos

posterior <- posterior(LDA)
TOPICOS<-apply(posterior(LDA)$terms,2,function(vet)which.max(vet))
