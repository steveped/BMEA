% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fitBmeaSingle.R
\name{fitBmeaSingle}
\alias{fitBmeaSingle}
\title{Fit & summarise the BMEA model for a single gene(unit)}
\usage{
fitBmeaSingle(celSet, bgCelSet, unit, conditions, contMatrix, ...,
  keepSims = FALSE, zGene = 4.265, zExon = 1.645)
}
\arguments{
\item{celSet}{an \code{AffymetrixCelSet} with the data to be fit}

\item{bgCelSet}{a list with components \code{$lambda} & \code{$delta}. 
Each of these must be an \code{AffymetrixCelSet} containing the means & standard deviations for the background signal priors}

\item{unit}{the unit (i.e. gene) to be fit}

\item{conditions}{a vector of factors specifying which cell-type/condition each array in the \code{celSet} belongs to}

\item{contMatrix}{a contrast matrix for the summarised output}

\item{...}{used for passing variables such as \code{mcmcParam} to \code{runMCMC.BMEA}}

\item{keepSims}{logical variable. If \code{TRUE} all sims from the process & contrasts will be kept}

\item{zGene}{the zScore below which the gene is determined to be not detectable above background}

\item{zExon}{the zScore below which the exon is determined to be not detectable above background}
}
\value{
Returns a list with the following components:
 
\itemize{
\item{$summary}{ a matrix with the summary for all the model parameters, with convergence statistics \code{rHat} & \code{nEff}}
\item{$logFC}{ a matrix with a separate row for each contrast. Includes mean, sd & key quantiles, with the values maxP & B. maxP refers to the maximum of the proportion of samples which were >=0 or <=0. B is calculated using the weak inequalities log(p>=0) - log(p<=0) as non-zero values for phiLogFC are possible under a (yet to be implemented) mixture model for phi.}
\item{$phiLogFC}{ a list with a component for each contrast. Each component is a matrix as above for logFC, but with each row representing an exon.}
\item{$sims}{ if \code{keepSims=TRUE}, this will return a list with components \code{$data} for the simulation output, \code{$logFC} for the sampled values of log fold-change and \code{$phiLogFC} for the exon-level sampled values for the change in phi. Otherwise, returns \code{NULL}.}
}
}
\description{
This function fits the BMEA model & provides the summarised output for a single gene.
}
\details{
This function runs all the necessary checks & fits the BMEA model for a single unit (i.e. gene).
The \code{bgCelSet} must be written to disk beforehand, during the preparatory stages.

The value of \code{zGene} can be set to \code{NULL} if the filtering out of low-expressed genes 
is not desired. 
This value can be changed to any value to effectively restrict the range of expression values in 
the dataset to those with a high signal-to-noise ratio. 
The value of \code{zExon} can also be set to \code{NULL} to bypass the filtering of exons which 
are not confidently detectable above background.
}
