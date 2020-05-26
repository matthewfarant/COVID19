library(dplyr)
library(ggplot2)
library(tidyr)
library(ggthemes)
library(ggpubr)
View(datacorona)
datacorona1<-gather(datacorona)
datacorona2<-datacorona1 %>% 
  filter(key!='Waktu')
View(datacorona2)
datacorona2<-datacorona2 %>% 
  filter(key!="Kasus Baru") %>% 
  filter(key!="Sembuh Baru") %>% 
  filter(key!="Meninggal Baru")
waktu<-rep(1:48,3)
datacorona2<-cbind(waktu,datacorona2)
#Line Chart
plotA<-ggplot(datacorona2)+
  geom_line(aes(waktu,value,group=key,col=key))+
  xlab('Hari ke-')+
  ylab('Jumlah Orang\n')+
  labs(title='COVID-19 Line Chart', subtitle='Source: Kawalcovid19', col='')+
  theme_economist()+
  scale_color_economist()+
  theme(legend.position = 'bottom',legend.text = element_text(size=10))
#LOESS
plotB<-ggplot(datacorona2)+
  geom_point(aes(waktu,value,group=key,col=key))+
  stat_smooth(method='loess',aes(waktu,value,group=key,col=key),se=T)+
  xlab('Hari ke-')+
  ylab('Jumlah Orang\n')+
  labs(title='COVID-19 Curve Fitting', subtitle='LOESS Method',col="")+
  theme_economist()+
  scale_colour_economist()+
  theme(legend.position = 'bottom',legend.text = element_text(size=10))
ggarrange(plotA,plotB)