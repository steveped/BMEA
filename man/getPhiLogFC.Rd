% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getPhiLogFC.R
\name{getPhiLogFC}
\alias{getPhiLogFC}
\title{Sample the log fold-change for each exon from a BMEA.MCMC dataset}
\usage{
getPhiLogFC(data, contr.matrix, exonNames = NULL, keepSims = FALSE)
}
\arguments{
\item{data}{an object of class BMEA.MCMC. 
Will contain a set of simulations for every condition-specific expression level.}

\item{contr.matrix}{a contrast matrix with rows representing each condition & columns representing the specific contrasts. 
The column names are recycled as rownames in the summary output & for the simulations if kept.}

\item{exonNames}{a character vector containing the exon (or group) names as specified on the cdf.}

\item{keepSims}{a Boolean variable that determines whether the sampled values are returned in the output 
or just the summary statistics. Defaults to FALSE.}
}
\value{
A list with the following components:
\itemize{
\item{summary}{ a list with a separate component for each contrast. 
Each contrast-level component is a matrix with the summarised phi log fold-change for each exon within the transcript.}
\item{sims}{ a list with a separate component for each contrast. Each contrast-level component is a matrix of the sampled posterior disitributions for each contrast. Rows represent a kept iteration from the MCMC process, and columns represent each exon. Returns NULL if keepSims is set to FALSE.}
}
}
\description{
Samples the posterior distribution of exon-specific log fold-change for each specified contrast from the given dataset.
}
\details{
Obtains the exon-specific posterior distribution for log fold-change for each supplied contrast 
by direct sampling from the MCMC output. 
A summary for each contrast with mean, sd & the quantiles are returned in the $summary argument 
as the default.

All data is retrieved using C and this function is a simple wrapper to the C function.
}
