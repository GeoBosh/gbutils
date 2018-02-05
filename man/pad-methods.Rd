\name{pad-methods}
\docType{methods}
\alias{pad}
\alias{pad<-}
\alias{pad-methods}
\alias{pad,ANY,ANY-method}
\alias{pad,ANY,missing-method}
\alias{pad,objectPad,missing-method}
\alias{pad,objectPad,ANY-method}
\alias{padcheck}
\title{
  Store and get data in pad objects
}
\description{
  Get and store information in a pad.  \code{pad} can be used on the
  lefthand side of an assignment to store information in an object and
  as normal function call to retrieve previously stored information.
}
\usage{
pad(x, item)
pad(x, item, ...) <- value
}
\arguments{
  \item{x}{ the object where the information is stored. }
  \item{item}{ the \code{item} to be stored or extracted. }
  \item{value}{ the value to be stored }
  \item{...}{ additional arguments (??? are these  really possible? !!!) }
}
\details{
  This is a generic function. There are methods for \code{x} of class
  \code{objectPad}. The generic works with the slot \code{pad} of
  \code{x}.  Currently there is no check if there is one.

  To remove an item use \code{pad(x,item) <- NULL}. So, by definition,
  items may not have the value \code{NULL}.

  \code{padcheck} checks if \code{item} has a value and if so returns
  \code{TRUE}. Otherwise it returns \code{FALSE}.

}
\value{
  The requested item.

  If \code{item} is missing a named list containing all stored items.
}
\section{Methods}{
\describe{

\item{x = "objectPad", item = "missing"}{
	get all items stored in the pad \code{x}, as a named list. }

\item{x = "objectPad", item = "ANY"}{
	get the requested \code{item} from the pad \code{x}. }

\item{x = "ANY", item = "missing"}{
	get all items stored in the pad of \code{x} as a named list. }

\item{x = "ANY", item = "ANY"}{
	get the requested \code{item} from the pad of \code{x}. }

}}
\author{ Georgi N. Boshnakov }
\seealso{
  \code{\linkS4class{objectPad}}
}
%\keyword{methods}
\keyword{internal}
