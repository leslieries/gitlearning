#Exploratory Texas Stuff
#2018-02

rawdata<-read.csv("JNandMLMPAustHouDall.csv", header=T, colClasses=c("factor",  "factor", "numeric","numeric","numeric","numeric","numeric","numeric"))

#rawdata[,c(4:9)]<-as.numeric((rawdata[,c(4:9)]))
rawdata$cumJan1<-rawdata$Jan1.15
rawdata$cumJan16<-rawdata[,4]+rawdata[,5]
rawdata$cumFeb1<-rawdata[,4]+rawdata[,5]+rawdata[,6]
rawdata$cumFeb16<-rawdata[,4]+rawdata[,5]+rawdata[,6]+rawdata[,7]
rawdata$cumMar1<-rawdata[,4]+rawdata[,5]+rawdata[,6]+rawdata[,7]+rawdata[,8]
rawdata$cumMar16<-rawdata[,4]+rawdata[,5]+rawdata[,6]+rawdata[,7]+rawdata[,8]+rawdata[,9]

#cumFeb1
#cumFeb16
#cumMar1
#cumMar16




txNDVI<-rawdata[rawdata$Metric=="NDVI",]
jnAdult<-rawdata[rawdata$Metric=="JN-Adult",]
jnEgg<-rawdata[rawdata$Metric=="JN-Egg",]
jnMWeed<-rawdata[rawdata$Metric=="JN-MW",]

