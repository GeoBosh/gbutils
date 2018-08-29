\name{pseudoInverse}

\alias{pseudoInverse}

%- Also NEED an '\alias' for EACH other topic documented here.

\title{Compute a pseudo-inverse matrix}

\description{Compute a pseudo-inverse matrix using singular value
  decomposition and setting very small singular values to zero.}

\usage{
pseudoInverse(a, tol = 1e-07)
}

%- maybe also 'usage' for other objects documented here.

\arguments{
  \item{a}{a matrix}
  \item{tol}{a number, the threshold for non-zero singular values.}
}

\details{

  The singular value decomposition of \code{a} is computed and singular
  values smaller than \code{tol} are set to zero. The result is formed
  using the standard formula.

}

\value{
  a matrix
}

%\references{
%%% ~put references to the literature/web site here ~
%}
%
%\author{
%%%  ~~who you are~~
%}
%
%\note{
%%%  ~~further notes~~
%}
%
%
%%% ~Make other sections like Warning with \section{Warning }{....} ~
%
%
%\seealso{
%%% ~~objects to See Also as \code{\link{help}}, ~~~
%}

\examples{
##---- Should be DIRECTLY executable !! ----
}

% Add one or more standard keywords, see file 'KEYWORDS' in the

% R documentation directory.

\keyword{math}
