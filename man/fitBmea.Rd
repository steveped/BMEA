% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fitBmea.R
\name{fitBmea}
\alias{fitBmea}
\title{Fit the BMEA model for a large number of units}
\usage{
fitBmea(celSet, bgCelSet, units = NULL, batchSize = 2^4, conditions,
  contMatrix, ..., verbose = 0)
}
\arguments{
\item{celSet}{the celSet which is being processed}

\item{bgCelSet}{a list with components \code{lambda} & \code{delta}. 
Each component must be a celSet containing the information for the background signal priors}

\item{units}{the units to be processed}

\item{batchSize}{the number of units to process before writing to disk. Defaults to 16 (2^4)}

\item{conditions}{a vector of factors}

\item{contMatrix}{the contrasts}

\item{...}{used for passing arguments to \code{fitBmeaBatch}, \code{writeBmeaBatch} & \code{runMCMC.BMEA}}

\item{verbose}{controls the level of detail to be displayed whilst the process is running}
}
\value{
\code{NULL}
}
\description{
Fit a large number of units in batches using the BMEA model
}
\details{
This is the high-level function which fits the specified units in batches, 
as determined by \code{batchSize}. 
Each batch of units (i.e. genes) is fitted, then the parameters written to disk. 
Generally writing to disk can be a bottleneck when it comes to processing time,
so a wise choice for \code{batchSize} can impact on the speed of the process.
}
\seealso{
\code{\link{fitBmeaBatch}}, \code{\link{writeBmeaBatch}}, \code{\link{runMCMC.BMEA}}
}
