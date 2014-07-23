library(shiny)
shinyUI(fluidPage(
  titlePanel("demo of two plots"),
  flowLayout(
      plotOutput("myplot1", clickId="myplot1_click", width=400, height=400),
      plotOutput("myplot2", width=400, height=400)
  )
))