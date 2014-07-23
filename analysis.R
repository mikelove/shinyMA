library(DESeq2)
library(pasilla)
library(Biobase)
data(pasillaGenes)
dds <- DESeqDataSetFromMatrix(counts(pasillaGenes),
                              pData(pasillaGenes)[,2:3],
                              ~ condition)
dds <- DESeq(dds)
res <- results(dds)
# so that points are 'close' in the log x axis
data <- cbind(log10(res$baseMean), res$log2FoldChange)

findClosest <- function(input) {
  # so that points are 'close' in the log x axis
  pt <- c(log10(input$myplot_click$x), y=input$myplot_click$y)
  sqdists <- colMeans((t(data) - pt)^2)
  which.min(sqdists)
}
