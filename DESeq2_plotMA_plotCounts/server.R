### server.R : builds the plots and tables ###

library(shiny)
shinyServer(function(input, output) {
  
  # MA-plot
  output$plotma <- renderPlot({
    # process possible input
    idx <- findClosest( input )
    par(mar=c(5,5,3,2),cex.lab=2,cex.main=2,cex.axis=1.5)
    # MA-plot of all genes
    plotMA( res, ylim=c( -ymax, ymax ) )
    # add circle for the selected point
    points( 10^data[idx,1], data[idx,2], col="dodgerblue", cex=3, lwd=3 )
  })

  # counts plot
  output$plotcounts <- renderPlot({
    # process possible input
    idx <- findClosest( input )
    par(mar=c(5,5,3,2),cex.lab=2,cex.main=2,cex.axis=1.5)
    # plot the counts for the selected gene
    plotCounts( dds, idx )
    
  })
  
})
