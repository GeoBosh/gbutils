## class2Graph
## classesToAM("MonicFilterClass")
## search()
## classesToAM("ArFilter")
## classesToAM("ArFilter", abbreviate = 0)
## classesToAM("ArFilter", includeSubclasses = TRUE, abbreviate = 0)
## classesToAM("VirtualMonicFilter", includeSubclasses = TRUE, abbreviate = 0)
## classesToAM("VirtualMonicFilter", includeSubclasses = TRUE)
## classesToAM("VirtualMonicFilter", includeSubclasses = TRUE, abbreviate = 0)
## getClasses(asNamespace("sarima"))
## m <- classesToAM(getClasses(asNamespace("sarima")), includeSubclasses = TRUE, abbreviate = 0)
## dim(m)
## m
## search()
## ls(asNamespace("gbutils"))

adjacencyOfClasses <- function(packages, externalSubclasses = FALSE,
                               result = c("default", "matrixOfPairs", "adjacencyMatrix"),
                               Wolfram = FALSE){
    if(!is.character(packages))
        stop("argument 'packages' must be a character vector of names of one or more packages")
    ## !!! TODO: 'requireNamespace' may have to be changed to 'require',
    ##     since in some cases S4 classes do not become visible.
    ##     Example: 'stats4' (maybe that's the only one, since it does wicked things with base R functions)
    flags <- sapply(packages, function(pkg) !requireNamespace(pkg))
    if(any(flags))
        stop("one or more of the requested packages is not available")

    keep_externals <- externalSubclasses
    result <- match.arg(result)

    classes <- lapply(packages, function(pkg) getClasses(asNamespace(pkg)) )
    ## TODO: optionally prefix with package names?
    classes <- unlist(classes)

    am <- classesToAM(classes, includeSubclasses = rep(TRUE, length(classes)), abbreviate = 0)

    if(result ==  "adjacencyMatrix"){
        if(!keep_externals){
                # no, rectangular matrix is not standard
                # ## drop rows corresponding to external classes
                # ind0 <- rownames(am) %in% classes
                # am <- am[ind0, , drop = FALSE]
                # keep <- apply(am, 2, function(x) any(x != 0))
                # am <- am[ , keep, drop = FALSE]

            ## prune
            row0 <- ! (rownames(am) %in% classes)
            am[row0, ] <- 0
            ## remove empty
            col0 <- apply(am, 2, function(x) all(x == 0))
            if(any(row0 & col0)){
                keep <- !(row0 & col0)
                am <- am[keep, keep, drop = FALSE]
            }
        }

        cl <- rownames(am)
        if(Wolfram){
            vertices <- paste0("{", paste0(cl, collapse = ","), "}")
            ## t(am) since Wolfram interpretes the direction of the edges the other way round
            rows <- apply(t(am), 1, function(x) paste0( "{", paste0(x, collapse = ", "), "}") )
            wmat <- paste0("{", paste0(rows, collapse = ",\n"), " }\n")
            wrk <- paste0("AdjacencyGraph[", vertices, ", ", wmat,
                          ", VertexLabels -> Automatic",
                          "]")
            cat(wrk, "\n\n")
        }

        return(list(vertices = cl, AM = am))
    }

    colnam <- colnames(am)
    rownam <- rownames(am)
    included <- character(0)
    .clpair <- function(x){
        if(keep_externals || rownames(am)[x[1]] %in% classes ){
            included <<- c(included, colnam[x[2]], rownam[x[1]])
            paste0(colnam[x[2]], " -> ", rownam[x[1]])
        }else
            ""
    }

    .clpair2 <- function(x){
        if(keep_externals || rownames(am)[x[1]] %in% classes )
            c(colnam[x[2]], rownam[x[1]])
        else
            c("", "")
    }


    ind <- which(am != 0, arr.ind = TRUE)
    switch(result,
           "default" = {
               if(length(classes) == 0)
                   return(list())
               if(length(ind) > 0){
                   res <- apply(ind, 1, .clpair )
                   res <- res[res != ""]
                   names(res) <- NULL
               }else
                   res <- character(0)

               cl <- unique(c(classes, included))
               if(Wolfram){
                   vertices <- paste0("{", paste0(cl, collapse = ","), "}")
                   edges <- if(length(ind) > 0)
                                paste0("{", paste0(res, collapse = ", "), "}")
                            else
                                "{}"

                   wrk <- paste0("Graph[", vertices, ", ", edges,
                                 ", VertexLabels -> Automatic", "]")
                   cat(wrk, "\n\n")
               }
               res <- list(vertices = cl, edges = res)
           },
           "matrixOfPairs" = {
               if(length(classes) == 0)
                   return(list())
               res <- t(apply(ind, 1, .clpair2 ))
               rownames(res) <- NULL

               emptyrows <- apply(res, 1, function(x) all(x == ""))
               if(any(emptyrows)){
                keep <- !emptyrows
                res <- res[keep, , drop = FALSE]
               }

               cl <- unique(c(classes, res))

               if(Wolfram)
                   warning("currently 'Wolfram' is not implemented for matrixOfPairs, use 'default' instead")

               res <- list(vertices = cl, edges = res)
           },
           ## otherwise
           stop("the requested type of unimplemented is not implemented yet")
           )

    res
}

