\name{missing_arg}
\alias{missing_arg}
\title{Check if an element of a pairlist is missing}
\description{Check if an element of a pairlist is missing.}
\usage{
missing_arg(arg)
}
\arguments{
  \item{arg}{the object to test.}
}
\details{

  The argument passed to \code{missing_arg} is typically an element of a
  \code{pairlist} or the list produced by \code{alist()}. \code{missing_arg}
  returns \code{TRUE} if it is missing and \code{FALSE} otherwise.

  Objects of type \code{pairlist} come up at R level almost exclusively
  as the formal arguments of functions. \code{missing_arg} can be useful
  when they are manipulated programmatically.

}
\value{
  TRUE or FALSE
}
\author{Georgi N. Boshnakov}
%\seealso{
%%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
lmargs <- formals(lm)
class(lmargs) # pairlist
missing_arg(lmargs$data)
## which arguments of lm() have no (explicit) defaults?
sapply(lmargs, missing_arg)

## This gives an error:
## pairlist(x = 3, y = , z = 5)

## an example with alist()
pl2 <- alist(a = "", b = , c = 3)
class(pl2) # list
## this shows that 'b' is missing, 'a' and 'c' are not:
sapply(pl2, missing_arg) # FALSE  TRUE FALSE
## superficially, 'b' is equal to the empty string:
pl2[[2]]
sapply(pl2, function(x) x == "") # TRUE  TRUE FALSE

## with pairlist the results are the same:
g <- function(a = "", b, c = 3) NULL
a.g <- formals(g)
class(a.g) # pairlist
sapply(a.g, missing_arg) # FALSE  TRUE FALSE
a.g[[2]]
sapply(a.g, function(x) x == "") # TRUE  TRUE FALSE
}
\keyword{programming}
