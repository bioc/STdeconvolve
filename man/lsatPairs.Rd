% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{lsatPairs}
\alias{lsatPairs}
\title{Function to get Hungarian sort pairs via clue::lsat}
\usage{
lsatPairs(mtx)
}
\arguments{
\item{mtx}{output correlation matrix from getCorrMtx(). Must not have more rows
than columns}
}
\value{
A list that contains
\itemize{
\item pairs: output of clue::solve_LSAP. A vectorized object where for each
position the first element is a row and the second is the paired column.
\item rowix: the indices of the rows. Essentially seq_along(pairing)
\item colsix: the indices of each column paired to each row
}
}
\description{
Finds best matches between cell-types that correlate between
beta or theta matrices that have been compared via getCorrMtx().
Each row is paired with a column in the output matrix from getCorrMtx().
If there are less rows than columns, then some columns will not be
matched and not part of the output.
}
\examples{
data(mOB)
pos <- mOB$pos
cd <- mOB$counts
counts <- cleanCounts(cd, min.lib.size = 100)
corpus <- restrictCorpus(counts, removeAbove=1.0, removeBelow = 0.05)
ldas <- fitLDA(t(as.matrix(corpus)), Ks = 3)
optLDA <- optimalModel(models = ldas, opt = 3)
results <- getBetaTheta(optLDA, perc.filt = 0.05, betaScale = 1000)
deconProp <- results$theta
corMtx <- getCorrMtx(m1 = as.matrix(deconProp), m2 = as.matrix(deconProp), type = "t")
pairs <- lsatPairs(corMtx)
pairs

}
