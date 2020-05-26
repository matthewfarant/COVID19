library(deSolve)
#SIR Function
SIR<- function(time,state,parameters){
  with(as.list(c(state,parameters)),{
    dS<- -beta * S * I
    dI<- beta * S * I - gamma * I
    dR<- gamma*I
    return(list(c(dS,dI,dR)))
  })
}
#Set Parameters
init<- c(S=22834,I=4241,R=732)
parameters<-c(beta=0.1354,gamma=0.088)
times<-0:60
#Solve using ODE
out<-ode(y=init,times=times,func=SIR,parms=parameters)
#change to data frame
out<-as.data.frame(out)
#delete time variable
out$time<-NULL
#Show data
head(out,10)
#plot
matplot(x=times,y=out,type="l",
        xlab='Time', ylab='Susceptible and Recovered', main='SIR Model',
        lwd=1, lty=1, bty='l',col=2:4)
