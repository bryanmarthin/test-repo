library(ggplot2)

fun2 <- function(x) 2-(x/3)
fun3 <- function(x) 4-x
fun4 <- function(x) 6
fun5 <- function(x) 4

funcircle <- function(x,center = c(0,0),r = sqrt(9), npoints = 100)  {
  
  ycircle <- sqrt(-(x**2)+(r**2))
  
  return(ycircle)
}

x1 = seq(0,4)
x2 = seq(0,4,by=1/10000)

mydf = data.frame(x1, y2=fun2(x1),y3= fun3(x1),y4=fun4(x1),y5=fun5(x1),ycircle=funcircle(x2))
mydf <-  transform(mydf, z = pmax(y2,y3,y5))
mydf <-  transform(mydf, zmin = pmax(y2,y3))
ggplot(mydf) + 
  geom_ribbon(aes(x=x1,ymin=zmin,ymax = z), fill = 'yellow1')+
  geom_line(aes(x = x1,y = y2), colour = 'black') +
  geom_line(aes(x = x1,y = y3), colour = 'black') +
  geom_line(aes(x = y4, y=x1), colour = 'black')+
  geom_line(aes(x = x1, y=y5), colour = 'black')+
  geom_line(aes(x = x2, y=ycircle), colour = 'black',linetype=2)+
  xlim(0,4) + ylim(0,4) + labs(x = "x", y = "y")
  
