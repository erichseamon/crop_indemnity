setwd("/git/data/USDA/zip")
path <- setwd("/git/data/USDA/zip")


myfiles <- list.files(path = path, pattern = ".csv",  full.names = FALSE)

USDAarchive <- do.call("rbind", lapply(myfiles, read.csv, header = FALSE))

multmerge = function(mypath){
  filenames=list.files(path=mypath, full.names=TRUE)
  datalist = lapply(filenames, function(x){read.csv(file=x,header=T)})
  Reduce(function(x,y) {merge(x,y)}, datalist)