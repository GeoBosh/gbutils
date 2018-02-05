\name{sim_complex}
\alias{sim_complex}
\alias{sim_real}
\title{ Simulate real or complex numbers using polar form}
\description{
  Simulate complex numbers with given distributions for the modulus and
  the argument and real numbers with given distributions for the absolute
  value and the sign. Some of the values may be partially or fully
  specified.
}
\usage{
sim_complex(abs, arg, absgen = "runif", absarg = list(0, 1),
                      arggen = runif, argarg = list(-pi, pi), ...)

sim_real(abs, sign, signprob = 0.5, absgen = "runif",
                                    absarg = list(0, 1), ...)
}
\arguments{
  \item{abs}{ vector of absolute values. }
  \item{sign}{ vector of signs (1 or -1).  }
  \item{signprob}{ probability for a positive sign. }
  \item{arg}{ vector of arguments (of complex numbers). }
  \item{absgen}{ generator for the absolute values, a function or a
    character string naming a function.
  }
  \item{absarg}{ arguments for \code{absgen}. }
  \item{arggen}{ generator for the arguments of the complex numbers, a
    function or a string naming a function.
  }
  \item{argarg}{ arguments for \code{arggen}. }
  \item{\dots}{ not used, simplifies the call from \code{sim_numbers}. }

}
\details{

  \code{sim_real} simulates real numbers by simulating separately their
  absolute values and signs.  \code{sim_complex} simulates complex
  numbers by simulating separately their moduli and arguments.

  Both functions replace \code{NA}'s in argument \code{abs} with values
  simulated by the function specified by \code{absgen}. Arguments for
  \code{absgen} are specified by the (possibly named) list
  \code{absarg}.

  Similarly, \code{sim_complex} replaces \code{NA}'s in argument
  \code{arg} with values simulated according to \code{arggen} and
  \code{argarg}.

  Further, \code{sim_real} replaces \code{NA}'s in argument \code{sign}
  with a random sample of ones and minus ones, where the probability for
  the positive value is \code{signprob}.

  Only \code{NA} entries in \code{abs}, \code{arg} and \code{sign} are
  filled with simulated values, the remaining entries are left
  unchanged. This means that some (and even all) values may be
  specified partially or completely.

  \code{abs} is combined with \code{arg} or \code{sign} to create the
  result. These arguments are expected to be of matching shape and
  length but this is not enforced and the usual recycling rules will
  apply if this is not the case (not recommended to rely on this).

  The default range for the (complex) argument is (-pi,pi).

}
\value{
  for \code{sim_real}, a vector of real numbers

  for \code{sim_complex}, a vector of complex numbers
}
%\references{ ~put references to the literature/web site here ~ }
\author{Georgi N. Boshnakov}
\note{
  Currently the shape of the result for \code{sim_real} is the same as
  that of argument \code{abs}. But \code{sim_complex} always returns a
  vector. Probably this inconsistency should be removed.
}
\seealso{
  \code{\link{sim_numbers}} which offers more flexible interface to
  these functions.
}
\examples{
## x[1] is fixed to 1, x[2] is negative with random magnitude:
x <- sim_real(c(1,NA,NA,NA), c(1, -1, NA, NA))

## z[1] fixed to 1, the remaining elements of z
## have random magnitude and fixed arguments:
z <- sim_complex(c(1,NA,NA,NA), c(0, pi/2, pi, -pi/2))

## without restrictions
sim_complex(rep(NA,4))
sim_real(rep(NA,4))

## moduli unrestricted; arguments restricted
sim_complex(rep(NA,4), c(0, pi/2, pi, -pi/2))
}
\keyword{distribution}
\keyword{simulation}




