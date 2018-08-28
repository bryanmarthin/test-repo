library(ggplot2)

fun2 <- function(x) 110 -x
fun3 <- function(x) 200 -4*x
fun4 <- function(x) 75
fun5 <- function(x) 100
x1 = seq(0,100)

mydf = data.frame(x1, y2=fun2(x1),y3= fun3(x1),y4=fun4(x1),y5=fun5(x1))
mydf <-  transform(mydf, z = pmax(y2,y3,pmin(y4,y5)))
ggplot(mydf) + 
  geom_line(aes(x = x1,y = y2), colour = 'green') +
  geom_line(aes(x = x1,y = y3), colour = 'red') +
  geom_line(aes(x = y4, y=x1), colour = 'black')+
  geom_line(aes(x = x1, y=y5), colour = 'black')+
  xlim(0,100) + ylim(0,100)
