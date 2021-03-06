% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assignBgPriors.R
\name{assignBgPriors}
\alias{assignBgPriors}
\title{Assign the Background Signal Priors for each PM probe}
\usage{
assignBgPriors(celSet, seqFile, bgBins = NULL, bgParam = NULL,
  method = "MAT", path, batchSize = NULL, overWrite = FALSE)
}
\arguments{
\item{celSet}{the set of CEL files to be analysed}

\item{seqFile}{the file with the sequence data for all PM probes. 
Must contain the xy co-ordinates of each probe & sequence data for each probe.}

\item{bgBins}{the output of either \code{defineMatBins} or  \code{defineGcBins}.}

\item{bgParam}{the model parameters as returned by the function \code{fitBackgroundParameters}. 
Not required if using \code{method="GC"}.}

\item{method}{only "MAT" & "GC" can be supplied. Defaults to "MAT".}

\item{path}{the root directory where files should be written. 
Defaults to the working directory}

\item{batchSize}{the number of probes to be written to file in batches. 
Calculated as a function of memory size.}

\item{overWrite}{\code{logical}. 
Determines whether to over-write any existing .CEL files with new information. 
If \code{overWrite = FALSE}, checks for pre-existing celFiles will be performed & 
if a complete set matching the supplied \code{celSet} is found, this will be used.}
}
\value{
Returns a list with components \code{$lambda} & \code{$delta}.
 Each component is an \code{AffymetrixCelSet} containing the respective means & sds.
}
\description{
The function assigns a log-normal prior distribution for background signal to each PM probe on the specified cdf. 
The prior is estimated based on sequence composition using either MAT or the GC count
}
\details{
This process will create two sets of .CEL files containing the mean (lambda) & standard deviation (delta) 
for the background priors under the BMEA model for each PM probe contained on the supplied cdf. 
The priors are based on the assumption that log(B) ~ N(lambda, delta).

The .CEL files will be written to the subdirectories of the path or working directory  \code{backgroundPriors/parentName,method,lambda/chipType} &
\code{backgroundPriors/parentName,method,delta/chipType}.
}
\references{
H. Bengtsson, K. Simpson, J. Bullard, and K. Hansen, (2008) \emph{aroma.affymetrix: A generic framework in R for analyzing small to very large Affymetrix data sets in bounded memory}, 
 Tech Report #745, Department of Statistics, University of California, Berkeley. 
  
 Kapur, K., Xing, Y., Ouyang, Z., Wong, WH. (2007) \emph{Exon arrays provide accurate assessments of gene expression} 
 Genome  Biol. 8(5):R82
  
 Johnson, W.E., Li, W., Meyer, C.A., Gottardo, R., Carroll, J.S., Brown, M., Liu, X.S. (2006) \emph{Model-based analysis of tiling-arrays for ChIP-chip.} 
 Proc Natl Acad Sci USA 103:12457-12462
}
