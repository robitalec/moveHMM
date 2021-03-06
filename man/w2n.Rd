% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/w2n.R
\name{w2n}
\alias{w2n}
\title{Scaling function: working to natural parameters}
\usage{
w2n(wpar, bounds, parSize, nbStates, nbCovs, estAngleMean, stationary)
}
\arguments{
\item{wpar}{Vector of state-dependent distributions unconstrained parameters.}

\item{bounds}{Matrix with 2 columns and as many rows as there are elements in \code{wpar}. Each row
contains the lower and upper bound for the correponding parameter.}

\item{parSize}{Vector of two values: number of parameters of the step length distribution,
number of parameters of the turning angle distribution.}

\item{nbStates}{The number of states of the HMM.}

\item{nbCovs}{The number of covariates.}

\item{estAngleMean}{\code{TRUE} if the angle mean is estimated, \code{FALSE} otherwise.}

\item{stationary}{\code{FALSE} if there are covariates. If TRUE, the initial distribution is considered
equal to the stationary distribution. Default: \code{FALSE}.}
}
\value{
A list of:
\item{stepPar}{Matrix of natural parameters of the step length distribution}
\item{anglePar}{Matrix of natural parameters of the turning angle distribution}
\item{beta}{Matrix of regression coefficients of the transition probabilities}
\item{delta}{Initial distribution}
}
\description{
Scales each parameter from the set of real numbers, back to its natural interval.
Used during the optimization of the log-likelihood.
}
\examples{
\dontrun{
nbStates <- 3
nbCovs <- 2
par <- c(0.001,0.999,0.5,0.001,1500.3,7.1)
parSize <- c(1,1)
bounds <- matrix(c(0,1,0,1,0,1,
                   0,Inf,0,Inf,0,Inf),
                 byrow=TRUE,ncol=2)
beta <- matrix(rnorm(18),ncol=6,nrow=3)
delta <- c(0.6,0.3,0.1)
wpar <- n2w(par,bounds,beta,delta,nbStates,FALSE)
print(w2n(wpar,bounds,parSize,nbStates,nbCovs,estAngleMean=FALSE,stationary=FALSE))
}


}
