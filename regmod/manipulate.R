library(ggplot2)
library(manipulate)

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

myHist <- function(beta){
  lse <- sum((y-beta*x)^2)
  plot(x, y, main=lse)
}


manipulate(myHist(beta), beta=slider(0, 2, step=0.1))
 
