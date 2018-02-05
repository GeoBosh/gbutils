\name{mintersect}
\alias{mintersect}
\title{Set intersection of arbitrary number of arguments}
\description{Set intersection of arbitrary number of arguments.}
\usage{
mintersect(...)
}
\arguments{
  \item{\dots}{arguments to be intersected, vectors of the same mode,
    see \code{intersect}.}
}
\details{
  The base \R function \code{intersect} is a binary
  operation. \code{mintersect} works with any positive number of
  arguments.

  If called with one argument, \code{mintersect} returns it. This is
  unlike \code{intersect} which gives an error in this case.

  Calling \code{mintersect} with no arguments is an error (as it is for
  \code{intercect}).

}
\value{
  a vector representing the intersection of the arguments
}
% \references{
% %% ~put references to the literature/web site here ~
% }
\author{Georgi N. Boshnakov}
% \note{
% %%  ~~further notes~~
% }
%
% %% ~Make other sections like Warning with \section{Warning }{....} ~
%
% \seealso{
% %% ~~objects to See Also as \code{\link{help}}, ~~~
% }
\examples{
mintersect(1:20, 3:18, 7:12)
mintersect(letters[1:20], letters[3:18], letters[7:12])
mintersect(1:4)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{programming}
