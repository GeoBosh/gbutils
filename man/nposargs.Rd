\name{nposargs}
\alias{nposargs}
\title{ Function to count the number of positional arguments used in a call }
\description{
  Calculates the number of positional arguments used in a call.
}
\usage{
nposargs(x, a = FALSE)
}
\arguments{
  \item{x}{ a call object, usually obtained from \code{sys.call()}. }
  \item{a}{
    if \code{a[1]} is \code{TRUE} make a correction to distinguish
    \code{x[]} from \code{x[i]}, see details.
  }
}
\details{

  \code{nposargs} is mainly for use in the body of function definitions,
  paricularly for functions or methods that wish to mimic the behaviour
  of \code{"["}.

  \code{nposargs} gives the number of positional arguments used in a
  call. It also takes into account empty arguments like those used in
  expressions like \code{x[1, ]}.

  Optionally, it makes a particular correction that is peculiar
  for "[" - if there are no named arguments in the call and the count
  of the arguments is 2 and \code{a[1]=TRUE}, it decreases the count by
  one, i.e. returns 1. This is to distinguish between a \code{x[]} and
  \code{x[i]} which both would give 2 otherwise. I have forgotten the details but,
  roughly speaking, x[i] becomes "["(x,i) while x[] becomes "["(x,),
  i.e. \R puts the comma after x in any case.

}
\value{
  the number of positional arguments in the call
}
\author{Georgi N. Boshnakov}
\note{
  I wrote this function (a long time ago) for use in methods for
  \code{"["}.

  \code{a[1]} above is typically obtained by a call \code{missing(i)}
  somewhere at the beginning of the function. In my application I put
  the results of several such calls in a vector, hence the check for
  \code{a[1]} rather than \code{a}, For \code{"["}, we may set
  \code{a = c(missing(i), missing(j), missing(k))}.

}
% \seealso{ ~~objects to See Also as \code{\link{help}}, ~~~ }
\examples{
f <- function(x,y,z,...){
    call <- sys.call()
    nposargs(call)
}
f(a,b,c)  # 3
f(a, , )  # 3
f(a,  )   # 2
f(a)      # 1
f(,  )    # 2
f(, a,  ) # 3
f()       # 0
}
\keyword{programming}
