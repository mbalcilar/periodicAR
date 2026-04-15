\name{periodicAR-package}
\alias{periodicAR-package}
\docType{package}

\title{
Periodic Autoregression Model Fitting
}

\description{
Package for estimating periodic autoregressive models. 
Datasets: monthly ozone and Fraser riverflow. 
Plots: periodic versions of boxplot, auto/partial correlations, 
moving-average expansion.
}

\details{
\tabular{ll}{
Package: \tab periodicAR\cr
Type: \tab Package\cr
Version: \tab 1.5-1\cr
Date: \tab 2023-11-07\cr
License: \tab GPL (>= 3)\cr
LazyLoad: \tab yes\cr
LazyData: \tab yes\cr
}

This package provides a comprehensive approach to fitting periodic
autocorrelation models.
It was converted and adopted to R by Mehmet Balcilar in 2002 from an S-Plus
library written by A.I. McLeod and published on Statlib. 
It has been updated and maintained by A.I. McLeod since 2008. 
}


\author{
A. I. McLeod <aimcleod@uwo.ca> and Mehmet Balcilar <mehmet@mbalcilar.net>.
Maintainer: mehmet@mbalcilar.net
}

\references{ 
Hipel, K.W. and McLeod, A.I. (1994) "Time Series Modelling of 
Water Resources and Environmental Systems"  Elsevier, Amsterdam
ISBN 0--444--89270--2.  (1013 pages).

McLeod, A.I. (1994), "Diagnostic Checking of Periodic Autoregression"
Journal of Time Series Analysis, Vol. 15, No. 2, pp.221--233.

Noakes, D.J., Hipel, K.W. & McLeod, A.I. (1987).  
Forecasting experiments with annual geophysical time series,  
The International Journal of Forecasting, V.4, pp.103--115.
}

\keyword{ts}

\keyword{package}

\seealso{
\code{\link{find.ice}},
\code{\link{Fraser}},
\code{\link{ozone}},
\code{\link{peacf}},
\code{\link{peacf.plot}},
\code{\link{periodicAR}},
\code{\link{peboxplot}},
\code{\link{pepacf}},
\code{\link{peplot}},
\code{\link{pepsi}}
}		

\examples{
#We will work with the log flows
data(Fraser)
logFraser <- log(Fraser)
#Example 1. Periodic autocorrelations
#plot and output including portmanteau and periodicity test
#as well as means, sd, autocorrelations
peacf(logFraser)
#
#Example 2. Periodic boxplot
peboxplot(logFraser)
#
#Example 3. Periodic pacf
pepacf(logFraser)
#
#Example 4. Fit periodicAR using BIC
ans<-pepacf(logFraser)
#list output variables
names(ans)
#the model orders selected for each month are:
ans$mbice
#now fit with periodicAR
ans <- periodicAR(logFraser, ic="bic")

}
