<!-- badges: start -->
[![CRANStatusBadge](http://www.r-pkg.org/badges/version/gbutils)](https://cran.r-project.org/package=gbutils)
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/gbutils)](https://www.r-pkg.org/pkg/gbutils)
[![CRAN RStudio mirror downloads](https://cranlogs.r-pkg.org/badges/grand-total/gbutils?color=blue)](https://r-pkg.org/pkg/gbutils)
[![R-CMD-check](https://github.com/GeoBosh/gbutils/workflows/R-CMD-check/badge.svg)](https://github.com/GeoBosh/gbutils/actions)
<!-- badges: end -->

Simulate real and complex numbers from distributions of their magnitude and
arguments. Optionally, the magnitudes and/or arguments may be fixed in almost arbitrary
ways. Plot density and distribution functions with automatic selection of suitable regions.
Small programming utilities: check if an object is identical to NA, count positional
arguments in a call, set intersection of more than two sets, check if an argument is unnamed, 
compute the graph of S4 classes in packages.


# Installing gbutils

The [latest stable version](https://cran.r-project.org/package=gbutils) is on CRAN. 

    install.packages("gbutils")

You can install the [development version](https://github.com/GeoBosh/gbutils) of `gbutils` from Github:

    library(devtools)
    install_github("GeoBosh/gbutils")


# Overview

Package `gbutils` is a collection of (mostly small) functions used interactively
or in packages.


## Numeric computations

-   `sim_numbers()`, `sim_complex()`, `sim_real()` - Simulate real or complex
    numbers from (possibly partial) polar form specifications.

-   `cdf2quantile()` - Compute quantiles from a given distribution function.

-   `pseudoInverse()` - Compute pseudo-inverse matrices.

-   `rpoly()` - create polynomials with real coefficients from zeroes (roots) given in
    Cartesian or polar form.


## Graphics

-   `plotpdf()` - Plot functions with automatic determination of the "interesting"
    region (typically probability density and distribution functions)


## S4 classes

-   `adjacencyOfClasses()` - Create inheritance graphs of S4 classes defined in
    one or more packages.


## Programming utilities

-   `isNA()` - Is an object NA?

-   `isargunnamed()` - Is an element of a list named?

-   `missing_arg()` - Is an element of a pairlist missing?

-   `parse_text()` - Parse expressions.

-   `nposargs()` - Count the number of positional arguments used in a call.

-   `shiftleft()` `shiftright()` - Rotate vectors.


## Other

-   `mintersect()` - Set intersection of arbitrary number of arguments.

-   `myouter()` - Outer product using a non-vectorised function.

-   `raw_history()` Get the command history in a character vector.

