#Make a structure like plot from a matrix in ggplot.

library(ggplot2)
library(dplyr)
library(data.table)
library(reshape2)

K4<-read.csv2("K4grapheStructure.txt",dec=".",header=TRUE,sep="\t")
K4

K4melt<-reshape2::melt(K4,id.vars='Individu')
K4melt
ggplot(K4melt)+geom_bar(aes(x=Individu,y=value,fill=variable),position="fill",stat="identity")+scale_fill_manual(values=c("red","green","blue","violet"))
poplist.names<-c(rep("NO",45),rep("DK",50),rep("NL",49),rep("FR-LR",50),rep("GB",52),rep("FR-LB",50),rep("FR-Aix",50),rep("PT",30),rep("ES",35),rep("FR-FsM",50),rep("FR-Co",44),rep("IT",48),rep("TR",29),rep("UA",35))
print(poplist.names)
poplist.names2<-c(rep(poplist.names,4))
K4melt2<-cbind(K4melt,poplist.names2)
K4melt2$poplist.names2<-factor(K4melt2$poplist.names2,levels=c("NO","DK","NL","GB","FR-LR","FR-Aix","FR-LB","PT","ES","FR-FsM","FR-Co","IT","TR","UA"))


t <- ggplot(K4melt2, aes(x=Individu, y=value, fill=variable))  + ylab("Assignment") +xlab("Population")
t <- t + geom_bar(stat='identity',width=1)
t <- t + scale_fill_manual(values = c("red","green","blue","violet"),name="cluster") 
t <- t + facet_grid(~poplist.names2, scales = "free")
t <- t + theme_gray(base_size = 12) + guides(fill=guide_legend(ncol=1))
t <- t + theme(axis.text.x = element_blank(),axis.ticks = element_blank(),panel.spacing.x=unit(0.1, "lines"))
t
