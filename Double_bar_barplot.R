
# Create double bar graph from matrix

# Avoir le tableau sous le bon format: exemple
Hetero<-read.csv2("N:/sylvie/Publi commune/FICHIERS et FIGURES DEFINITIVES/Heterozygotie/Hetero.csv", dec=",",header=TRUE)
#Hetero<-read.csv2("Hetero.csv", dec=",",header=TRUE)

Hetero

# Transformer Populaton en facteur avec un niveau unique qui garde l'odre de mes populations
Hetero$Population<-factor(Hetero$Population,levels=unique(Hetero$Population))
Hetero$Population

#Faire le graphique sans fond avec mes couleurs
windows()
cols<-c("black","grey")
#ggplot(Hetero,aes(fill=Estimation,x=Population,y=Heterozygotity))+scale_fill_manual(values=cols)+geom_bar(position="dodge",stat="identity")+theme_classic(base_size=14)

p<-ggplot(Hetero,aes(fill=Estimation,x=Population,y=Heterozygotity))+scale_fill_manual(values=cols)+geom_bar(position="dodge",stat="identity")
p<-p+ theme(text = element_text(size=16),axis.text.x = element_text(angle=90, hjust=0.5),panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"))
p

#J'ai ensuite enregistr? le graphique en format .png dans le m?me r?pertoire que celui du fichier de d?part
