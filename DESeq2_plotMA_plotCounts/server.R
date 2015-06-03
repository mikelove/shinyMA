### server.R : builds the plots and tables ###
source("analysis.R")

library(shiny)
shinyServer(function(input, output) {
  idx = NULL
  xy = reactive(c(input$plotma_click$x, input$plotma_click$y))
  observe({
    if (!is.null(xy())) {
      ## find index of the closest point
      sqdists <- colMeans( (t.data.scaled - xy()/scale )^2 ) 
      idx <<- which.min(sqdists)  
    }
  })
  
  # MA-plot
  output$plotma <- renderPlot({
    # update on user click
    xy()
    par(mar=c(5,5,3,2),cex.lab=2,cex.main=2,cex.axis=1.5)
    # MA-plot of all genes
    plotMA( res, ylim=c( -ymax, ymax ) )
    # add circle for the selected point
    if (!is.null(idx)) points( data[idx,1], data[idx,2], col="dodgerblue", cex=3, lwd=3 )
  })

  # counts plot
  output$plotcounts <- renderPlot({
    # update on user click
    xy()
    par(mar=c(5,5,3,2),cex.lab=2,cex.main=2,cex.axis=1.5)
    # plot the counts for the selected gene
    if (!is.null(idx)) plotCounts( dds, idx )
  })
  
})
