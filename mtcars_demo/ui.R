library(shiny)
shinyUI(fluidPage(
  titlePanel("demo of two plots"),
  flowLayout(
      plotOutput("plot1", click="plot_click", width=400, height=400),
      plotOutput("plot2", width=400, height=400),
      cellArgs = list(style="width: 400px;")
  )
))
