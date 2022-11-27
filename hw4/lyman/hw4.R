rm(list=ls())
args = (commandArgs(trailingOnly=TRUE))
if(length(args) == 2){
  template = args[1]
  dir = args[2]
} else {
  cat('usage: Rscript hw4.R <template spectrum> <data directory>\n', file=stderr())
  stop()
}

if (!require("FITSio")) {
  print("Failed to load package FITSio.")  
}
len = length(list.files(dir))
df =  data.frame(matrix(ncol = 3, nrow = len ))
colnames(df) <- c('distance', 'spectrumID', 'i')
df$spectrumID = list.files(dir)[1:len]

target = readFrameFromFITS(template)
Y = target$FLUX
n = length(Y)

filelist = file.path(dir,list.files(dir))
max_corr = c()
index = c()
for (i in 1:len){
  sample = readFrameFromFITS(filelist[i])
  len_s = length(sample$flux)
  corr = c()
  if (len_s >n){
    for (j in 1:(len_s-n+1)){
      x = sample$flux[j:(j+n-1)]
      corr = append(corr,cor(x,Y))
    }
  }else{
    corr = append(corr,0.00001)
  }
  index = append(index,order(corr,decreasing = T)[1])
  max_corr = append(max_corr,max(corr))
}

df$distance = 100/max_corr
df$i = index
df = df[df$distance >= 0, ]
df = df[order(df$distance),]
df = na.omit(df)
write.csv(df,paste(dir,".csv",sep=""),row.names = F)
