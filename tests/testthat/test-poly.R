test_that("rpoly works ok", {
    ## z-1
    expect_equal(rpoly(real = 1), c(-1,1))

    ## roots 1, i, -i;  p3(z) = (z-1)(z-i)(z+i)
    p3 <- rpoly(c(1, 1i))
    p3

    ## using polar for the complex roots (i = e^(i pi/2))
    p3a <- rpoly(1, pi/2, real = 1)
    expect_equal(p3a, c(-1, 1, -1, 1))

    ## mathematically, p3a is the same as p3
    ## but the numerical calculation here gives a slight discrepancy
    ##     p3a == p3 # [1]  TRUE FALSE FALSE  TRUE
    ##     p3a - p3  # [1]  0.000000e+00  2.220446e-16 -2.220446e-16  0.000000e+00
    ## Note: expect_equal ignores this small difference
    
    ## using argpi = TRUE is somewhat more precise:
    ##     p3b <- rpoly(1, 1/2, real = 1, argpi = TRUE)
    ##     p3b
    ##     expect_equal(p3b, c(-1, 1, -1, 1))
    ##     p3b == p3          # [1] TRUE TRUE TRUE TRUE
    ##     p3b - p3           # [1] 0 0 0 0
    ##     ## indeed, in this case the results for p3b and p3 are identical:
    ##     identical(p3b, p3) # TRUE

    ## two ways to expand (z - 2*exp(i*pi/4))(z - 2*exp(-i*pi/4))
    rpoly(2, pi/4)
    rpoly(2, 1/4, argpi = TRUE)

    ## set the constant term to 1; can be used, say, for AR models
    rpoly(2, pi/4, monic = FALSE)
    rpoly(2, 1/4, argpi = TRUE, monic = FALSE)
    
})
