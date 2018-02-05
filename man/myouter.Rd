\name{myouter}
\alias{myouter}
\alias{shiftleft}
\alias{shiftright}
\title{ Functions for some basic operations }
\description{ Small utility functions }
\usage{
myouter(x, y, fun)
shiftleft(x, k = 1)
shiftright(x, k = 1)
}
\arguments{
  \item{x}{a vector.}
  \item{y}{a vector.}
  \item{k}{a non-negative integer.}
  \item{fun}{a function, see `Details'.}
}
\details{

 \code{myouter(x,y,fun)} computes the outer product of \code{x} and
 \code{y} using the function \code{fun}. The result is a matrix with
 \eqn{(i,j)}th element equal to \code{fun(x[i],y[j])}. It is not
 required for fun to be able to work with vector arguments. The function
 does the computations in \R using a simple double loop. So, it is a
 convenience function, not a speed improving one.

 \code{shiftright(x,k)} rotates the vector \code{x} \code{k} positions
 to the right.

 \code{shiftleft(x,k)} rotates the vector \code{x} \code{k} positions to
 the left.

}
\value{
  for \code{myouter}, a matrix, as described in `Details'

  for \code{shiftleft} and \code{shiftright}, a vector
}
%\references{ ~put references to the literature/web site here ~ }
\author{Georgi N. Boshnakov}
%\note{}
%\seealso{ \code{\link{pcAcf}} }
%\examples{
%}
\keyword{programming}
