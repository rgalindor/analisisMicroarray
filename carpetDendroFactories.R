filosos<-list.files(pattern="READY")
calador<-NULL
for (j in 1:length(filosos)){
	calador<-as.matrix(read.table(filosos[j], header=TRUE, row.names=1, sep=";", quote = "\""))
	ayudante<-NULL
	for (i in 1:length(rownames(calador))){
		ayudante<-c(ayudante,paste(rownames(calador)[i],"(",sum(calador[i,]),")", sep=""))
	}
	rownames(calador)<-ayudante
	png(file=paste(filosos[j],"png", sep="."), width=1400, height=1400)
	plot(hclust(dist(calador),"average"), cex=0.75, xlab="TF", main="Agrupamiento")
	dev.off()

cadena<-NULL
for(k in 1:length(calador[,1])){
	mazar<-rbinom(length(calador[k,]),1,mean(calador[k,]))
	cadena<-c(cadena,mazar)
}
helpy<-t(matrix(cadena,length(colnames(calador)),length(row.names(calador))))
rownames(helpy)<-rownames(calador)
for(m in 1:1000){
	cadena<-NULL
	for(k in 1:length(calador[,1])){
		mazar<-rbinom(length(calador[k,]),1,mean(calador[k,]))
		cadena<-c(cadena,mazar)
	}
	cadena<-t(matrix(cadena,length(colnames(calador)),length(row.names(calador))))
	helpy<-(helpy+cadena)/2
}
png(file=paste(filosos[j],"_ctrl.png", sep=""), width=1400, height=1400)
plot(hclust(dist(helpy),"average"),xlab="TF",main="Control")
dev.off()
}
