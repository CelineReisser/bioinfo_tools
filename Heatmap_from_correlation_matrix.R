###############################################
##  Heatmap plot of the modelled dispersion  ##
###############################################
# Reisser et al 2020. 



ls()
rm(ls())

library(ggplot2)
library(ggpubr)

# Change working directory to source file location



# Load the dataset Table 4a
data<-read.table("Table4a.txt",header=T)
data
#log tranform data:
#data2<-(-(log(data)))
data2<-data
data2
data2<-as.matrix(data2)
data2

# transform data to fit ggplot:
input<-as.data.frame(cbind(as.vector(data2),c(rep("HAH",20),rep("HEK",20),rep("MAU",20),rep("OAK",20),rep("RUS",20),rep("TAP",20),rep("TAU",20),rep("WEL",20),rep("WHA",20),rep("BOA",20),rep("DAY",20),rep("DEN",20),rep("MEY",20),rep("MIL",20),rep("EGE",20),rep("SC",20),rep("LR",20),rep("MLL",20),rep("BR",20),rep("TP",20)),c(rep(colnames(data2),20))))
#input<-as.data.frame(cbind(as.vector(data2),c(rep("SC",13),rep("LR",13),rep("MLL",13),rep("BR",13),rep("TP",13),rep("KI",13),rep("TAP",13),rep("WHA+RUS",13),rep("TAU",13),rep("OAK",13),rep("HAH",13),rep("MAU",13),rep("WEL",13)),c(rep(colnames(data2),13))))
input
names(input)<-c("count","source","sink")
input$source<-factor(input$source,levels=c("SC","LR","MLL","BR","TP","BOA","DAY","DEN","MEY","MIL","EGE","TAP","WHA","RUS","TAU","OAK","HEK","HAH","MAU","WEL"))
input$sink<-factor(input$sink,levels=c("SC","LR","MLL","BR","TP","BOA","DAY","DEN","MEY","MIL","EGE","TAP","WHA","RUS","TAU","OAK","HEK","HAH","MAU","WEL"))

# Plot the heatmap with geom_tile:
p<-ggplot(input,aes(x=sink,y=source)) +geom_tile(aes(fill=as.numeric(as.character(count)))) + scale_fill_gradient(low="antiquewhite",high="brown",na.value ="white",limits=c(0,1))
p<-p+ labs(fill="Relative migration") +theme(legend.position="right",axis.text.x = element_text(angle=90, hjust=0.5))
p

###################################################################################
# Load the dataset Table 4b
data<-read.table("Table4b.txt",header=T)
data
#log tranform data:
#data2<-(-(log(data)))
data2<-data
data2
data2<-as.matrix(data2)
data2

input<-as.data.frame(cbind(as.vector(data2),c(rep("AUSmain",4),rep("TAS",4),rep("KERM",4),rep("NZmain",4)),c(rep(colnames(data2),4))))
input
names(input)<-c("count","source","sink")
input$source<-factor(input$source,levels=c("AUSmain","TAS","KERM","NZmain"))
input$sink<-factor(input$sink,levels=c("AUSmain","TAS","KERM","NZmain"))

# Plot the heatmap with geom_tile:
q<-ggplot(input,aes(x=sink,y=source)) +geom_tile(aes(fill=as.numeric(as.character(count)))) + scale_fill_gradient(low="antiquewhite",high="brown",na.value ="white",limits=c(0,1))
q<-q+ labs(fill="Relative migration") +theme(legend.position="none",axis.text.x = element_text(angle=90, hjust=0.5))
q

######################################################################################################
# Load the dataset Table 4c
data<-read.table("Table4c.txt",header=T)
data
#log tranform data:
#data2<-(-(log(data)))
data2<-data
data2
data2<-as.matrix(data2)
data2

input<-as.data.frame(cbind(as.vector(data2),c(rep("AUS",2),rep("NZ",2)),c(rep(colnames(data2),2))))
input
names(input)<-c("count","source","sink")
input$source<-factor(input$source,levels=c("AUS","NZ"))
input$sink<-factor(input$sink,levels=c("AUS","NZ"))

# Plot the heatmap with geom_tile:
r<-ggplot(input,aes(x=sink,y=source)) +geom_tile(aes(fill=as.numeric(as.character(count)))) + scale_fill_gradient(low="antiquewhite",high="brown",na.value ="white",limits=c(0,1))
r<-r+ labs(fill="Relative migration") +theme(legend.position="none",axis.text.x = element_text(angle=90, hjust=0.5))
r

ggarrange(p,q,r,labels=c("A","B","C"),ncol=1,nrow=3,heights = c(4, 2, 1.5))

