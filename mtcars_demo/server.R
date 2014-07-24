library(shiny)
shinyServer(function(input, output) {
  output$myplot1 <- renderPlot({
    idx <- findClosest(input)
    par(mar=c(5,5,3,2),cex.lab=2,cex.main=2,cex.axis=1.5)
    plot(mtcars[,c(1,3)])
    points(mtcars[idx,c(1,3)],col="dodgerblue",cex=3,lwd=3)
  })
  output$myplot2 <- renderPlot({
    idx <- findClosest(input)
    par(mar=c(5,5,3,2),cex.lab=2,cex.main=2,cex.axis=1.5)
    plot(mtcars[,c(1,4)])
    points(mtcars[idx,c(1,4)],col="dodgerblue",cex=3,lwd=3)
  })
})