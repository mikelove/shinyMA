### ui.R : lays out the page ###

library(shiny)
shinyUI(fluidPage(
  titlePanel("MA-plot + counts plot with shiny"),

  # flow layout fills out left to right then down
  flowLayout(

    # the MA-plot
    plotOutput("plotma", clickId="plotma_click", width=400, height=400),

    # the counts plot for a single gene
    plotOutput("plotcounts", width=400, height=400)
    
  )
  
))
