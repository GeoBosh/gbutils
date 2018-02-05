\name{raw_history}
\alias{raw_history}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Get the command history }
\description{ Get the command history.}
\usage{
raw_history()
}
%- maybe also 'usage' for other objects documented here.
\details{
  The command history is saved to a temporary file with
  \code{savehistory} and read back into a character vector.
}
\value{
  a character vector
}
\author{Georgi N. Boshnakov}
%\note{
%%%  ~~further notes~~
%}
%
%%% ~Make other sections like Warning with \section{Warning }{....} ~
%
%\seealso{
%%% ~~objects to See Also as \code{\link{help}}, ~~~
%}
\examples{
\dontrun{
hist <- raw_history()
length(hist)
}
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{programming}
