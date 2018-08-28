library(ggplot2)

fun2 <- function(x) 2-(x/3)
fun3 <- function(x) 4-x
fun4 <- function(x) 6
fun5 <- function(x) 4

circleFun <- function(center = c(0,0),diameter = 1, npoints = 100){
  r = diameter / 2
  tt <- seq(0,2*pi,length.out = npoints)
  xx <- center[1] + r * cos(tt)
  yy <- center[2] + r * sin(tt)
  return(data.frame(x = xx, y = yy))
}
x1 = seq(0,100)

mydf = data.frame(x1, y2=fun2(x1),y3= fun3(x1),y4=fun4(x1),y5=fun5(x1))
mydf <-  transform(mydf, z = pmax(y2,y3,y5))
mydf <-  transform(mydf, zmin = pmax(y2,y3))
ggplot(mydf) + 
  geom_ribbon(aes(x=x1,ymin=zmin,ymax = z), fill = 'cadetblue1')+
  geom_line(aes(x = x1,y = y2), colour = 'black') +
  geom_line(aes(x = x1,y = y3), colour = 'black') +
  geom_line(aes(x = y4, y=x1), colour = 'black')+
  geom_line(aes(x = x1, y=y5), colour = 'black')+
  xlim(0,6) + ylim(0,4)
  
