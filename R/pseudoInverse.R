## moved here from package mixAR
pseudoInverse <- function(a, tol = 1e-7){  # todo: think about the default for 'tol'.
    asvd <- svd(a)
    asvd$d[asvd$d < tol] <- Inf   # so that 1/Inf = 0, see below
    if(length(asvd$d)>1)
        asvd$v %*% diag(1/asvd$d) %*% t(asvd$u)
    else
        asvd$v %*%  t(asvd$u) / asvd$d    # krapka
}

