test_that("isNA works", {
    expect_identical(isNA(list(NA)), FALSE)  # not atomic
    expect_identical(isNA(c(NA, NA)), FALSE) # length > 1
    expect_identical(isNA(1), FALSE)         # not NA

    expect_identical(isNA(NA),          TRUE)    
    expect_identical(isNA(NA_integer_), TRUE)    
    expect_identical(isNA(NA_real_),    TRUE)    
})

