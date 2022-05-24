\name{rpoly}
\alias{rpoly}
\title{Polynomials with real coefficients}
\description{

  Compute the coefficients of a polynomial with real coefficients, given
  its real zeroes (roots) and one representative for each complex pair.
  If complex numbers are given in polar form, there is an option to
  specify the complex arguments as multiples of \eqn{\pi}. 

}
\usage{
rpoly(x = numeric(0), arg = numeric(0), real = numeric(0), argpi = FALSE,
      monic = TRUE)
}
\arguments{
  \item{x}{

    if \code{complex}, the roots (including the real ones), otherwise
    the moduli of the complex roots of the polynomial.  In both cases
    only one representative for each complex pair should be included.

  }
  \item{arg}{

    the complex arguments corresponding to the moduli in \code{x}. This
    argument is not needed when \code{x} is complex.

  }
  \item{real}{
    
    the real roots of the polynomial. This argument is not needed when
    \code{x} is complex.

  }
  \item{argpi}{

    if \code{TRUE}, then \code{arg} represents the complex arguments as
    a multiple of \eqn{\pi}, see section \sQuote{Details}. The default
    is \code{FALSE}.
    
  }
  \item{monic}{

    if \code{TRUE}, the default, the coefficient of the highest term of
    the polynomialis is set to 1. if \code{FALSE}, the constant term is
    one.

  }
}
\details{

  The complex zeroes of polynomials with real coefficients come in
  complex conjugated pairs. Only one representative from each pair
  should be supplied to \code{rpoly}. The other is added
  automatically. Of course, all real roots should be supplied, if any.

  If \code{x} is complex, it should contain all real roots and one
  representative for each comple pair.

  Otherise, if \code{x} is not complex, it contains the moduli of the
  numbers and \code{arg} contains the complex arguments. The two should
  be of equal length.

  With the default \code{FALSE} for \code{argpi}, the k-th root of the
  polynomial is \code{x[k]*cos(arg[k]) + i*x[k]*sin(arg[k])}.  If
  \code{argpi} is \code{TRUE} it is \code{x[k]*cos(pi*arg[k]) + i*x[k]*sin(pi*arg[k])}.

  By default, a monic polinomial (the coefficient of the highest order
  term is 1) is created but if \code{monic} is \code{FALSE}, the
  constant term of the polynomial is set to 1 .

  The options for \code{argpi = TRUE} and/or \code{monic = FALSE} are
  convenient in some applications, e.g., time series analysis and
  digital signal processing.
 
  %%  ~~ If necessary, more details than the description above ~~
}
\value{
  a real vector containing the coefficients of the polynomial.
}
%\references{
%%% ~put references to the literature/web site here ~
%}
\author{Georgi N. Boshnakov}
\note{

  When \code{argpi} is \code{TRUE}, \eqn{\cos(\pi a)} is computed using
  \code{cospi(a)}. So this may differ slightly from the equivalent
  result obtained with \code{argpi = FALSE} and \code{b = pi*a}, which
  is computed as  \code{cos(b) = cos(pi*a)}, see the example.

}
%
%%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
  \code{\link{sim_numbers}}
}
\examples{
## z-1
rpoly(real = 1)

## roots 1, i, -i;  p3(z) = (z-1)(z-i)(z+i)
p3 <- rpoly(c(1, 1i))
p3
polyroot(p3)

## using polar for the complex roots (i = e^(i pi/2))
p3a <- rpoly(1, pi/2, real = 1)
p3a
## mathematically, p3a is the same as p3
## but the numerical calculation here gives a slight discrepancy
p3a == p3
p3a - p3

## using argpi = TRUE is somewhat more precise:
p3b <- rpoly(1, 1/2, real = 1, argpi = TRUE)
p3b
p3b == p3
p3b - p3
## indeed, in this case the results for p3b and p3 are identical:
identical(p3b, p3)

## two ways to expand (z - 2*exp(i*pi/4))(z - 2*exp(-i*pi/4))
rpoly(2, pi/4)
rpoly(2, 1/4, argpi = TRUE)

## set the constant term to 1; can be used, say, for AR models
rpoly(2, pi/4, monic = FALSE)
rpoly(2, 1/4, argpi = TRUE, monic = FALSE)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
