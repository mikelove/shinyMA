data <- as.matrix(mtcars[,c(1,3)])
scale <- c(diff(range(data[,1])), diff(range(data[,2])))
t.data.scaled <- t(data)/scale

findClosest <- function(input) {
  if (is.null(input$myplot1_click)) {
    1
  } else {
    pt <- c(input$myplot1_click$x, y=input$myplot1_click$y)
    sqdists <- colMeans( (t.data.scaled - pt/scale )^2 )
    which.min(sqdists)
  }
}
