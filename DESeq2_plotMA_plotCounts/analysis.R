### analysis.R : my additional file ### 

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
dds <- dds[rowSums(counts(dds)) > 0, ]

# run DESeq
dds <- DESeq(dds)
res <- results(dds)

# this object will be used to locate points from click events.
# take the log of x, so that points are 'close' in the log x axis
data <- with(res, cbind(log10(baseMean), log2FoldChange))

# we set the ylim so need to use
ymax <- 2.5
data[,2] <- pmin(ymax, pmax(-ymax, data[,2]))
scale <- c(diff(range(data[,1])), 2*ymax)
t.data.scaled <- t(data)/scale

findClosest <- function(input) {
  if (is.null(input$plotma_click)) {
    1
  } else {
    # again log of x, so that points are 'close' in the log x axis
    pt <- c(log10(input$plotma_click$x), y=input$plotma_click$y)
    sqdists <- colMeans( ( t.data.scaled - pt/scale )^2 )
    which.min(sqdists)
  }
}
