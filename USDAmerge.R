#-------------
#    author: Erich Seamon
#    script: USDAmerge.R
#    description:  merges many csv files
#
#-----------

setwd("/git/data/USDA/zip")
path <- setwd("/git/data/USDA/zip")
myfiles <- list.files(path = path, pattern = ".csv",  full.names = FALSE)
myfiles_stripped <- data.frame(myfiles)
myfilesnumber <- nrow(myfiles_stripped)

myfiles_stripped$myfiles = substr(myfiles,1,nchar(myfiles)-4)


for (i in 1:myfilesnumber){
  filename <- paste("/home/git/data/USDA/zip/", myfiles[i], sep="")
  file <- read.csv(filename, header=FALSE)
  assign(paste("croploss_", myfiles_stripped[i,], sep=""), file)
}  

croploss <- rbind(croploss_1989, croploss_1990, croploss_1991, croploss_1992, croploss_1993, croploss_1994, croploss_1995, croploss_1996, croploss_1997, croploss_1998, croploss_1999, croploss_2000, croploss_2001, croploss_2002, croploss_2003, croploss_2004, croploss_2005, croploss_2006, croploss_2007, croploss_2008, croploss_2009, croploss_2010, croploss_2011, croploss_2012, croploss_2013, croploss_2014, croploss_2015)


#multmerge = function(mypath){
#  filenames=list.files(path=mypath, full.names=TRUE)
#  datalist = lapply(filenames, function(x){read.csv(file=x,header=T)})
#  Reduce(function(x,y) {merge(x,y)}, datalist)
#}
