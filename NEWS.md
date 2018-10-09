# Changes in Version 0.4-1

* minor edit of documentation of `adjacencyOfClasses()`.

* in field Collate in DESCRIPTION, bundle all file names on a single lines to
  enable building website with pkgdown (see pkgdown issue #836).

# Changes in Version 0.4-0 (CRAN)


# Changes in Version 0.3-1

* deal with a NOTE on CRAN.

* new function `pseudoInverse()` (moved here from package mixAR).

* new examples for converting results of `adjacencyOfClasses()` to graph objects
  and plotting them.


# Changes in Version 0.2-4 - 0.3.0 (CRAN)

* new function `adjacencyOfClasses()` gives the graph of the classes defined in
  one or more packages in several ways. It can also give a Wolfram language
  expression which can be evaluated in Mathematica, see the help page for
  details and examples.
  
* use Rd macro `\printExample` from package `Rdpack` for some examples in
  details section (see `adjacencyOfClasses()`). 


# Changes in Version 0.2-3

* created `README.*`.
* added website created with 'pkgdown'.
* added github URL to DESCRIPTION.


# Changes in Version 0.2-2

* corrected a couple of typo's in the vignette.


# Changes in Version 0.2-1 (CRAN)

* New function `missing_arg()` returns TRUE if an element of a pairlist is
  missing.

* New function `plotpdf()` plots probability density and related functions over
  automatically selected intervals (based on cdf of qf).

* New function `cdf2quantile()` numerically computes quantiles of a given cdf.
  This is mainly for use by `plotpdf()`.

* A vignette illustrates `plotpdf()`.


# Changes in Version 0.2-0 (CRAN)

* First CRAN version
