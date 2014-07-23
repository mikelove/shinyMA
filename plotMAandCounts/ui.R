library(shiny)
shinyUI(fluidPage(
  titlePanel("MA-plot + counts plot with shiny"),
  flowLayout(
      plotOutput("plotma", clickId="plotma_click", width=400, height=400),
      plotOutput("plotcounts", width=400, height=400)
  )
))
