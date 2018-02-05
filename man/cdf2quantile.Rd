\name{cdf2quantile}
\alias{cdf2quantile}
\title{
  Calculate a quantile from a distribution function
}
\description{
  Numerically calculate a quantile from a distribution function.
}
\usage{
cdf2quantile(p, cdf, interval = c(-3, 3), lower = min(interval),
      upper = max(interval), \dots)
}
\arguments{
  \item{p}{ a number in the interval (0,1).  }
  \item{cdf}{cumulative distribution function, a function.}
  \item{interval}{interval in which to look for the root, see Details.}
  \item{lower}{lower end point of the interval.}
  \item{upper}{upper end point of the interval.}
  \item{\dots}{any further arguments to be passed to the root finding
    function and the cdf, see Details.}
}
\details{
  The quantile, \eqn{q}, is computed numerically as the solution of the
  equation \eqn{cdf(q)-p=0}.

  Function \code{uniroot} is used to find the root.  To request higher
  precision, set argument \code{tol}.  Other arguments in \code{...} are
  passed on to \code{cdf}.

  \code{uniroot} needs an interval where to look for the root.
  There is a default one, which is extended automatically if it does not
  contain the quantile. This assumes that argument \code{cdf} is an
  increasing function (as it should be).

  To override the default interval, use argument \code{interval} (a
  vector of two numbers) or \code{lower} and/or \code{upper}. This may
  be necessary if the support of the distribution is not the whole real
  line and \code{cdf} does not cope with values outside the support of
  the distribution.

}
\value{The computed quantile as a number.}
\author{Georgi N. Boshnakov}
\seealso{
  \code{\link{plotpdf}}
}
\examples{
cdf2quantile(0.95, pnorm)
cdf2quantile(0.05, pexp)   # support [0,Inf) is no problem for
cdf2quantile(0.05, plnorm) # for built-in distributions.

## default predicision is about 4 digits after decimal point
cdf2quantile(0.95, pnorm, mean = 3, sd = 1)
cdf2quantile(0.05, pnorm, mean = 3, sd = 1)
qnorm(c(0.95, 0.05), mean = 3, sd = 1)

## request a higher precision:
cdf2quantile(0.05, pnorm, mean = 3, sd = 1, tol = 1e-8)
cdf2quantile(0.05, pnorm, mean = 3, sd = 1, tol = 1e-12)

## see also examples for plotpdf()
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{distribution}

