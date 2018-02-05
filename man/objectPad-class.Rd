\name{objectPad-class}
\docType{class}
\alias{objectPad-class}
%\alias{pad,objectPad,missing-method}
%\alias{pad,objectPad,ANY-method}
\alias{pad<-,objectPad-method}
\alias{initialize,objectPad-method}

\title{Class "objectPad" objects and methods to store and retrieve information }
\description{Objects of class "objectPad" can be used as storage of information.
  There are methods for storage and retrieval.
}
\section{Objects from the Class}{
  Objects can be created by calls of the form \code{new("objectPad",
...)}.  Currently the \code{...} arguments are ignored and an empty
object is created.

Objects of class "objectPad" have no user-level slots. Values are stored
and retrieved with the function \code{pad}, for the former purpose using
it on the left-hand side of an assignment.
}
\section{Slots}{
	 \describe{
    \item{\code{.Data}:}{Object of class \code{"list"}, inherited from \code{"list"}. }
  }
}
\section{Extends}{
Class \code{"\linkS4class{list}"}, from data part.
Class \code{"\linkS4class{vector}"}, by class "list", distance 2.
}
\section{Methods}{
  \describe{
    \item{initialize}{\code{signature(.Object = "objectPad")}: ... }
    \item{pad}{\code{signature(x = "objectPad", item = "missing")}: ... }
    \item{pad}{\code{signature(x = "objectPad", item = "ANY")}: ... }
    \item{pad<-}{\code{signature(x = "objectPad")}: ... }
  }
}
%\references{ ~put references to the literature/web site here ~ }
\author{ Georgi Boshnakov }
\note{
  The methods for this class are set to work directly on objects from
  classes that have slot \code{pad} of class \code{objectPad}.  Classes
  may define additional methods for the function \code{pad} (it is
  generic) to adapt it to their needs.

  % todo: Ne si spomnyam dali narochno napravich metodite da ne priemat
  % poveche ot edin argument za item. (Obstata fuktsiya za replacement pad<-()
  % priema ..., no analogat i pad() ne go pravi.) Zatova otkomentiram
  % nyakoi ot prmerite po-dolu.
}

\seealso{
	\code{\link{pad-methods}}
}
\examples{
# create a pad and store some info.
pa <- new("objectPad")
pad(pa,"apple") <- "fruit"
pad(pa,"sweets") <- "sweets"
# pad(pa,"apple","dentist") <- "keeps away from her/him"
# pad(pa,"sweets","dentist") <- "helps meeting her/him"
pad(pa,"young Gauss") <- 100*(100+1)/2
pad(pa,"layman") <- sum(1:100)

pad(pa,"apple")
pad(pa,"sweets")
# pad(pa,"apple","dentist")
# pad(pa,"sweets","dentist")
pad(pa,"young Gauss") - pad(pa,"layman")

# create a class of vectors with a pad
setClass("vecWithPad",representation(x="numeric",pad="objectPad"))
a <- new("vecWithPad",x=1:10)
pad(a,"mean") <- mean(a@x)    # Compute and store the mean, and
pad(a,"mean")                 # retrieve it
}
%\keyword{classes}
\keyword{internal}
