#data frame 'datacovid' merupakan data lengkap dari KawalCOVID19
library(dplyr)
library(easynls)
modelcovid<-datacovid %>% 
  select(Waktu,`Jumlah Kasus`)
modelcovid[,1]<-1:48
modelcovid<-as.data.frame(modelcovid)
#regresi eksponensial
grafik<-nlsfit(modelcovid,model=6,c(a=2,b=0.15))
grafik
plot<-nlsplot(modelcovid,model=6,c(a=2,b=0.15),xlab='Hari',ylab='Jumlah Kasus')
