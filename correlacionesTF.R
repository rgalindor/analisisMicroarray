nombres<-list.files ("yeastractOut/", pattern="RegulationTwo")
cutados<-0
tablas<-rep(0,length(nombres))
covarTF<-0
covarORF<-0
correTF<-0
correORF<-0
for(i in 1:length(nombres)){
	cutados[i]<-strsplit(strsplit(nombres[i], "tial_")[[1]][2],".ts")[[1]][1]
	tablas[i]<-table(read.table(paste("yeastractOut/",nombres[i],sep="")))
	covarTF[i]<-cov(t(tablas[i]))
	covarORF[i]<-cov(tablas[i])
	correTF[i]<-cor(t(tablas[i]))
	correORF[i]<-cor(tablas[i])
}


table(read.table(paste("yeastractOut/",nombres[1],sep="")))

