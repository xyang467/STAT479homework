# Sherry Yang xyang467@wisc.edu
rm(list=ls())
require("FITSio")
df =  data.frame(matrix(ncol = 3, nrow = 100))
colnames(df) <- c('distance', 'spectrumID', 'i')
df$spectrumID = list.files("data")

target = readFrameFromFITS("cB58_Lyman_break.fit")
Y = target$FLUX
n = length(Y)

filelist = file.path("data",list.files("data"))
max_corr = c()
index = c()
for (i in 1:100){
  sample = readFrameFromFITS(filelist[i])
  len_s = length(sample$flux)
  corr = c()
  for (j in 1:(len_s-n+1)){
    x = sample$flux[j:(j+n-1)]
    corr = append(corr,cor(x,Y))
  }
  index = append(index,order(corr,decreasing = T)[1])
  max_corr = append(max_corr,max(corr))
}

df$distance = 100/max_corr
df$i = index
df = df[order(df$distance),]
write.csv(df,"hw2.csv",row.names = F)
