# You can learn more about package authoring with RStudio at:
#
#   http://r-pkgs.had.co.nz/
#
# Some useful keyboard shortcuts for package authoring:
#
#   Build and Reload Package:  'Cmd + Shift + B'
#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'


#####################
# private functions #
#####################

# Private function to check whether prob is valid or not
check_prob <- function(prob) {
  if (prob > 1 | prob < 0)
    stop("p has to be a number between 0 and 1")
  return(TRUE)
}

# Private function to check whether trials is valid or not
check_trials <- function(trials) {
  if (trials < 0)
    stop("invalid trials value")
  return(TRUE)
}

# Private function to check whether success and trials are valid or not
check_success <- function(success, trials) {
  if (sum(success < 0))
    stop("invalid success value")
  if (sum(success > trials))
    stop("success cannot be greater than trials")
  return(TRUE)
}

# Private function to check mean
aux_mean <- function(trials, prob) trials * prob

# Private function to check vaiance
aux_variance <- function(trials, prob) trials * prob * (1 - prob)

# Private function to check mode
aux_mode <- function(trials, prob) as.integer(prob * (1 + trials))

# Private function to check skewness
aux_skewness <- function(trials, prob) (1 - (2 * prob)) / ((trials * prob * (1 - prob))^0.5)

# Private function to check kurtosis
aux_kurtosis <- function(trials, prob) (1 - (6 * prob * (1 - prob))) / (trials * prob * (1 - prob))



##################
# main functions #
##################

#' @title bin_choose
#' @description calculate n choose k
#' @param n number of trial
#' @param k number of success
#' @return nCk
#' @export
#' @examples
#' bin_choose(3, 2)
#' bin_choose(5, 1:3)
#' bin_choose(5, 0)
bin_choose <- function(n, k) {
  if (n < k)
    stop("k cannot be greater than n")
  return(factorial(n) / (factorial(k) * factorial(n - k)))
}

#' @title bin_probability
#' @description calculate Pr(X = success)
#' @param success number of success (k)
#' @param trials number of trials (n)
#' @param prob probability (p)
#' @return P(X = k)
#' @export
#' @examples
#' bin_probability(0:2, 5, 0.5)
#' bin_probability(2, 5, 0.5)
#' bin_probability(55, 100, 0.45)
bin_probability <- function(success, trials, prob) {
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)
  return(bin_choose(trials, success) * (prob^success) * ((1 - prob)^(trials - success)))
}

#' @title bin_distribution
#' @description calculate binomial distribution
#' @param trials number of trials (n)
#' @param prob probability (p)
#' @return dataframe of distribution
#' @export
#' @examples
#' bin_distribution(5, 0.5)
bin_distribution <- function(trials, prob) {
  bin_dist <- data.frame(success = 0:trials,
                         probability = bin_probability(0:trials, trials, prob))
  class(bin_dist) <- c("bindis", "data.frame")
  return(bin_dist)
}

#' @export
plot.bindis <- function(bin_df) barplot(bin_df$probability, names.arg = 0:(nrow(bin_df) - 1), xlab = "success", ylab = "probability")

#' @title bin_cumulative
#' @description calculate both binomial distribution and binomial cumulative distribution
#' @param trials number of trials (n)
#' @param prob probability (p)
#' @return dataframe of distributions
#' @export
#' @examples
#' bin_cumulative(5, 0.5)
bin_cumulative <- function(trials, prob) {
  bp <- bin_probability(0:trials, trials, prob)
  bin_cumu <- data.frame(success = 0:trials,
                         probability = bp,
                         cumulative = cumsum(bp))
  class(bin_cumu) <- c("bincum", "data.frame")
  return(bin_cumu)
}


#' @export
plot.bincum <- function(bincum_df) plot(x = bincum_df[, 1], y = bincum_df[, 3], type = 'o', xlab = "successes", ylab = "probability")


#' @title bin_variable
#' @description  get binomial random variable object
#' @param trials number of trials (n)
#' @param prob probability (p)
#' @return list of number of trials and probability of success
#' @export
#' @examples
#' bin_variable(10, 0.3)
bin_variable <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  bv <- list(trials = trials,
             prob = prob)
  class(bv) <- "binvar"
  return(bv)
}

#' @export
print.binvar <- function(x, ...) {
  writeLines('"Binomial variable"\n')
  writeLines("Paramaters")
  cat(sprintf('- number of trials: %s \n', x["trials"]))
  cat(sprintf('- prob of success : %s \n', x["prob"]))
  invisible(x)
}

#' @export
summary.binvar <- function(x, ...) {
  x_t <- x[["trials"]]
  x_p <- x[["prob"]]
  sbv <- list(trials = x_t,
              prob = x_p,
              mean = aux_mean(x_t, x_p),
              variance = aux_variance(x_t, x_p),
              mode = aux_mode(x_t, x_p),
              skewness = aux_skewness(x_t, x_p),
              kurtosis = aux_kurtosis(x_t, x_p))
  class(sbv) <- "summary.binvar"
  return(sbv)
}

#' @export
print.summary.binvar <- function(x, ...) {
  writeLines('"Summary Binomial"\n')
  writeLines("Parameters")
  cat(sprintf('- number of trials: %s \n', x["trials"]))
  cat(sprintf('- prob of success : %s \n\n', x["prob"]))
  writeLines("Measures")
  cat(sprintf('- mean    : %s \n', x["mean"]))
  cat(sprintf('- variance: %s \n', x["variance"]))
  cat(sprintf('- mode    : %s \n', x["mode"]))
  cat(sprintf('- skewness: %s \n', x["skewness"]))
  cat(sprintf('- kurtosis: %s \n', x["kurtosis"]))
  invisible(x)
}


#' @title bin_mean
#' @description  calculate mean of binomial distribution
#' @param trials number of trials (n)
#' @param prob probability (p)
#' @return mean of binomial distribution
#' @export
#' @examples
#' bin_mean(10, 0.3)
bin_mean <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  ret <- aux_mean(trials, prob)
  return(ret)
}

#' @title bin_variance
#' @description  calculate variance of binomial distribution
#' @param trials number of trials (n)
#' @param prob probability (p)
#' @return variance of binomial ditribution
#' @export
#' @examples
#' bin_variance(10, 0.3)
bin_variance <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  ret <- aux_variance(trials, prob)
  return(ret)
}

#' @title bin_mode
#' @description  calculate the greater integer less than or equal to np + p
#' @param trials number of trials (n)
#' @param prob probability (p)
#' @return mode which is based on trials n and probability p
#' @export
#' @examples
#' bin_mode(10, 0.3)
bin_mode <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  ret <- aux_mode(trials, prob)
  return(ret)
}

#' @title bin_skewness
#' @description  calculate skewness of binomial distribution
#' @param trials number of trials (n)
#' @param prob probability (p)
#' @return skewness of binomial distribution
#' @export
#' @examples
#' bin_skewness(10, 0.3)
bin_skewness <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  ret <- aux_skewness(trials, prob)
  return(ret)
}

#' @title bin_kurtosis
#' @description  calculate kurtosis of binomial distribution
#' @param trials number of trials (n)
#' @param prob probability (p)
#' @return kurtosis of binomial distribution
#' @export
#' @examples
#' bin_kurtosis(10, 0.3)
bin_kurtosis <- function(trials, prob) {
  check_trials(trials)
  check_prob(prob)
  ret <- aux_kurtosis(trials, prob)
  return(ret)
}
