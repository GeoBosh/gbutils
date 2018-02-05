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

  \code{isNA} returns TRUE if the argument is a single NA, i.e. it has
  length one and represents an NA value. In any other case \code{isNA}
  returns FALSE.

  \code{isNA} is suitable for use in conditional constructs since it
  always returns a single value which is never NA.

  Note that \code{identical()} distinguishes different types
  of NA, i.e. \code{identical(x, NA)} is TRUE only if \code{x} is NA
  (logical). 

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

