check.packages <- function()
{
    packages <- c('topicmodels', 'tm', 'lsa')
    installed <- installed.packages()
    exc <- names(packs[,'Package'])
    ins <- av[!av %in% exc]
    install.packages(ins)
    require(packages)
}


leTexto<-function(nome_diretorios) # função para ler os textos. WD tem que estar no diretório onde estão os textos, em .txt.
{
	lista_txt<-list()
	oldwd<-getwd()
	for(dirs in nome_diretorios)
	{
		newwd<-paste(getwd(),dirs,sep="/")	
		setwd(newwd)
	
		txt.files<-list.files()
		lista_txt[[dirs]]<-sapply(txt.files,function(x)paste(readLines(x),collapse=" "))

		setwd(oldwd)
	}
	return(data.frame(unlist(lista_txt)))
}


criaCorpus<-function(dataframe_texto) # Função para criar o corpus
{
	dataframe_texto<-Corpus(DataframeSource(dataframe_texto)) # Criando o corpus
	return(dataframe_texto)
}

trataCorpus<-function(corpusTxt)
{
	corpusTxt<- tm_map(corpusTxt,removePunctuation)
	corpusTxt<- tm_map(corpusTxt,tolower)
	corpusTxt<- tm_map(corpusTxt,removeNumbers)
	corpusTxt<- tm_map(corpusTxt, function(x){removeWords(x,stopwords("portuguese"))})	
	corpusTxt<- tm_map(corpusTxt, function(x){removeWords(x,stopwords("portuguese"))})	

	remover<-c('conta','caso','','','neste','além','deu','após','fit','sabe','nesta','feita','algum','nesse','uso','apenas','pro','uso','the','tão','vem','logo','fica','ainda','segundo','sobre','ter','disse','dar','cerca','todo','pois','sido','disso','mostra','new','uol','dessas','tanto')

	corpusTxt<- tm_map(corpusTxt, function(x){removeWords(x,remover)})	
	
	return(corpusTxt)
}


fazLDA<-function(corpusTxt,topicos)
{
	matriz_textos<-t(criaMatriz_Termo_Documento(textos))
	return(LDA(matriz_textos,method="VEM",k=topicos))
}

