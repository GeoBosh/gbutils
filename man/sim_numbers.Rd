\name{sim_numbers}
\alias{sim_numbers}
\title{ Simulation based on polar form specifications }
\description{

  Simulate real and complex numbers from polar form specifications. The
  numbers may be partially or fully specified. The distributions of
  absolute values and arguments/signs are specified independently.

}
\usage{
sim_numbers(type = rep(as.character(NA), length(abs)),
            abs = rep(as.numeric(NA), length(type)),
            sign = rep(as.numeric(NA), length(type)), values = NULL, ...)
}
\arguments{
  \item{type}{ character vector specifying the types of the eigenvalues,
    see Details.}
  \item{abs}{ vector of absolute values (moduli).}
  \item{sign}{ vector of signs (for reals) and  arguments (for complex
    numbers), see Details for interpretation.}
  \item{values}{values, see details.}
  \item{\dots}{ additional arguments to be passed to \code{sim_real} and
    \code{sim_complex}.}
}
\details{
  % NA's are filled with simulated values.

  \code{sim_numbers} simulates a vector of real and complex numbers with
  given distributions of their polar parts. It is possible also to fix
  some of the numbers or one of their polar parts.
  The length of the simulated vector is inferred from the length of
  \code{type} or \code{abs}, so one of them must be
  provided. \code{sim_numbers} is a flexible front-end for
  \code{sim_real} and \code{sim_complex}.

  \code{sim_numbers} generates a vector of values with types specified
  by argument \code{type} and/or inferred from argument \code{values}.
  The recommended way to use \code{sim_numbers} is to provide argument
  \code{type}. % and use the other arguments only when needed.

  \code{type[i]} specifies the type of the i-th element of the result:
  real (\code{type[i]=="r"}), complex (\code{type[i]=="c"}) or
  representing a complex conjugate pair (\code{type[i]=="cp"}).  If
  \code{values} is provided, the imaginary parts of its non-NA elements
  are used to fill \code{NA} elements of \code{type} ("r" if zero, "cp"
  otherwise).

  Some (or even all) values may be fixed or partially fixed with the
  help of arguments \code{abs}, \code{sign} and \code{values}. A
  non-missing value of \code{values[i]} fixes the i-th element of the
  result to that value. Simlarly \code{abs[i]} fixes the modulus and
  \code{sign[i]} fixes the sign/argument of the i-th element. If
  \code{values[i]} is not \code{NA}, then it takes precedence and
  \code{abs[i]} and \code{sign[i]} are ignored.

  For real numbers \code{sign} is the sign with possible values 1
  (positive) or -1 (negative). For complex numbers, \code{sign} is the
  argument and is in the interval (-pi,pi).

  If \code{values} is supplied, then \code{NA} entries in \code{type}
  are replaced by "r" or "cp" depending on whether or not the imaginary
  parts of the corresponding entries in \code{values} are equal to zero.
  A check is done for consistency when both \code{type[i]} and
  \code{values[i]} are non-missing. Generally, \code{values} is meant to
  be used for values that are fixed and available directly in Cartesian
  form, to avoid having to fill the corresponding entries of \code{abs}
  and \code{sign}.

  \code{NA} entries of \code{abs} and \code{sign} are filled with
  simulated values, the remaining entries are considered fixed and left
  unchanged. The default generator is uniform (0,1) for \code{abs},
  uniform (-pi,pi) for the argument of complex values, and 1 or -1 with
  p=1/2 for the sign of real values.

  To specify a different generator for the moduli and absolute values,
  use argument \code{absgen}, giving it a function or the name of a
  function. The arguments for this function can be specified by
  \code{absarg} (as a list). Similarly, the generator for arguments of
  complex numbers can be specified by \code{arggen} and \code{argarg}.
  Finally, the probability for the real numbers to be positive is given
  by \code{signprob}. These arguments are not in the signature of the
  function since they are passed on directly (via \code{"..."}) to the
  underlying \code{sim_complex} and \code{sim_real}, see their
  documentation and the examples below for further details.

}
\value{
  a list with components
  \item{values}{vector of values; it is of type \code{numeric} if
    all values are real and \code{complex} otherwise.
  }
  \item{type}{a character vector of the types as above}
}
%\references{ ~put references to the literature/web site here ~ }
\note{
  Values of type "cp" (complex pairs) are represented by one element, the
  complex conjugate elements are NOT generated. (todo: maybe add an
  argument to control this)

  The convention for the sign of a real eigenvalue is 1 and -1,
  not 0 and pi.
  % In the lower level function \code{sim_real} this argument
  % is called \code{sign} not \code{arg}.

  The checks for consistency between \code{type} and \code{values} are
  not complete and only straightforward use is recommended.

  The current defaults for the arguments, see the signature
  above, require that at least one of \code{type} and \code{abs} is not
  missing.

  % For compatility with old versions of the function (before the
  % introduction of \code{type}), \code{values} may be a character
  % vector. In this case \code{type} is set to \code{values}.

}
\author{Georgi N. Boshnakov}
\seealso{
  \code{\link{sim_real}}%
  , \code{\link{sim_complex}}
}
\examples{
## one real number and one complex conjugated pair
## (maybe to specify a cubic polynomial through its roots)
sim_numbers(type = c("r", "cp"))

## here the real value is fixed to have modulus 1, leaving the sign unspecified
sim_numbers(type = c("r", "cp"), abs = c(1, NA))

## now the real value is fixed to 1,
##     the complex pair has argument  +-pi/2, and free modulus:
sim_numbers(type = c("r", "cp"), abs = c(1, NA), sign = c(0, pi/2))


## using argument 'values' to fix some values;
## here the the third value is fixed:
sim_numbers(type = c("r", "cp", "r"), values = c(NA,NA,3))  # type[3] = "r"
sim_numbers(type = c("r", "cp", "cp"), values = c(NA,NA,3i)) # type[3] = "cp"

## type[3] can be left NA since it can be inferred from values[3]:
sim_numbers(type = c("r", "cp", NA), values = c(NA,NA,3))  # type[3] = "r"
sim_numbers(type = c("r", "cp", NA), values = c(NA,NA,3i)) # type[3] = "cp"

## it is an error to have a mismatch between args `type' and value:
\dontrun{
sim_numbers(type = c("r", "cp", "cp"), values = c(NA,NA,3))
sim_numbers(type = c("r", "cp", "r"), values = c(NA,NA,3i))
}

## simulate 10 reals with the default generators
sim_numbers(rep("r", 10))

## simulate modulus from Rayleigh distribution
##
rR <- function(n, sigma = 1) sigma * sqrt(-2*log(runif(n)))
sim_numbers(type = c("cp", "cp"), absgen = rR, absarg = list())

# test the the components are N(0,1)
## (not run to save time for CRAN check)
## \dontrun{
## v <- sim_numbers(type = rep("cp", 10000), absgen = "rR",
##                  absarg = list(sigma = 1))
## ks.test(Re(v$values), "pnorm")
## ks.test(Im(v$values), "pnorm")
## }
}
\keyword{ distribution }
\keyword{simulation}
