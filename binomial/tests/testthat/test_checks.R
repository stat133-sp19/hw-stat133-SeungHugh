context("Tests Binomials")

test_that("checkers work with normal input", {
  expect_true(check_prob(0))
  expect_true(check_prob(1))
  expect_type(check_prob(0.7), "logical")

  expect_true(check_trials(100))
  expect_type(check_trials(100), "logical")
  expect_equal(check_trials(100), TRUE)

  expect_true(check_success(50, 100))
  expect_type(check_success(50, 100), "logical")
  expect_equal(check_success(50, 100), TRUE)
})


test_that("checkers work with invalid input", {
  expect_error(check_prob(1.2))
  expect_error(check_prob(-0.5))
  expect_error(check_prob(-0.001))

  expect_error(check_trials(-1))
  expect_error(check_trials(-10))
  expect_error(check_trials(-100))

  expect_error(check_success(-10, -10))
  expect_error(check_success(-10, 10))
  expect_error(check_success(10, -10))
})


test_that("checkers work with valid input independently but not for each other", {
  expect_error(check_success(5, 3))
  expect_error(check_success(100, 50))
})


test_that("auxes yield vaild type", {
  expect_type(aux_mean(10, 0.3), "double")
  expect_type(aux_variance(10, 0.3), "double")
  expect_type(aux_mode(10, 0.3), "integer")
  expect_type(aux_skewness(10, 0.3), "double")
  expect_type(aux_kurtosis(10, 0.3), "double")

  expect_length(aux_mean(10, 0.3), 1)
  expect_length(aux_variance(10, 0.3), 1)
  expect_length(aux_mode(10, 0.3), 1)
  expect_length(aux_skewness(10, 0.3), 1)
  expect_length(aux_kurtosis(10, 0.3), 1)

  expect_equal(aux_mean(10, 0.3), 3)
  expect_equal(aux_variance(10, 0.3), 2.1)
  expect_equal(aux_mode(10, 0.3), 3)

  expect_is(aux_skewness(10, 0.3), "numeric")
  expect_is(aux_kurtosis(10, 0.3), "numeric")

})


test_that("bins yield warning or error", {
  expect_warning(bin_cumulative(5, 0.5))
  expect_warning(bin_distribution(5, 0.5))
  expect_warning(bin_choose(5, -5))

  expect_error(bin_choose(3, 5))
  expect_error(bin_choose(-5, 3))
  expect_error(bin_probability(5, 3, 0.5))
  expect_error(bin_probability(-3, 5, 0.3))
  expect_error(bin_probability(3, -5, 0.3))
  expect_error(bin_probability(3, 5, -0.3))

  expect_error(bin_distribution(-10, 0.5))
  expect_error(bin_distribution(10, -0.5))

  expect_error(bin_cumulative(-10, 0.5))
  expect_error(bin_cumulative(10, -0.5))
})
