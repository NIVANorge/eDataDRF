# Test: fct_example_data.R ----
# Basic tests for dummy data creation functions
# These tests verify that dummy data functions execute without error
# and produce tibbles with the expected structure

# =========================================================================
# DUMMY TIBBLE FUNCTION TESTS
# =========================================================================
# Each test verifies:
# 1. Function executes without error or warning
# 2. Returns a tibble
# 3. Has at least one row
# 4. Column names match the parent initialise_* function
# =========================================================================

test_that("example_campaign_tibble creates valid tibble", {
  expect_no_error(result <- example_campaign_tibble())
  expect_no_warning(result <- example_campaign_tibble())
  expect_s3_class(
    result,
    "tbl_df"
  )
  expect_gt(nrow(result), 0)
  expect_equal(names(result), names(initialise_campaign_tibble()))
})

test_that("example_references_tibble creates valid tibble", {
  expect_no_error(result <- example_references_tibble())
  expect_no_warning(result <- example_references_tibble())
  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)
  expect_equal(names(result), names(initialise_references_tibble()))
})

test_that("example_sites_tibble creates valid tibble", {
  expect_no_error(result <- example_sites_tibble())
  expect_no_warning(result <- example_sites_tibble())
  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)
  expect_equal(names(result), names(initialise_sites_tibble()))
})

test_that("example_parameters_tibble creates valid tibble", {
  expect_no_error(result <- example_parameters_tibble())
  expect_no_warning(result <- example_parameters_tibble())
  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)
  expect_equal(names(result), names(initialise_parameters_tibble()))
})

test_that("example_compartments_tibble creates valid tibble", {
  expect_no_error(result <- example_compartments_tibble())
  expect_no_warning(result <- example_compartments_tibble())
  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)
  expect_equal(names(result), names(initialise_compartments_tibble()))
})

test_that("example_methods_tibble creates valid tibble", {
  expect_no_error(result <- example_methods_tibble())
  expect_no_warning(result <- example_methods_tibble())
  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)
  expect_equal(names(result), names(initialise_methods_tibble()))
})

test_that("example_samples_tibble creates valid tibble", {
  expect_no_error(result <- example_samples_tibble())
  expect_no_warning(result <- example_samples_tibble())
  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)
  expect_equal(names(result), names(initialise_samples_tibble()))
})

test_that("example_biota_tibble creates valid tibble", {
  expect_no_error(result <- example_biota_tibble())
  expect_no_warning(result <- example_biota_tibble())
  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)
  expect_equal(names(result), names(initialise_biota_tibble()))
})

test_that("example_measurements_tibble creates valid tibble", {
  expect_no_error(result <- example_measurements_tibble())
  expect_no_warning(result <- example_measurements_tibble())
  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)
  expect_equal(names(result), names(initialise_measurements_tibble()))
})
