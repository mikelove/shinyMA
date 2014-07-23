library(shiny)
shinyUI(fluidPage(
  titlePanel("MA-plot + counts plot with shiny"),
  flowLayout(
      plotOutput("myplot", clickId="myplot_click", width=400, height=400),
      plotOutput("myplot2", width=400, height=400)
  )
))