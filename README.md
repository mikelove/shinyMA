# shiny clickable plots

- the shiny app in `mtcars_demo/` is a general example of two plots, which react
  to clicking on points in the first plot
- the shiny app in `DESeq2_plotMA_plotCounts/` provides an MA-plot on
  the left, and a plot of counts for a single gene on the right. the
  gene is selected by clicking on the MA-plot.

<img src="example.png">

24 July 2014: second demo only works with Bioc devel branch bc it uses
`DESeq2::plotCounts` which is in the devel branch 
