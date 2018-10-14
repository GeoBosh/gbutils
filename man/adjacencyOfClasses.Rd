\name{adjacencyOfClasses}
\alias{adjacencyOfClasses}
\title{Adjacency graph of classes in packages}
\description{
  Get inheritance graph of classes in one or more packages.
}
\usage{
adjacencyOfClasses(packages, externalSubclasses = FALSE, 
                   result = c("default", "matrixOfPairs", "adjacencyMatrix"), 
                   Wolfram = FALSE)
}
\arguments{
  \item{packages}{names of one or more packages, a character vector}
  \item{externalSubclasses}{
    if \code{TRUE}, exclude subtrees of classes not defined in any of the
    packages listed in argument \code{packages}.
  }
  \item{result}{
    format of the result, can be missing or one of
    \code{"default"}, \code{"matrixOfPairs"}, \code{"adjacencyMatrix"},
    see Details. 
  }
  \item{Wolfram}{
    if \code{TRUE}, print a suitable graph expression to be run by
    Mathematica, see Details.
  }
}
\details{
  \Sexpr[stage=build,results=hide]{library("gbutils")}

  \code{adjacencyOfClasses} computes a graph representation of the
  dependencies of S4 classes defined in one or more packages (as
  specified by argument \code{package}) and returns a list.  The
  contents of the list returned by \code{adjacencyOfClasses} depend on
  argument \code{result}.  Partial matching is used for the value of
  argument \code{result}, e.g., "adj" is equivalent to
  "adjacencyMatrix".

  If \code{externalSubclasses = FALSE}, the default, subclasses defined
  outside the requested packages are excluded. This is typically what
  the user will be looking for. To get a complete tree, set
  \code{externalSubclasses} to \code{TRUE}.

  The S4 classes are represented by the vertices of the graph.
  Component \code{"vertices"} of the result gives them as a character
  vector. References below to the \eqn{i}{i-}th class or vertex
  correspond to the order in this vector. No attempt is made to arrange
  the vertices in a particular order. An empty list is returned if this
  vector is empty.
  
  If \code{result} is missing or \code{"default"}, the edges of the
  graph are represented by a character vector. Each  edge is represented
  by a string with an arrow \code{"->"} from a superclass to a
  subclass. Here is an example that shows that this package defines one
  class, which is a subclass of \code{"list"}:

  \printExample{adjacencyOfClasses("gbutils")}

  This illustrates the effect of argument \code{"externalSubclasses"}:

  \printExample{adjacencyOfClasses("gbutils", externalSubclasses = TRUE)}

  The edge, "vector -> list" was omitted in the previous example since
  this relationship is defined elsewhere. This resulted in class
  \code{"vector"} being dropped also from the vertices, since it is not
  defined in \code{"gbutils"} and none of the remaining edges contains
  it.

  If \code{result} is \code{"matrixOfPairs"}, the edges of the
  graph are represented by a character matrix with two columns, where each row 
  represents an edge from the element in the first column to the element
  in the second. In this example there is one edge, so the matrix
  contains one row:
  
  \printExample{adjacencyOfClasses("gbutils", result = "matrixOfPairs")}
  
  If \code{result} is \code{"adjacencyMatrix"}, the adjacency matrix of
  the graph is in component "AM" of the returned list. Element \eqn{(i,j)} of
  this matrix is equal to one, if the \eqn{j}{j-}th class is a superclass
  to the \eqn{i}{i-}th. In other words, the \eqn{j}{j-}th column gives the
  superclasses of the \eqn{i}{i-}th class. Here the element in position
  (1,2) is non-zero, so \code{"list"} is the superclass of \code{"objectPad"}:

  \printExample{adjacencyOfClasses("gbutils", result = "adjacencyMatrix")}
  
  Note that including the vertices in the result is not redundant, since
  some may not be in any edge. This can happen if a class does not
  have any superclasses and subclasses.
  
  As described above the result is not converted to a graph object but
  it can be fed to functions provided by a number of \R packages. 

  An additional option is to use argument \code{Wolfram}.  If
  \code{Wolfram} is \code{TRUE}, a suitable Mathematica command is
  printed. It can be evaluated in a Mathematica session (e.g., by
  copy/paste) to produce a graphical representation of the graph and/or
  be manipulated further by it. This feature is a side effect, the
  return value of \code{adjacencyOfClasses} is as controlled by the
  other arguments. For example, the return value below is as without
  argument \code{"Wolfram"} but, in addition, the printed line defines a
  Wolfram language graph in terms of its vertices and edges:

  \printExample{adjacencyOfClasses("gbutils", Wolfram = TRUE)}

  Setting \code{result = "adjacencyMatrix"} in the last \R command
  exports the graph in terms of its adjacency matrix:

  \printExample{adjacencyOfClasses("gbutils", Wolfram = TRUE, result = "adjacencyMatrix")}

}
\value{
  a list with some of the following components (as described in Details):
  \item{vertices}{a character vector of S4 class names,}
  \item{edges}{the edges of the graph, in the format controlled by
    argument \code{results} (not present when \code{result} is equal to
      \code{"adjacencyMatrix"}),}
  \item{AM}{the adjacency matrix of the graph (present only when
    \code{result} is \code{"adjacencyMatrix"}).}
}
\references{
  \insertRef{Rpackage:graph}{gbutils}

  \insertRef{Rpackage:Rgraphviz}{gbutils}

  \insertRef{Rpackage:classGraph}{gbutils}
}
\author{Georgi N. Boshnakov}
%\note{
%%%  ~~further notes~~
%}
%
%%% ~Make other sections like Warning with \section{Warning }{....} ~
%
\seealso{
  \code{?methods::classesToAM} which is used for the main computation
  here,

  \insertCiteOnly{Rpackage:classGraph;textual}{gbutils} for a suite of related functions.
  \insertCiteOnly{Rpackage:graph;textual}{gbutils} for creation and manipulation of
  graphs, and \insertCiteOnly{Rpackage:Rgraphviz;textual}{gbutils} for
  visualisation of graphs.
}
\examples{
adjacencyOfClasses("gbutils")
adjacencyOfClasses("gbutils", TRUE)

adjacencyOfClasses("gbutils", FALSE, "matrixOfPairs")
adjacencyOfClasses("gbutils", TRUE,  "matrixOfPairs")

adjacencyOfClasses("gbutils", FALSE, "adjacencyMatrix")
adjacencyOfClasses("gbutils", TRUE,  "adjacencyMatrix")

## as above, also represent the graph using the edges
adjacencyOfClasses("gbutils", Wolfram = TRUE)
adjacencyOfClasses("gbutils", TRUE, Wolfram = TRUE)

## here the graph is represented by the adjacency matrix: 
adjacencyOfClasses("gbutils", FALSE, "adjacencyMatrix", Wolfram = TRUE)
adjacencyOfClasses("gbutils", TRUE,  "adjacencyMatrix", Wolfram = TRUE)

if(requireNamespace("graph", quietly = TRUE) &&
   requireNamespace("Rgraphviz", quietly = TRUE)) withAutoprint({
    ## another package
    adjacencyOfClasses("graph")
    ac1 <- adjacencyOfClasses("graph", FALSE, "adjacencyMatrix")
    ## note the use of t() below
    gr_ac1 <- graph::graphAM(adjMat = t(ac1$AM), edgemode = "directed")
    if(require("Rgraphviz", quietly = TRUE, warn.conflicts = FALSE))
        plot(gr_ac1)
    ## more than one package
    ac2 <- adjacencyOfClasses(c("graph", "Rgraphviz"), FALSE, "adjacencyMatrix")
    gr_ac2 <- graph::graphAM(adjMat = t(ac2$AM), edgemode = "directed")
    if(require("Rgraphviz", quietly = TRUE))
        plot(gr_ac2)
})
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{programming}
\keyword{S4classes}
% use one of  RShowDoc("KEYWORDS")
