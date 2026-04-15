\name{pepsi}
\alias{pepsi}
\title{
moving average expansion of a periodic autoregression
}
\description{
A periodic autoregression can be represented as an infinite
periodic moving average process. This function calculates
the coefficients in this expansion. These coefficients are
needed in various time series computations such as in computing
the variances of forecasts, variances of residual autocorrelations
and theoretical autocovariances of a periodic autoregression.
The function pepsi is used by periodicAR to calculate the estimated
standard deviations of the residual autocorrelations in a fitted
periodic autoregression.
}

\usage{
pepsi(phi, lag.max)
}

\arguments{
\item{phi}{
matrix with (i,j)-entry phi[i, j] where phi[i,j] is the 
autoregressive coefficient for period i at lag j. Here i=1,\dots,p 
and j=1,\dots,m where m is highest ar order specified.
}

\item{lag.max}{
maximum number of lags to calculate in the moving average expansion.
}}
\value{
matrix with (i,j)-entry psi[i, j] where psi[i,j] is the 
autoregressive coefficient for period i at lag j. Here i=1,\dots,p 
and j=1,\dots,lag.max.
}

\section{Side Effects}{
none
}

\details{
The moving average expansion for a periodic autoregressive is defined
in equation (1.4) of McLeod (1994) and the algorithm implements
the recursion given in equation (1.5).
}
\references{
McLeod, A.I. (1994), "Diagnostic Checking of Periodic Autoregression"
Journal of Time Series Analysis, Vol. 15, No. 2, pp.221--233.
}
\seealso{
periodicAR
}

\examples{
data(Fraser)
periodicAR.out <- periodicAR(log(Fraser), ic="bic")
pepsi(periodicAR.out$phi,lag.max=20)
}
\keyword{ts}
