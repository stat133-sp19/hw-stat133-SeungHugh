## Overview

`"binomial"` is a minimal [R](http://www.r-project.org/) package which includes functions about binomial distribution.
  - `bin_choose(n, k)` : $nCk$ $\binom n k$ n choose k
  - `bin_probability(success, trials, prob)` : $P(X = success)$ where $X~B(trials, prob)$
  - `bin_distribution(trials, prob)` : binomial distribution table
  - `bin_cumulative(trials, prob)` : additional column with cumulative probability of binomial ditribution table
  
  - `bin_variable(trials, prob)` : summary of below 5 functions with trials and prob
    - `bin_mean(trials, prob)` : binomial mean 
    - `bin_variance(trials, prob)` : binomial variance
    - `bin_mode(trials, prob)` : binomial mode
    - `bin_skewness(trials, prob)` : binomial skewnewss
    - `bin_kurtosis(trials, prob)` : binomial kurtosis

## Motivation

This package has been developed to provide functions for binomial distribution

## Installation

Install the development version from GitHub via the package
`"devtools"`:

``` r
# development version from GitHub:
#install.packages("devtools") 

# install "cointoss" (without vignettes)
devtools::install_github("stat133-sp19/hw-stat133-SeungHugh/binomial")

# install "cointoss" (with vignettes)
devtools::install_github("stat133-sp19/hw-stat133-SeungHugh/binomial", build_vignettes = TRUE)
```

## Usage

``` r
library(binomial)

# Get E(X) where X ~ B(n, p)
bin_E <- bin_mean(trials = 100, prob = 0.5)
bin_E
#> object double
#> return 50

# Get Var(X) where X ~ B(n, p)
bin_V <- bin_variance(trials = 100, prob = 0.5)
bin_V 
#> object double
#> return 25

# Get Mode of X where X ~ B(n, p)
bin_M <- bin_mode(trials = 100, prob = 0.5)
bin_M
#> object integer
#> return 50

# Get skewness of X where X ~ B(n, p)
bin_S <- bin_skewness(trials = 100, prob = 0.3)
bin_S
#> object double
#> return 0.08728716

# Get Kurt(X) where X ~ B(n, p)
bin_K <- bin_kurtosis(trials = 100, prob = 0.3)
bin_K
#> object double
#> return -0.01238095

# Get summary of binomial functions
bin1 <- bin_variable(trials = 10, prob = 0.3)
bin1
summary(bin1)

# Get binomial distribution
dis1 <- bin_distribution(trials = 5, prob = 0.5)
dis1

# Get binomial distribution with additional cumulative probability column
dis2 <- bin_cumulative(trials = 5, prob = 0.5)
dis2

# Get histogram of a binomial distribution
plot(dis1)

# Get graph of a cumulative distribution
plot(dis2)
```
