library(shiny)
shinyServer(function(input, output) {
  output$myplot <- renderPlot({
    idx <- if (is.null(input$myplot_click)) {
      1
    } else {
      findClosest(input)
    }
    par(mar=c(5,5,3,2),cex.lab=2,cex.main=2,cex.axis=1.5)
    plotMA(res, ylim=c(-3,3))
    points(res$baseMean[idx], 
           res$log2FoldChange[idx],col="dodgerblue",cex=3,lwd=3)
  })
  output$myplot2 <- renderPlot({
    idx <- if (is.null(input$myplot_click)) {
      1
    } else {
      findClosest(input)
    }  
    par(mar=c(5,5,3,2),cex.lab=2,cex.main=2,cex.axis=1.5)
    plotCounts(dds, idx)
  })
})