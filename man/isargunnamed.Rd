\name{isargunnamed}
\alias{isargunnamed}
\title{ Is an element of a list named? }
\description{
  Check if a component of a list is not named.
}
\usage{
isargunnamed(x, k)
}
\arguments{
  \item{x}{ a list. }
  \item{k}{ an integer, specifies a position in \code{x}. }
}
\details{
  \code{isargunnamed(x,k)} returns TRUE if the k-th component of
  \code{x} is not named and FALSE otherwise.

  Argument \code{x} is typically a list of arguments used in a call
  to a function, such as the one obtained by \code{list(...)} in the
  body of a function definition.

  If \code{k} is not positive, \code{isargunnamed} returns FALSE.
}

\value{
  TRUE or FALSE
}
\author{Georgi N. Boshnakov}
%\note{ }
\seealso{\code{\link{match.call}} in base package}
\examples{
li1 <- list(a=1, 2, 3)
isargunnamed(li1, 1)
isargunnamed(li1, 2)

## wholly unnamed list
li2 <- list(1, 2, 3)
isargunnamed(li2, 1)
isargunnamed(li2, 2)

## using in a function definition
f1 <- function(...){
    dots <- list(...)
    for(i in seq(along=dots))
        cat(i, isargunnamed(dots, i), "\n")
}

f1(1)
f1(a = 3, 4, c = 5)
f1(x = "a", y = "b")
}
\keyword{programming}





