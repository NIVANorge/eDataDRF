# tests/testthat/test-initialise_functions.R ----

# Test Tibble Initialisation Functions ----

test_that("initialise_campaign_tibble creates correct structure", {
  result <- initialise_campaign_tibble()

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 8)
  expect_named(
    result,
    c(
      "CAMPAIGN_NAME_SHORT",
      "CAMPAIGN_NAME",
      "CAMPAIGN_START_DATE",
      "CAMPAIGN_END_DATE",
      "ORGANISATION",
      "ENTERED_BY",
      "ENTERED_DATE",
      "CAMPAIGN_COMMENT"
    )
  )
  expect_type(result$CAMPAIGN_NAME_SHORT, "character")
  expect_s3_class(result$CAMPAIGN_START_DATE, "Date")
})

test_that("initialise_biota_tibble creates correct structure", {
  result <- initialise_biota_tibble()

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 14)
  expect_true(all(
    c("SAMPLE_ID", "SPECIES_GROUP", "SAMPLE_SPECIES") %in% names(result)
  ))
})

test_that("initialise_compartments_tibble creates correct structure", {
  result <- initialise_compartments_tibble()

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 3)
  expect_named(
    result,
    c("ENVIRON_COMPARTMENT", "ENVIRON_COMPARTMENT_SUB", "MEASURED_CATEGORY")
  )
})

test_that("initialise_methods_tibble creates correct structure", {
  result <- initialise_methods_tibble()

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 5)
  expect_true("PROTOCOL_ID" %in% names(result))
})

test_that("initialise_parameters_tibble creates correct structure", {
  result <- initialise_parameters_tibble()

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 10)
  expect_true(all(
    c("PARAMETER_NAME", "INCHIKEY_SD", "CAS_RN") %in% names(result)
  ))
  expect_type(result$PUBCHEM_CID, "integer")
})

test_that("initialise_references_tibble creates correct structure", {
  result <- initialise_references_tibble()

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 18)
  expect_true("REFERENCE_ID" %in% names(result))
  expect_type(result$YEAR, "integer")
  expect_type(result$VOLUME, "integer")
})

test_that("initialise_samples_tibble creates correct structure", {
  result <- initialise_samples_tibble()

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 11)
  expect_true("SAMPLE_ID" %in% names(result))
})

test_that("initialise_sites_tibble creates correct structure", {
  result <- initialise_sites_tibble()

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 14)
  expect_true("SITE_CODE" %in% names(result))
  expect_type(result$LATITUDE, "double")
  expect_type(result$LONGITUDE, "double")
})

test_that("initialise_measurements_tibble creates correct structure", {
  result <- initialise_measurements_tibble()

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 27)
  expect_type(result$MEASURED_VALUE, "double")
  expect_type(result$MEASURED_N, "double")
})

test_that("initialise_CREED_scores_tibble creates correct structure", {
  result <- initialise_CREED_scores_tibble()

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 5)
  expect_true("REFERENCE_ID" %in% names(result))
})

test_that("initialise_CREED_data_tibble creates correct structure", {
  result <- initialise_CREED_data_tibble()

  expect_s3_class(result, "tbl_df")
  expect_equal(nrow(result), 0)
  expect_equal(ncol(result), 6)
  expect_true(all(c("criterion_id", "score", "limitations") %in% names(result)))
})

# Test Vocabulary Functions ----

test_that("geographic_features_vocabulary returns character vector", {
  result <- geographic_features_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true("Not relevant" %in% result)
  expect_true("River, stream, canal" %in% result)
})

test_that("geographic_features_sub_vocabulary returns character vector", {
  result <- geographic_features_sub_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true("Not relevant" %in% result)
})

test_that("coordinate_systems_vocabulary returns character vector", {
  result <- coordinate_systems_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true("WGS 84" %in% result)
})

test_that("countries_vocabulary returns character vector", {
  result <- countries_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 2) # At least "Not relevant", "Not reported", plus countries
  expect_true("Not relevant" %in% result)
})

test_that("areas_vocabulary returns character vector", {
  result <- areas_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true("Not relevant" %in% result)
})

test_that("altitude_units_vocabulary returns character vector", {
  result <- altitude_units_vocabulary()

  expect_type(result, "character")
  expect_equal(length(result), 4)
  expect_true(all(c("km", "m", "cm", "mm") %in% result))
})

test_that("parameter_types_vocabulary returns character vector", {
  result <- parameter_types_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true("Stressor" %in% result)
})

test_that("measured_types_vocabulary returns character vector", {
  result <- measured_types_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true("Concentration" %in% result)
})

test_that("environ_compartments_vocabulary returns character vector", {
  result <- environ_compartments_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true(all(
    c("Aquatic", "Atmospheric", "Terrestrial", "Biota") %in% result
  ))
})

test_that("environ_compartments_sub_vocabulary returns named list", {
  result <- environ_compartments_sub_vocabulary()

  expect_type(result, "list")
  expect_true(all(
    c("Aquatic", "Atmospheric", "Terrestrial", "Biota") %in% names(result)
  ))
  expect_type(result$Aquatic, "character")
  expect_gt(length(result$Aquatic), 0)
})

test_that("measured_categories_vocabulary returns character vector", {
  result <- measured_categories_vocabulary()

  expect_type(result, "character")
  expect_equal(length(result), 3)
  expect_true(all(c("External", "Internal", "Surface") %in% names(result)))
})

test_that("tissue_types_vocabulary returns character vector", {
  result <- tissue_types_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true("Whole body" %in% result)
})

test_that("lifestage_vocabulary returns character vector", {
  result <- lifestage_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true(all(c("Adult", "Juvenile", "Larva") %in% result))
})

test_that("gender_vocabulary returns character vector", {
  result <- gender_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true(all(c("Male", "Female", "Mixed") %in% result))
})

test_that("species_groups_vocabulary returns character vector", {
  result <- species_groups_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true(all(c("Fish", "Birds", "Mammals") %in% result))
})

test_that("uncertainty_types_vocabulary returns character vector", {
  result <- uncertainty_types_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
  expect_true("Standard Deviation" %in% result)
})

test_that("protocol_categories_vocabulary returns character vector", {
  result <- protocol_categories_vocabulary()

  expect_type(result, "character")
  expect_equal(length(result), 4)
  expect_true(all(c("Sampling Protocol", "Analytical Protocol") %in% result))
})

test_that("measured_flags_vocabulary returns character vector", {
  result <- measured_flags_vocabulary()

  expect_type(result, "character")
  expect_equal(length(result), 3)
  expect_true("< LOQ" %in% result)
})

test_that("CREED_choices_vocabulary returns named numeric vector", {
  result <- CREED_choices_vocabulary()

  expect_type(result, "double")
  expect_true(is.numeric(result))
  expect_true(!is.null(names(result)))
  expect_true("Fully Met" %in% names(result))
})

# Test Protocol Vocabulary Functions ----

test_that("sampling_protocols_vocabulary returns tibble", {
  result <- sampling_protocols_vocabulary()

  expect_s3_class(result, "tbl_df")
  expect_equal(ncol(result), 3)
  expect_named(result, c("Protocol_Type", "Short_Name", "Long_Name"))
  expect_gt(nrow(result), 0)
  expect_true(all(result$Protocol_Type == "Sampling Protocol"))
})

test_that("fractionation_protocols_vocabulary returns tibble", {
  result <- fractionation_protocols_vocabulary()

  expect_s3_class(result, "tbl_df")
  expect_equal(ncol(result), 3)
  expect_gt(nrow(result), 0)
  expect_true(all(result$Protocol_Type == "Fractionation Protocol"))
})

test_that("extraction_protocols_vocabulary returns tibble", {
  result <- extraction_protocols_vocabulary()

  expect_s3_class(result, "tbl_df")
  expect_equal(ncol(result), 3)
  expect_gt(nrow(result), 0)
  expect_true(all(result$Protocol_Type == "Extraction Protocol"))
})

test_that("analytical_protocols_vocabulary returns tibble", {
  result <- analytical_protocols_vocabulary()

  expect_s3_class(result, "tbl_df")
  expect_equal(ncol(result), 3)
  expect_gt(nrow(result), 0)
  expect_true(all(result$Protocol_Type == "Analytical Protocol"))
})

test_that("protocol_options_vocabulary combines all protocols", {
  result <- protocol_options_vocabulary()

  expect_s3_class(result, "tbl_df")
  expect_equal(ncol(result), 3)
  expect_gt(nrow(result), 0)

  # Check all protocol types are present
  protocol_types <- unique(result$Protocol_Type)
  expect_true(all(
    c(
      "Sampling Protocol",
      "Fractionation Protocol",
      "Extraction Protocol",
      "Analytical Protocol"
    ) %in%
      protocol_types
  ))
})

# Test Character Limits Function ----

test_that("reference_character_limits returns named list", {
  result <- reference_character_limits()

  expect_type(result, "list")
  expect_true(!is.null(names(result)))
  expect_true(all(sapply(result, is.numeric)))
  expect_true("DOI" %in% names(result))
  expect_equal(result$DOI, 200)
})

# Test Functions Requiring Data Files ----
# These may need to be skipped if data files aren't available

test_that("dummy_parameters_vocabulary returns data frame", {
  skip_if_not(
    file.exists("data/dummy_quality_parameters.parquet"),
    "Data files not available"
  )

  result <- dummy_parameters_vocabulary()

  expect_s3_class(result, "data.frame")
  expect_gt(nrow(result), 0)
  expect_true("PARAMETER_NAME" %in% names(result))
})

test_that("parameter_types_sub_vocabulary returns character vector", {
  skip_if_not(
    file.exists("data/dummy_quality_parameters.parquet"),
    "Data files not available"
  )

  result <- parameter_types_sub_vocabulary()

  expect_type(result, "character")
  expect_gt(length(result), 0)
})

test_that("species_names_vocabulary returns tibble", {
  skip_if_not(
    file.exists("data/ecotox_2025_06_12_species.parquet"),
    "Data files not available"
  )

  result <- species_names_vocabulary()

  expect_s3_class(result, "tbl_df")
  expect_gt(nrow(result), 0)
  expect_true(all(c("SPECIES_NAME", "SPECIES_GROUP") %in% names(result)))
})

test_that("parameter_unit_vocabulary returns data frame or vector", {
  skip_if_not(
    file.exists("data/unit_conversion_factors.csv"),
    "Data files not available"
  )

  # Test without column selection
  result_full <- parameter_unit_vocabulary()
  expect_s3_class(result_full, "data.frame")

  # Test with column selection
  result_col <- parameter_unit_vocabulary("MEASURED_UNIT")
  expect_type(result_col, "character")
})
