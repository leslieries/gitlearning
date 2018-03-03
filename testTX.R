#Exploratory Texas Stuff
#2018-02

rawdata<-read.csv("JNandMLMPAustHouDall.csv", header=T, colClasses=c("factor",  "factor", "numeric","numeric","numeric","numeric","numeric","numeric"))

#rawdata[,c(4:9)]<-as.numeric((rawdata[,c(4:9)]))
rawdata$cumJan1<-rawdata$Jan1.15
rawdata$cumJan16<-sum(rawdata$Jan1.15,rawdata$Jan16.31)
rawdata$cumFeb1<-sum(rawdata$cuJan16,rawdata$Feb1.15)
rawdata$cumFeb16<-sum(rawdata$Jan1.15,rawdata$Jan16.31)

cumFeb1
cumFeb16
cumMar1
cumMar16




txNDVI<-rawdata[rawdata$Metric=="NDVI",]
jnAdult<-rawdata[rawdata$Metric=="JN-Adult",]
jnEgg<-rawdata[rawdata$Metric=="JN-Egg",]
jnMWeed<-rawdata[rawdata$Metric=="JN-MW",]

