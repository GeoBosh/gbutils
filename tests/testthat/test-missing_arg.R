test_that("missing_arg works", {
    lmargs <- formals(lm)
    class(lmargs) # pairlist
    expect_true(missing_arg(lmargs$data))
})
