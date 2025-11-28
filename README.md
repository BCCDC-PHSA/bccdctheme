
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bccdctheme

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/bccdctheme)](https://CRAN.R-project.org/package=bccdctheme)
<!-- badges: end -->

The goal of `bccdctheme` is to create a simple ggplot theme that can
create a consistent style for plots produced by BC CDC.

## Installation

You can install the development version of `bccdctheme` from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("BCCDC-PHSA/bccdctheme")
```

## Example

You can call the `bccdc_theme` as you would for any `ggplot` theme,

``` r
library(bccdctheme)
library(ggplot2)

g <- ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species)) + 
  bccdc_theme()

show(g)
```

<img src="man/figures/README-example-1.png" width="100%" />

You can also optionally use the theme without the logo as shown in the
following example,

``` r

g <- g <- ggplot(data = iris) +
  geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  bccdc_theme(include_logo = FALSE)

show(g)
```

<img src="man/figures/README-no_logo-1.png" width="100%" />
