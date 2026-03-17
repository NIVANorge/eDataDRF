action_levels <- pointblank::action_levels(stop_at = 1)

# # Campaign ----
test_that("pb_validate_campaign() passes valid data", {
  expect_no_error(
    example_campaign_tibble() |>
      pb_validate_campaign(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_campaign() fails when required field is NULL", {
  expect_error(
    example_campaign_tibble() |>
      dplyr::mutate(CAMPAIGN_NAME_SHORT = NA_character_) |>
      pb_validate_campaign(agent = FALSE, actions = action_levels)
  )
})

# # Reference ----
test_that("pb_validate_reference() passes valid data", {
  expect_no_error(
    example_references_tibble() |>
      pb_validate_reference(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_reference() fails when REFERENCE_ID is NULL", {
  expect_error(
    example_references_tibble() |>
      dplyr::mutate(REFERENCE_ID = NA_character_) |>
      pb_validate_reference(agent = FALSE, actions = action_levels)
  )
})

# # Sites ----
test_that("pb_validate_sites() passes valid data", {
  expect_no_error(
    example_sites_tibble() |>
      pb_validate_sites(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_sites() fails when LATITUDE is out of range", {
  expect_error(
    example_sites_tibble() |>
      dplyr::mutate(LATITUDE = 999) |>
      pb_validate_sites(agent = FALSE, actions = action_levels)
  )
})

# # Parameters ----
test_that("pb_validate_parameters() passes valid data", {
  expect_no_error(
    example_parameters_tibble() |>
      pb_validate_parameters(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_parameters() fails when ENTERED_BY is NULL", {
  expect_error(
    example_parameters_tibble() |>
      dplyr::mutate(ENTERED_BY = NA_character_) |>
      pb_validate_parameters(agent = FALSE, actions = action_levels)
  )
})

# # Samples ----
test_that("pb_validate_samples() passes valid data", {
  expect_no_error(
    example_samples_tibble() |>
      pb_validate_samples(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_samples() fails when SAMPLE_ID is NULL", {
  expect_error(
    example_samples_tibble() |>
      dplyr::mutate(SAMPLE_ID = NA_character_) |>
      pb_validate_samples(agent = FALSE, actions = action_levels)
  )
})

# # Biota ----
test_that("pb_validate_biota() passes valid data", {
  expect_no_error(
    example_biota_tibble() |>
      pb_validate_biota(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_biota() fails when SPECIES_GROUP is NULL", {
  expect_error(
    example_biota_tibble() |>
      dplyr::mutate(SPECIES_GROUP = NA_character_) |>
      pb_validate_biota(agent = FALSE, actions = action_levels)
  )
})

# # Methods ----
test_that("pb_validate_methods() passes valid data", {
  expect_no_error(
    example_methods_tibble() |>
      pb_validate_methods(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_methods() fails when PROTOCOL_ID is NULL", {
  expect_error(
    example_methods_tibble() |>
      dplyr::mutate(PROTOCOL_ID = NA_character_) |>
      pb_validate_methods(agent = FALSE, actions = action_levels)
  )
})

# # Measurements ----
test_that("pb_validate_measurements() passes valid data", {
  expect_no_error(
    example_measurements_tibble() |>
      pb_validate_measurements(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_measurements() fails when MEASURED_UNIT is NULL", {
  expect_error(
    example_measurements_tibble() |>
      dplyr::mutate(MEASURED_UNIT = NA_character_) |>
      pb_validate_measurements(agent = FALSE, actions = action_levels)
  )
})

# # CREED Data ----
test_that("pb_validate_CREED_data_reliability() passes valid data", {
  expect_no_error(
    example_CREED_reliability_tibble() |>
      pb_validate_CREED_data_reliability(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_CREED_data_reliability() fails when criterion_id is invalid", {
  expect_error(
    example_CREED_reliability_tibble() |>
      dplyr::mutate(
        criterion_id = dplyr::if_else(
          criterion_id == "RB1",
          "RV1",
          criterion_id
        )
      ) |>
      pb_validate_CREED_data_reliability(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_CREED_data_reliability() fails when score is out of range", {
  expect_error(
    example_CREED_reliability_tibble() |>
      dplyr::mutate(score = dplyr::if_else(criterion_id == "RB1", 5L, score)) |>
      pb_validate_CREED_data_reliability(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_CREED_data_reliability() fails when required_recommended is invalid", {
  expect_error(
    example_CREED_reliability_tibble() |>
      dplyr::mutate(
        required_recommended = dplyr::if_else(
          criterion_id == "RB1",
          "Optional",
          required_recommended
        )
      ) |>
      pb_validate_CREED_data_reliability(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_CREED_data_relevance() passes valid data", {
  expect_no_error(
    example_CREED_relevance_tibble() |>
      pb_validate_CREED_data_relevance(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_CREED_data_relevance() fails when criterion_id is invalid", {
  expect_error(
    example_CREED_relevance_tibble() |>
      dplyr::mutate(
        criterion_id = dplyr::if_else(
          criterion_id == "RV1",
          "RB1",
          criterion_id
        )
      ) |>
      pb_validate_CREED_data_relevance(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_CREED_data_relevance() fails when score is out of range", {
  expect_error(
    example_CREED_relevance_tibble() |>
      dplyr::mutate(score = dplyr::if_else(criterion_id == "RV1", 5L, score)) |>
      pb_validate_CREED_data_relevance(agent = FALSE, actions = action_levels)
  )
})

test_that("pb_validate_CREED_data_relevance() fails when required_recommended is invalid", {
  expect_error(
    example_CREED_relevance_tibble() |>
      dplyr::mutate(
        required_recommended = dplyr::if_else(
          criterion_id == "RV1",
          "Optional",
          required_recommended
        )
      ) |>
      pb_validate_CREED_data_relevance(agent = FALSE, actions = action_levels)
  )
})
