\name{plotpdf}
\alias{plotpdf}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
  Plot a probability denstity function
}
\description{
  Plot a probability denstity function with x-axis limits determined by
  quantiles of the distribution. Quantiles are computed using a quantile
  function or cumulative distribution function, whichever is supplied.
}
\usage{
plotpdf(pdf, qdf, cdf, lq = 0.01, uq = 0.99, ...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pdf}{probability density to be plotted, a function.}
  \item{qdf}{quantile function to be used for computation of quantiles,
    a function.}
  \item{cdf}{cumulative distribution function to be used for computation of quantiles,
    a function. This argument is used if \code{qdf} is not given, see
    `Details' section.}
  \item{lq}{lower quantile, used in the computation of the left limit.}
  \item{uq}{upper quantile, used in the computation of the right limit.}
  \item{\dots}{additional arguments to be passed on to the \code{plot} function.}
}
\details{
  The function plots \code{pdf(x)} over the interval (xmin,xmax) where
  xmin and xmax are the \code{lq}th and \code{uq}th quantiles,
  respectively, of the distribution.  The quantile function,
  \code{qdf}, is used, if supplied. Otherwise the quantiles are computed
  numerically from the cdf.

  Argument \code{pdf} is not required to be a pdf, it may be any
  function. For example, the same way of choosing the limits may be
  appropriate for a plot of the cdf, see the examples.

  Similarly, \code{qdf} and \code{cdf} need not be related to \code{pdf}.
}
% \value{
%   The function is used mainly for the side effect of producing the
%   plot. The return value is that of \code{plot}.
% }
\author{Georgi N. Boshnakov}
\seealso{
  \code{\link{cdf2quantile}}
}
\examples{
pdf1 <- function(x) dnorm(x, mean = 100, sd = 5)
qdf1 <- function(x) qnorm(x, mean = 100, sd = 5)
cdf1 <- function(x) pnorm(x, mean = 100, sd = 5)

plot(pdf1) # needs to specify 'from' and 'to' args for meaningful plot
plotpdf(pdf1, qdf1)                               # using quantile function
plotpdf(pdf1, cdf = cdf1)                         # using cdf
plotpdf(pdf1, cdf = cdf1, lq = 0.001, uq = 0.999) # ... and non-default quantiles

plotpdf(cdf1, cdf = cdf1, lq = 0.001, uq = 0.999) # plot a cdf


## a mixture distribution:
pf1 <- function(x){
    0.25 * pnorm(x, mean = 3, sd = 0.2) + 0.75 * pnorm(x, mean = -1, sd = 0.5)
}
df1 <- function(x){
    0.25 * dnorm(x, mean = 3, sd = 0.2) + 0.75 * dnorm(x, mean = -1, sd = 0.5)
}

plotpdf(df1, cdf = pf1) # plot the pdf
plotpdf(pf1, cdf = pf1) # plot the cdf

c(cdf2quantile(0.05, pf1), cdf2quantile(0.95, pf1))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{hplot}
\keyword{dplot}
