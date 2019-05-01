Binomial Package which includes functions about binomial distribution.

  - bin_choose(n, k) : $nCk$ $\binom n k$ n choose k
  - bin_probability(success, trials, prob) : $P(X = success)$ where $X~B(trials, prob)$
  - bin_distribution(trials, prob) : binomial distribution table
  - bin_cumulative(trials, prob) : additional column with cumulative probability of binomial ditribution table
  
  - bin_variable(trials, prob) : summary of below 5 functions with trials and prob
    - bin_mean(trials, prob) : binomial mean 
    - bin_variance(trials, prob) : binomial variance
    - bin_mode(trials, prob) : binomial mode
    - bin_skewness(trials, prob) : binomial skewnewss
    - bin_kurtosis(trials, prob) : binomial kurtosis
