#Exploratory Texas Stuff
#2018-02

#input data
rawdata<-read.csv("JNandMLMPAustHouDall.csv", header=T, colClasses=c("factor",  "factor", "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
rawdata$Region<-rawdata$Site
rawdata$Site<-as.numeric(c(1:nrow(rawdata)))

#calculate cumulative precip
rawdata$cumJan1<-rawdata$Jan1.15
rawdata$cumJan16<-rawdata[,4]+rawdata[,5]
rawdata$cumFeb1<-rawdata[,4]+rawdata[,5]+rawdata[,6]
rawdata$cumFeb16<-rawdata[,4]+rawdata[,5]+rawdata[,6]+rawdata[,7]
rawdata$cumMar1<-rawdata[,4]+rawdata[,5]+rawdata[,6]+rawdata[,7]+rawdata[,8]
rawdata$cumMar16<-rawdata[,4]+rawdata[,5]+rawdata[,6]+rawdata[,7]+rawdata[,8]+rawdata[,9]
cumdata<-c(rawdata$cumJan1,rawdata$cumJan16,rawdata$cumFeb1,rawdata$cumFeb16,rawdata$cumMar1,rawdata$cumMar16)

#summary(rawdata)
longdata<-reshape(rawdata, direction = "long", varying = list(names(rawdata)[4:9]), v.names = "Value", 
        idvar = c("Site","Metric","Year"))
longdata<-longdata[,c(1,10,2,3,11:12)]
names(longdata)[6]<-"biweeklyVal"
timepds<-names(rawdata)[4:9]
longdata$period<-timepds[longdata$time]
#Add cumulative data to long form data
longdata$cumValue<-cumdata


#plot
par(mar = c(5, 4, 4, 4) + 0.3)  # Leave space for z axis

plot(longdata$time[longdata$Metric=="NDVI"], longdata$cumValue[longdata$Metric=="NDVI"]) # first plot
par(new = TRUE)
plot(longdata$time[longdata$Metric=="JN-Adult"],longdata$cumValue[longdata$Metric=="JN-Adult"], type = "p", axes = FALSE, bty = "n", xlab = "", ylab = "", col="blue")
axis(side=4, at = pretty(range(longdata$cumValue[longdata$Metric=="JN-Adult"])))




##Separate objects per metric - do we need this?
#txNDVI<-longdata[longdata$Metric=="NDVI",]
#jnAdult<-longdata[longdata$Metric=="JN-Adult",]
#jnEgg<-longdata[longdata$Metric=="JN-Egg",]
#jnMWeed<-longdata[longdata$Metric=="JN-MW",]

