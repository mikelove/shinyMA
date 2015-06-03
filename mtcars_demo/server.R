data <- as.matrix(mtcars[,c(1,3)])
scale <- c(diff(range(data[,1])), diff(range(data[,2])))
t.data.scaled <- t(data)/scale

library(shiny)
shinyServer(function(input, output) {
  idx = NULL
  xy = reactive(c(input$plot_click$x, input$plot_click$y))
  observe({
    if (!is.null(xy())) {
      sqdists <- colMeans( (t.data.scaled - xy()/scale )^2 ) 
      idx <<- which.min(sqdists)  
    }
  })
  
  output$plot1 <- renderPlot({
    xy()
    par(mar=c(5,5,3,2),cex.lab=2,cex.main=2,cex.axis=1.5)
    plot(mtcars[,c(1,3)])
    if (!is.null(idx)) points(mtcars[idx,c(1,3)],col="dodgerblue",cex=3,lwd=3)
  })
  output$plot2 <- renderPlot({
    xy()
    par(mar=c(5,5,3,2),cex.lab=2,cex.main=2,cex.axis=1.5)
    plot(mtcars[,c(1,5)])
    if (!is.null(idx)) points(mtcars[idx,c(1,5)],col="dodgerblue",cex=3,lwd=3)
  })
})
