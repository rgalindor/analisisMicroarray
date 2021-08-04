filosos<-list.files(pattern="READY")
ntf<-c(4,5,4,4,5,5,5,4,4,4,4,4,4,4,5,4,4,4)
ngen<-c(25,69,110,19,57,33,52,10,125,38,21,52,34,94,47,21,29,78)
j<-c(1,1,1,2,2,3,3,3,4,4,5,5,6,6,7,7,8,8)
#variables j es el experimento, ntf num de tf, ngen numero de genes
#for (j in 1:length(filosos)){
	#conectividad<-c(conectividad,sum(calador)/length(calador))
#}
############################################PRIMERA PRUEBA BERNOULLI Y BINOMIAL
probab<-NULL
for(h in 1:length(ntf)){
calador<-NULL
conectividad<-NULL
	calador<-as.matrix(read.table(filosos[j[h]], header=TRUE, row.names=1, sep=";", quote = "\""))
	ayudante<-NULL
	conectividad<-sum(calador)/length(calador)
proba<-(choose(length(row.names(calador)),ntf[h]))*(((conectividad^ngen[h])*(1-conectividad)^(length(colnames(calador))-ngen[h]))^ntf[h])*((1-((conectividad^ngen[h])*(1-conectividad)^(length(colnames(calador))-ngen[h])))^((length(row.names(calador)))-ntf[h]))
probab<-c(probab,proba)
}
###########################################SEGUNDA PRUEBA
probab<-NULL
for(h in 1:length(ntf)){
calador<-NULL
conectividad<-NULL
	calador<-as.matrix(read.table(filosos[j[h]], header=TRUE, row.names=1, sep=";", quote = "\""))
	ayudante<-NULL
	conectividad<-sum(calador)/length(calador)
proba<-(choose(length(row.names(calador)),ntf[h]))*(((conectividad^ngen[h])*(1-conectividad)^(length(colnames(calador))-ngen[h]))^ntf[h])
probab<-c(probab,proba)
}

##########################################
combi<-choose(length(row.names(calador)),ntf)
conec<-((conectividad^ngen)*(1-conectividad)^(length(colnames(calador))-ngen))^ntf
noconec<-

	for (i in 1:length(rownames(calador))){
		ayudante<-c(ayudante,paste(rownames(calador)[i],"(",sum(calador[i,]),")", sep=""))
	}


