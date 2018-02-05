## 2017-10-04 - moved =plotpdf= and cdf2q from mixAR to qbutils.
## 2017-10-05 - renamed cdf2q to cdf2quantile

plotpdf <- function(pdf, qdf, cdf, lq = 0.01, uq = 0.99, ...){
    if(missing(qdf) && !missing(cdf))
        qdf <- function(q){
            cdf2quantile(q, cdf)
        }

    from <- qdf(lq)
    to <- qdf(uq)
    plot(pdf, from = from, to = to, ...)
}

## 2017-10-04 - new arguments interval, lower, upper
cdf2quantile <- function(p, cdf, interval = c(-3, 3),
                  lower = min(interval), upper = max(interval), ...){
    f <- function(x, ...){
        cdf(x, ...) - p
    }
                               ## 2017-10-04 was: limits <- c(-10000,10000)
                               ##                 wrk <- uniroot(f, limits, ...)
    wrk <- uniroot(f, lower = lower, upper = upper, extendInt = "upX", ...)
    res <- wrk$root
    # 2012-10-17 commented out: cat("res is: ", res, "\n")
    res
}
