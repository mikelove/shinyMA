data <- as.matrix(mtcars[,c(1,3)])
findClosest <- function(input) {
  if (is.null(input$myplot1_click)) {
    1
  } else {
    pt <- c(input$myplot1_click$x, y=input$myplot1_click$y)
    sqdists <- colMeans((t(data) - pt)^2)
    which.min(sqdists)
  }
}
