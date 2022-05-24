rpoly <- function(x = numeric(0), arg = numeric(0), real = numeric(0),
                  argpi = FALSE, monic = TRUE){
    if(is.complex(x)){
        flags <- Im(x) == 0
        real <- Re(x[flags])
        
        modsq <- Mod(x[!flags]) ^ 2
        minustwoRe <- -2 * Re(x[!flags])
    }else{
        stopifnot(all(x >= 0))
        modsq <- x^2
        minustwoRe <- - 2 * x * if(argpi) cospi(arg) else cos(arg)
    }

    res <- 1
    for(k in seq_along(real)){
        res <- c(0, res) - c(real[k] * res, 0)
    }
    for(k in seq_along(modsq)){
        res <- c(0, 0, res) + c(0, minustwoRe[k] * res, 0) + c(modsq[k] * res, 0, 0)
    }
    if(monic)
        res
    else
        res / res[1]
}
