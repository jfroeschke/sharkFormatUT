### Format Shark Data 
### 4/11/2022
### code and data here: https://github.com/jfroeschke/sharkFormatUT

library(doBy)
library(reshape2)

df <- read.csv("s2007.csv")

##
colnames(df)
length(unique(df$decimalLatitude))
length(unique(df$decimalLongitude))
length(unique(df$vernacularName))
###
xy <- paste(df$decimalLatitude, df$decimalLongitude, sep=",")
length(unique(xy))


df2 <- summaryBy(vernacularName ~ decimalLongitude + decimalLatitude + genus +  specificEpithet, FUN=length, data=df,
                 var.names="vernacularName")


df3 <- summaryBy(genus +  specificEpithet ~ decimalLongitude + decimalLatitude + vernacularName, FUN=length, data=df,
                 var.names="vernacularName")

df4 <- dcast(df3, decimalLongitude + decimalLatitude ~ vernacularName, sum, value.var = "genus.length", fill=0)

write.csv(df4, "s2007out.csv", row.names=FALSE)
######## repeat for 2009

df <- read.csv("s2009.csv")

##
colnames(df)
length(unique(df$decimalLatitude))
length(unique(df$decimalLongitude))
length(unique(df$vernacularName))
###
xy <- paste(df$decimalLatitude, df$decimalLongitude, sep=",")
length(unique(xy))


df2 <- summaryBy(vernacularName ~ decimalLongitude + decimalLatitude + genus +  specificEpithet, FUN=length, data=df,
                 var.names="vernacularName")


df3 <- summaryBy(genus +  specificEpithet ~ decimalLongitude + decimalLatitude + vernacularName, FUN=length, data=df,
                 var.names="vernacularName")

df4 <- dcast(df3, decimalLongitude + decimalLatitude ~ vernacularName, sum, value.var = "genus.length", fill=0)

write.csv(df4, "s2009out.csv", row.names=FALSE)