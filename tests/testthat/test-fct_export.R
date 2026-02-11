# tests/testthat/test-utils_export.R ----

# Test get_dataset_display_name ----

test_that("get_dataset_display_name returns correct names", {
  expect_equal(get_dataset_display_name("edata_sites"), "Sites")
  expect_equal(get_dataset_display_name("edata_parameters"), "Parameters")
  expect_equal(get_dataset_display_name("edata_measurements"), "Measurements")
})

test_that("get_dataset_display_name returns character", {
  result <- get_dataset_display_name("edata_sites")
  expect_type(result, "character")
  expect_length(result, 1)
})

# Test export_campaign_zip ----

test_that("export_campaign_zip creates ZIP file", {
  # Create sample data
  test_data <- list(
    edata_sites = data.frame(SITE_CODE = "S01", SITE_NAME = "Site 1"),
    edata_measurements = data.frame(VALUE = c(1.2, 3.4))
  )

  # Create in temp directory
  temp_dir <- tempdir()
  output_path <- file.path(temp_dir)

  result <- export_campaign_zip(test_data, "TestCampaign", temp_dir)

  expect_true(file.exists(result))

  # Cleanup
  unlink(temp_dir)
})

test_that("export_campaign_zip filters empty datasets", {
  test_data <- list(
    edata_sites = data.frame(SITE_CODE = "S01"),
    edata_empty = data.frame(),
    edata_null = NULL
  )

  temp_dir <- tempdir()
  output_path <- file.path(temp_dir)

  expect_message(
    export_campaign_zip(test_data, "Test", output_path),
    "Preparing to export 1 datasets"
  )

  # Cleanup
  unlink(temp_dir)
})

test_that("export_campaign_zip errors on invalid input", {
  expect_error(
    export_campaign_zip(list(), "Test"),
    "must be a non-empty named list"
  )

  expect_error(
    export_campaign_zip(list(data.frame(x = 1)), "Test"),
    "must have names"
  )

  test_data <- list(
    empty1 = data.frame(),
    empty2 = NULL
  )

  expect_error(
    export_campaign_zip(test_data, "Test"),
    "No non-empty datasets to export"
  )
})

test_that("export_campaign_zip cleans campaign name", {
  test_data <- list(
    edata_sites = data.frame(SITE_CODE = "S01")
  )

  temp_dir <- tempdir()
  output_path <- file.path(temp_dir)

  # Campaign name with special characters
  result <- export_campaign_zip(
    test_data,
    "Test/Campaign:2024!",
    output_path
  )

  expect_true(file.exists(result))

  # Cleanup
  unlink(output_path)
})

test_that("export_campaign_zip works without output_path", {
  test_data <- list(
    edata_sites = data.frame(SITE_CODE = "S01")
  )

  # Should create in working directory
  result <- suppressMessages(
    export_campaign_zip(test_data, "TestNoPath")
  )

  expect_true(file.exists(result))
  expect_match(result, "TestNoPath")

  # Cleanup
  unlink(result)
})
