test_that("export work", {
  tmp <- xlreports::report_export(tabs = list(mtcars, airquality),
                                 export_dest = "tmp_folder")
  out <- list(readxl::read_excel(tmp, sheet = 1),
              readxl::read_excel(tmp, sheet = 2))
  unlink("tmp_folder", recursive = TRUE)
  expect_equal(out, list(tidyr::as_tibble(mtcars),
                         tidyr::as_tibble(airquality)))
})
