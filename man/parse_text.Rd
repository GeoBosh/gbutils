\name{parse_text}
\alias{parse_text}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Parse expressions residing in character vectors}
\description{
  Parse expressions residing in character vectors. Similar to parse() but
  keeping or not the source is controlled by an argument rather than
  global options.
}
\usage{
parse_text(text, ..., keep = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{text}{the text to parse, normally a character vector but can be
    anything that \code{parse} accepts for this artgument.}
  \item{\dots}{additional arguments to be passed on to \code{parse}.}
  \item{keep}{required setting for option \verb{keep.source}, see
    details.}
}
\details{
  This is like \code{parse(text=text,\dots)}, except that whether or not
  the source is kept is controlled by argument \code{keep}, not by
  \code{options("keep.source")}.

  \code{parse_text} sets \code{options("keep.source")} to \code{keep}
  (if they are different) before calling \code{parse} and restores it
  afterwards.

}
\value{
  an expression representing the parsed text, see \code{\link{parse}} for
  details
}
\author{Georgi N. Boshnakov}
\note{
  The usual setting of option "keep.source" in interactive sessions is
  TRUE. However, in `R CMD check' it is FALSE.

  As a consequence, if the documentation of a package uses functions
  that depend on option "keep.source" being \code{TRUE},
  then some examples may run fine when copied and pasted in an R session
  but (rightly) fail `R CMD check'.

  The oposite may also happen, in that the documentation passes `R CMD
  check' or Sweave files successfully build but some examples do not
  work when copied and pasted in an interactive session.
}
\seealso{
  \code{\link{parse}}
}
% \examples{
% }
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{programming}
