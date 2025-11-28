library(ggplot2)


test_that("bccdc_theme returns a list", {
  res <- bccdc_theme()
  expect_type(res, "list")
})



test_that("theme can be added to a ggplot without error", {
  p <- ggplot(mtcars, aes(mpg, wt)) +
    geom_point() +
    bccdc_theme()

  expect_true(
    ggplot2::is_ggplot(p)
  )
})
