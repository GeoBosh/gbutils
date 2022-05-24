\name{isNA}
\alias{isNA}
\title{Check if an object is NA}
\description{
  Check if an object is NA. Always return TRUE of FALSE, a logical
  vector of length one.
}
\usage{
isNA(x)
}
\arguments{
  \item{x}{any R object.}
}
\details{

  \code{isNA} returns TRUE if the argument is a single NA, i.e. it is
  atomic, has length one, and represents an NA value. In any other case
  \code{isNA} returns \code{FALSE}. 

  \code{isNA} is suitable for use in conditional constructs since it
  always returns a single value which is never NA.

  Note that \code{identical()} distinguishes different types of NA,
  i.e. \code{identical(x, NA)} is TRUE only if \code{x} is NA (logical).

}
\note{

  The requirement that \code{x} is atomic means that
  \code{isNA(list(NA))} gives \code{FALSE}.

  For comparison, \code{is.na(list(NA))} gives \code{TRUE}.  The same
  holds for classed lists, such as \code{is.na(structure(list(NA), class
  = "myclass"))}.

}
\value{
  TRUE or FALSE
}
\author{Georgi N. Boshnakov}
\seealso{
 \code{\link{isTRUE}}, \code{\link{is.na}},  \code{\link{identical}}
}
\examples{
v <- c(1, NA, 3)
isNA(v[2]) # TRUE

## a vector of two or more Na's is not isNA
isNA(rep(NA,3)) # FALSE

## a list containing NA is not isNA
isNA(list(NA)) # FALSE
## ... but
is.na(list(NA))  # TRUE

## identical() distinguishes different types of NA:
class(v) # "numeric", not "integer"

identical(v[2], NA)          # FALSE, NA on its own is "logical"
identical(v[2], NA_integer_) # FALSE
identical(v[2], NA_real_)    # TRUE


vi <- c(1L, NA_integer_, 3L)
isNA(vi[2]) # TRUE

class(vi) # "integer"
identical(vi[2], NA_integer_) # TRUE
identical(vi[2], NA_real_)    # FALSE

## is.na(NULL) would give a warning
isNA(NULL) # FALSE

## a length zero object is not NA, so isNA() returns FALSE:
isNA(logical(0)) # FALSE

## is.na() has a different remit and returns a 0-length vector:
is.na(logical(0))  # logical(0)
}
\keyword{NA}
\keyword{logic}
\keyword{manip}

