library(DESeq2)
library(pasilla)
library(Biobase)
data(pasillaGenes)

# DE analysis of the pasilla dataset from Bioconductor
dds <- DESeqDataSetFromMatrix(counts(pasillaGenes),
                              pData(pasillaGenes)[,2:3],
                              ~ condition)

# compare treated vs untreated
dds$condition <- relevel(dds$condition, "untreated")

# run DESeq
dds <- DESeq(dds)
res <- results(dds)

# this object will be used to locate points from click events.
# take the log of x, so that points are 'close' in the log x axis
data <- cbind(log10(res$baseMean), res$log2FoldChange)

findClosest <- function(input) {
  if (is.null(input$plotma_click)) {
    1
  } else {
    # again log of x, so that points are 'close' in the log x axis
    pt <- c(log10(input$plotma_click$x), y=input$plotma_click$y)
    sqdists <- colMeans((t(data) - pt)^2)
    which.min(sqdists)
  }
}
