# TODO: Round this stuff out so we cover everything important enough.

# Pointblank validation functions ----

#' Run pointblank validation on an eData table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for eData format tables. Can operate in two modes:
#' - Agent mode (agent = TRUE): Creates an agent for reporting and interrogation
#' - Pipeline mode (agent = FALSE): Returns validated data directly for use in pipelines
#'
#' @param data Data frame to validate
#' @param table_name Name of the table being validated (for reporting)
#' @param validation_steps Function that takes a data frame or agent and returns
#'   it with validation steps added. Should be a function like:
#'   `function(x) { x |> col_vals_not_null(...) |> ... }`
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @details
#' In agent mode, the agent object can be used to:
#' - Extract validation results with `get_sundered_data()`
#' - Generate reports with `get_agent_report()`
#' - Check pass/fail status
#'
#' In pipeline mode, failed rows are automatically removed from the data.
#'
#' @family validation
#'
#' @importFrom pointblank create_agent interrogate action_levels get_agent_report
#' @importFrom glue glue
#' @export
#'
#' @examples
#' \dontrun{
#' my_steps <- function(x) {
#'   x |> col_vals_not_null(columns = id)
#' }
#' pb_validate_edata_table(
#'   data       = my_data,
#'   table_name = "MyTable",
#'   validation_steps = my_steps
#' )
#' }
pb_validate_edata_table <- function(
  data,
  table_name,
  validation_steps,
  agent = TRUE,
  actions = action_levels()
) {
  if (agent) {
    # Agent mode: create agent, apply validations, and interrogate ----
    data |>
      create_agent(
        label = glue("eData {table_name} Validation"),
        actions = actions
      ) |>
      validation_steps()
  } else {
    # Pipeline mode: apply validation steps directly to data ----
    data |>
      validation_steps()
  }
}

# ## Campaign validation ----

#' Run pointblank validation on a Campaign table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for an eData Campaign table. Checks that campaign name fields
#' are non-null and unique, that campaign start dates fall within a valid
#' range, and that entry metadata fields are present and not in the future.
#'
#' @param data Data frame containing Campaign table data to validate
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @seealso [pb_validate_edata_table()] for the underlying validation framework,
#'   [pb_validate_all_edata_tables()] to validate all tables at once,
#'   [example_campaign_tibble()] for an example Campaign table.
#'
#' @family validation
#'
#' @importFrom pointblank col_vals_not_null col_vals_between rows_distinct action_levels col_vals_lte
#' @export
#'
#' @examples
#' \dontrun{
#' pb_validate_campaign(example_campaign_tibble())
#' }
pb_validate_campaign <- function(
  data,
  actions = action_levels(),
  agent = TRUE
) {
  apply_validations <- function(x) {
    x |>
      # # Check CAMPAIGN_NAME_SHORT and CAMPAIGN_NAME are not blank
      col_vals_not_null(
        label = "Check CAMPAIGN_NAME_SHORT and CAMPAIGN_NAME are not blank",
        columns = c(CAMPAIGN_NAME_SHORT, CAMPAIGN_NAME),
        actions = actions
      ) |>

      # does core id match file name?
      # currently we just match the date, because the formats are different
      # FIXME: Doesn't work!
      # col_vals_equal(
      #   columns = CAMPAIGN_NAME_SHORT,
      #   value = vars(expected_year),
      #   preconditions = ~ . |>
      #     filter(!str_detect(CAMPAIGN_NAME_SHORT, "Vm")) |>
      #     mutate(expected_year = str_extract(source_file, "\\d{4}")),
      #   actions = actions
      # ) |>

      # # Check no repeated campaigns
      rows_distinct(
        label = "Check each CAMPAIGN_NAME_SHORT and CAMPAIGN_NAME is unique",
        columns = c(CAMPAIGN_NAME_SHORT, CAMPAIGN_NAME)
      ) |>

      # # Check CAMPAIGN_START_DATE is between 01 Jan 1900 and the present date
      col_vals_between(
        label = "Check CAMPAIGN_START_DATE is between 01 Jan 1900 and the present date",
        columns = CAMPAIGN_START_DATE,
        left = as.Date("1900-01-01"),
        right = Sys.Date(),
        actions = actions
      ) |>

      # # Check ENTERED_BY and ENTERED_DATE are not blank
      col_vals_not_null(
        label = "Check ENTERED_BY and ENTERED_DATE are not blank",
        columns = c(ENTERED_BY, ENTERED_DATE),
        actions = actions
      ) |>

      # # Check ENTERED_DATE is not in the future
      col_vals_lte(
        label = "Check ENTERED_DATE is not in the future",
        columns = ENTERED_DATE,
        value = Sys.Date(),
        actions = actions
      )
  }

  pb_validate_edata_table(
    data = data,
    table_name = "Campaign",
    validation_steps = apply_validations,
    agent = agent,
    actions = actions
  )
}

# ## Reference validation ----

#' Run pointblank validation on a Reference table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for an eData Reference table. Checks that reference IDs match
#' the expected format, controlled vocabulary fields are valid, required fields
#' are non-null, publication year and access date fall within valid ranges, and
#' conditionally mandatory fields are present based on reference type.
#'
#' @param data Data frame containing Reference table data to validate
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @seealso [pb_validate_edata_table()] for the underlying validation framework,
#'   [pb_validate_all_edata_tables()] to validate all tables at once,
#'   [example_references_tibble()] for an example Reference table.
#'
#' @family validation
#'
#' @importFrom pointblank col_vals_not_null col_vals_regex col_vals_not_equal col_vals_gte col_vals_lte col_vals_in_set col_vals_between action_levels
#' @importFrom dplyr filter
#' @export
#'
#' @examples
#' \dontrun{
#' pb_validate_reference(example_references_tibble())
#' }
pb_validate_reference <- function(
  data,
  actions = action_levels(),
  agent = TRUE
) {
  apply_validations <- function(x) {
    x |>
      # # Check REFERENCE_ID exists and is the expected format
      col_vals_regex(
        label = "REFERENCE_ID is in the format YearLastnameFirstThreeWords",
        columns = REFERENCE_ID,
        # pattern matches that generated by generate_reference_id()
        regex = "^\\d{4}[A-Za-z0-9]{1,10}([A-Z][a-z]*){1,3}$",
        actions = actions
      ) |>

      # # Check REFERENCE_TYPE is in reference_type_vocabulary()
      col_vals_in_set(
        label = "REFERENCE_TYPE is in reference_type_vocabulary()",
        columns = REFERENCE_TYPE,
        set = reference_type_vocabulary(),
        actions = actions
      ) |>
      # # Check DATA_SOURCE is in data_source_vocabulary()
      col_vals_in_set(
        label = "DATA_SOURCE is in data_source_vocabulary()",
        columns = DATA_SOURCE,
        set = data_source_vocabulary(),
        actions = actions
      ) |>

      # # Check AUTHOR, TITLE are not blank
      col_vals_not_null(
        label = "Check AUTHOR, TITLE are not blank",
        columns = c(AUTHOR, TITLE),
        actions = actions
      ) |>
      # # Check YEAR is between 1900 and the current year
      col_vals_between(
        label = "Check YEAR is between 1900 and the current year",
        columns = YEAR,
        left = 1900,
        right = as.integer(format(Sys.Date(), "%Y")),
        actions = actions
      ) |>

      # # Check ACCESS_DATE is between 01 Jan 2000 and the present date
      col_vals_between(
        label = "Check ACCESS_DATE is between 01 Jan 2000 and the present date",
        columns = ACCESS_DATE,
        left = as.Date("2000-01-01"),
        right = Sys.Date(),
        actions = actions
      ) |>
      # # Check fields conditionally mandatory on REFERENCE_TYPE
      col_vals_not_null(
        label = "Check PERIODICAL_JOURNAL isn't blank when REFERENCE_TYPE is 'Journal Article'",
        preconditions = \(x) {
          x |>
            filter(REFERENCE_TYPE == "Journal Article")
        },
        columns = PERIODICAL_JOURNAL,
        actions = actions
      ) |>
      col_vals_not_null(
        label = "Check PUBLISHER isn't blank when REFERENCE_TYPE is 'Book' or 'Report'",
        preconditions = \(x) {
          x |>
            filter(REFERENCE_TYPE %in% c("Book", "Report"))
        },
        columns = PUBLISHER,
        actions = actions
      ) |>
      col_vals_not_null(
        label = "Check INSTITUTION isn't blank when REFERENCE_TYPE is 'Report'",
        preconditions = \(x) {
          x |>
            filter(REFERENCE_TYPE %in% c("Report"))
        },
        columns = INSTITUTION,
        actions = actions
      )
  }

  pb_validate_edata_table(
    data = data,
    table_name = "Reference",
    validation_steps = apply_validations,
    agent = agent,
    actions = actions
  )
}

# ## Parameters validation ----

#' Run pointblank validation on a Parameters table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for an eData Parameters table. Checks that core identifier
#' fields are non-null, parameter names are within the expected controlled
#' vocabulary, and entry metadata is present.
#'
#' @param data Data frame containing Parameters table data to validate
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @seealso [pb_validate_edata_table()] for the underlying validation framework,
#'   [pb_validate_all_edata_tables()] to validate all tables at once,
#'   [example_parameters_tibble()] for an example Parameters table.
#'
#' @family validation
#'
#' @importFrom pointblank col_vals_not_null col_vals_in_set col_vals_equal action_levels
#' @importFrom dplyr pull
#' @export
#'
#' @examples
#' \dontrun{
#' pb_validate_parameters(example_parameters_tibble())
#' }
pb_validate_parameters <- function(
  data,
  actions = action_levels(),
  agent = TRUE
) {
  apply_validations <- function(x) {
    x |>
      # Core identifiers
      col_vals_not_null(columns = PARAMETER_TYPE, actions = actions) |>
      col_vals_not_null(columns = MEASURED_TYPE, actions = actions) |>
      col_vals_not_null(columns = PARAMETER_NAME, actions = actions) |>
      # FIXME: This will obviously fail on new parameters. Will need a more intelligent approach in time.
      col_vals_in_set(
        label = "Check PARAMETER_NAME in parameters_vocabulary()$PARAMETER_NAME",
        columns = PARAMETER_NAME,
        set = parameters_vocabulary() |> pull(PARAMETER_NAME),
        actions = actions
      ) |>

      # Metadata
      col_vals_not_null(columns = ENTERED_BY, actions = actions)
  }

  pb_validate_edata_table(
    data = data,
    table_name = "Parameters",
    validation_steps = apply_validations,
    agent = agent,
    actions = actions
  )
}
# ## Sites validation ----

#' Run pointblank validation on a Sites table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for an eData Sites table. Checks that site codes and names are
#' non-null and unique, geographic feature and country fields are within their
#' controlled vocabularies, coordinates are within valid ranges, and required
#' metadata fields are present.
#'
#' @param data Data frame containing Sites table data to validate
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#' @param northern_hemisphere Logical. If TRUE, constrains latitude validation
#'   to northern hemisphere (0-90). Default is FALSE (allows -90 to 90).
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @seealso [pb_validate_edata_table()] for the underlying validation framework,
#'   [pb_validate_all_edata_tables()] to validate all tables at once,
#'   [example_sites_tibble()] for an example Sites table.
#'
#' @family validation
#'
#' @importFrom pointblank col_vals_not_null col_vals_in_set col_vals_between rows_distinct action_levels
#' @export
#'
#' @examples
#' \dontrun{
#' pb_validate_sites(example_sites_tibble())
#'
#' # Constrain latitude to the northern hemisphere
#' pb_validate_sites(example_sites_tibble(), northern_hemisphere = TRUE)
#' }
pb_validate_sites <- function(
  data,
  actions = action_levels(),
  agent = TRUE,
  northern_hemisphere = FALSE
) {
  # Set latitude bounds based on hemisphere constraint ----
  lat_min <- if (northern_hemisphere) 0 else -90
  lat_max <- 90

  apply_validations <- function(x) {
    x |>
      # # Check SITE_CODE and SITE_NAME are not blank
      col_vals_not_null(
        label = "Check SITE_CODE and SITE_NAME are not blank",
        columns = c(SITE_CODE, SITE_NAME),
        actions = actions
      ) |>

      # # Check no duplicate site code/name combinations
      rows_distinct(
        label = "Check no duplicate site code/name combinations",
        columns = c(SITE_CODE, SITE_NAME),
        actions = actions
      ) |>

      # # Check SITE_GEOGRAPHIC_FEATURE is in geographic_features_vocabulary()
      col_vals_in_set(
        label = "Check SITE_GEOGRAPHIC_FEATURE is in geographic_features_vocabulary()",
        columns = SITE_GEOGRAPHIC_FEATURE,
        set = geographic_features_vocabulary(),
        actions = actions
      ) |>

      # # Check SITE_GEOGRAPHIC_FEATURE_SUB is in geographic_features_sub_vocabulary()
      col_vals_in_set(
        label = "Check SITE_GEOGRAPHIC_FEATURE_SUB is in geographic_features_sub_vocabulary()",
        columns = SITE_GEOGRAPHIC_FEATURE_SUB,
        set = geographic_features_sub_vocabulary(),
        actions = actions
      ) |>

      # # Check COUNTRY_ISO is in countries_vocabulary()
      col_vals_in_set(
        label = "Check COUNTRY_ISO is in countries_vocabulary()",
        columns = COUNTRY_ISO,
        set = c(countries_vocabulary(), "Not reported", "Not relevant"),
        actions = actions
      ) |>

      # # Check OCEAN_IHO is in areas_vocabulary()
      col_vals_in_set(
        label = "Check OCEAN_IHO is in areas_vocabulary()",
        columns = OCEAN_IHO,
        set = c(areas_vocabulary(), "Not reported", "Not relevant"),
        actions = actions
      ) |>

      # # Check LATITUDE is within valid range
      col_vals_between(
        label = "Check LATITUDE is between {lat_min} and {lat_max}",
        columns = LATITUDE,
        left = lat_min,
        right = lat_max,
        actions = actions
      ) |>

      # # Check LONGITUDE is between -180 and 180
      col_vals_between(
        label = "Check LONGITUDE is between -180 and 180",
        columns = LONGITUDE,
        left = -180,
        right = 180,
        actions = actions
      ) |>

      # # Check SITE_COORDINATE_SYSTEM is in coordinate_systems_vocabulary()
      col_vals_in_set(
        label = "Check SITE_COORDINATE_SYSTEM is in coordinate_systems_vocabulary()",
        columns = SITE_COORDINATE_SYSTEM,
        set = coordinate_systems_vocabulary(),
        actions = actions
      ) |>

      # # Check ALTITUDE_VALUE is between -11000 and 9000
      col_vals_between(
        label = "Check ALTITUDE_VALUE is between -11000 and 9000",
        columns = ALTITUDE_VALUE,
        left = -11000,
        right = 9000,
        actions = actions
      ) |>

      # # Check ALTITUDE_UNIT is in altitude_units_vocabulary()
      col_vals_in_set(
        label = "Check ALTITUDE_UNIT is in altitude_units_vocabulary()",
        columns = ALTITUDE_UNIT,
        set = altitude_units_vocabulary(),
        actions = actions
      ) |>

      # # Check ENTERED_BY and ENTERED_DATE are not blank
      col_vals_not_null(
        label = "Check ENTERED_BY and ENTERED_DATE are not blank",
        columns = c(ENTERED_BY, ENTERED_DATE),
        actions = actions
      )
  }

  pb_validate_edata_table(
    data = data,
    table_name = "Sites",
    validation_steps = apply_validations,
    agent = agent,
    actions = actions
  )
}
#' Run pointblank validation on a Samples table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for an eData Samples table. Checks that core identifier fields
#' are non-null, that environmental compartment fields contain values within
#' their controlled vocabularies, and that each ENVIRON_COMPARTMENT_SUB value
#' is consistent with its corresponding ENVIRON_COMPARTMENT parent.
#'
#' @param data Data frame containing Samples table data to validate
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @seealso [pb_validate_edata_table()] for the underlying validation framework,
#'   [pb_validate_all_edata_tables()] to validate all tables at once,
#'   [environ_compartments_sub_vocabulary()] for the compartment hierarchy used in
#'   the consistency check,
#'   [example_samples_tibble()] for an example Samples table.
#'
#' @family validation
#'
#' @importFrom pointblank col_vals_not_null col_vals_in_set action_levels
#' @importFrom purrr flatten
#' @importFrom dplyr filter
#' @export
#'
#' @examples
#' \dontrun{
#' pb_validate_samples(example_samples_tibble())
#' }
pb_validate_samples <- function(
  data,
  actions = action_levels(),
  agent = TRUE
) {
  compartment_sub_vocab <- environ_compartments_sub_vocabulary()

  # Only compartments that actually have sub-values defined
  non_null_compartments <- Filter(Negate(is.null), compartment_sub_vocab)

  apply_validations <- function(x) {
    # Start with core identifier and flat vocabulary checks
    agent_or_data <- x |>
      col_vals_not_null(columns = SAMPLE_ID, actions = actions) |>
      col_vals_not_null(columns = SITE_CODE, actions = actions) |>
      col_vals_not_null(columns = PARAMETER_NAME, actions = actions) |>
      col_vals_in_set(
        columns = ENVIRON_COMPARTMENT,
        set = environ_compartments_vocabulary(),
        actions = actions
      ) |>
      col_vals_in_set(
        columns = ENVIRON_COMPARTMENT_SUB,
        set = flatten(compartment_sub_vocab),
        actions = actions
      )

    # Add one parent-child consistency check per non-NULL compartment
    for (comp in names(non_null_compartments)) {
      valid_subs <- non_null_compartments[[comp]]
      agent_or_data <- agent_or_data |>
        col_vals_in_set(
          label = paste("Check ENVIRON_COMPARTMENT_SUB is valid for", comp),
          columns = ENVIRON_COMPARTMENT_SUB,
          preconditions = (function(comp) {
            \(x) x |> filter(ENVIRON_COMPARTMENT == comp)
          })(comp),
          set = valid_subs,
          actions = actions
        )
    }

    agent_or_data
  }

  pb_validate_edata_table(
    data = data,
    table_name = "Samples",
    validation_steps = apply_validations,
    agent = agent,
    actions = actions
  )
}

# ## Biota validation ----

#' Run pointblank validation on a Biota table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for an eData Biota table. Checks that core identifier and
#' biota-specific fields are non-null, environmental compartments indicate
#' biota, and that species group, tissue, lifestage, and gender values are
#' within their controlled vocabularies.
#'
#' @param data Data frame containing Biota table data to validate
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @seealso [pb_validate_edata_table()] for the underlying validation framework,
#'   [pb_validate_all_edata_tables()] to validate all tables at once,
#'   [example_biota_tibble()] for an example Biota table.
#'
#' @family validation
#'
#' @importFrom pointblank col_vals_not_null col_vals_equal col_vals_in_set action_levels
#' @importFrom dplyr pull
#' @export
#'
#' @examples
#' \dontrun{
#' pb_validate_biota(example_biota_tibble())
#' }
pb_validate_biota <- function(
  data,
  actions = action_levels(),
  agent = TRUE
) {
  apply_validations <- function(x) {
    x |>
      # Core identifiers
      col_vals_not_null(columns = SAMPLE_ID, actions = actions) |>
      col_vals_not_null(columns = SITE_CODE, actions = actions) |>
      col_vals_not_null(columns = PARAMETER_NAME, actions = actions) |>
      # FIXME: This will obviously fail on new parameters. Will need a more intelligent approach in time.
      col_vals_in_set(
        columns = PARAMETER_NAME,
        set = parameters_vocabulary() |> pull(PARAMETER_NAME),
        actions = actions
      ) |>

      # Biota-specific fields
      col_vals_not_null(columns = SPECIES_GROUP, actions = actions) |>
      col_vals_not_null(columns = SAMPLE_SPECIES, actions = actions) |>
      col_vals_not_null(columns = SAMPLE_TISSUE, actions = actions) |>

      # # Check environmental compartments are both some type of biota
      col_vals_equal(
        columns = ENVIRON_COMPARTMENT,
        "Biota",
        actions = actions
      ) |>
      col_vals_in_set(
        columns = ENVIRON_COMPARTMENT_SUB,
        set = environ_compartments_sub_vocabulary()$Biota,
        actions = actions
      ) |>

      # # Check group, tissue, species, gender are in the expected vocab
      col_vals_in_set(
        columns = SPECIES_GROUP,
        set = species_groups_vocabulary(),
        actions = actions
      ) |>
      col_vals_in_set(
        columns = SAMPLE_TISSUE,
        set = tissue_types_vocabulary(),
        actions = actions
      ) |>
      col_vals_in_set(
        columns = SAMPLE_SPECIES_LIFESTAGE,
        set = lifestage_vocabulary(),
        actions = actions
      ) |>
      col_vals_in_set(
        columns = SAMPLE_SPECIES_GENDER,
        set = gender_vocabulary(),
        actions = actions
      )
  }

  pb_validate_edata_table(
    data = data,
    table_name = "Biota",
    validation_steps = apply_validations,
    agent = agent,
    actions = actions
  )
}

# ## Measurements validation ----

#' Run pointblank validation on a Measurements table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for an eData Measurements table. Checks that core identifier
#' fields are non-null, sampling dates are within valid ranges, environmental
#' compartments are valid, measurement flags and values are consistent, LOD/LOQ
#' values and units are present and valid when provided, protocol IDs match the
#' expected format, MEASURED_TYPE is in its controlled vocabulary, and reference
#' and sample IDs are present and correctly formatted.
#'
#' @param data Data frame containing Measurements table data to validate
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @seealso [pb_validate_edata_table()] for the underlying validation framework,
#'   [pb_validate_all_edata_tables()] to validate all tables at once,
#'   [protocol_id_regex()] for the protocol ID format validated here,
#'   [sample_id_regex()] for the sample ID format validated here,
#'   [measured_types_vocabulary()] for valid MEASURED_TYPE values,
#'   [parameter_unit_vocabulary()] for valid unit values,
#'   [protocol_options_vocabulary()] for valid protocol names,
#'   [example_measurements_tibble()] for an example Measurements table.
#'
#' @family validation
#'
#' @importFrom pointblank col_vals_not_null col_vals_equal col_vals_gte col_vals_lte col_vals_in_set col_vals_not_equal col_vals_regex action_levels
#' @importFrom purrr flatten
#' @importFrom dplyr pull filter
#' @export
#'
#' @examples
#' \dontrun{
#' pb_validate_measurements(example_measurements_tibble())
#' }
pb_validate_measurements <- function(
  data,
  actions = action_levels(),
  agent = TRUE
) {
  apply_validations <- function(x) {
    x |>
      # Core identifiers
      col_vals_not_null(columns = SITE_CODE, actions = actions) |>
      col_vals_not_null(columns = PARAMETER_NAME, actions = actions) |>
      # FIXME: This will obviously fail on new parameters. Will need a more intelligent approach in time.
      col_vals_in_set(
        columns = PARAMETER_NAME,
        set = parameters_vocabulary() |> pull(PARAMETER_NAME),
        actions = actions
      ) |>
      col_vals_not_null(columns = SAMPLING_DATE, actions = actions) |>
      col_vals_gte(
        columns = SAMPLING_DATE,
        value = as.Date("1900-01-01"),
        actions = actions
      ) |>
      col_vals_lte(
        columns = SAMPLING_DATE,
        value = Sys.Date(),
        actions = actions
      ) |>

      # Environmental compartments
      col_vals_in_set(
        columns = ENVIRON_COMPARTMENT,
        set = environ_compartments_vocabulary(),
        actions = actions
      ) |>
      col_vals_in_set(
        columns = ENVIRON_COMPARTMENT_SUB,
        set = environ_compartments_sub_vocabulary() |> flatten(),
        actions = actions
      ) |>

      # # Measurement values
      col_vals_in_set(
        label = "Check MEASURED_FLAG is blank, '< LOQ' or '< LOD'",
        columns = MEASURED_FLAG,
        set = measured_flag_vocabulary(),
        actions = actions
      ) |>
      # # When MEASURED_FLAG is blank, check we have a MEASURED_VALUE and valid MEASURED_UNIT
      col_vals_not_null(
        label = "When MEASURED_FLAG is blank, check MEASURED_VALUE isn't null",
        preconditions = \(x) x |> filter(MEASURED_FLAG == ""),
        columns = MEASURED_VALUE,
        actions = actions
      ) |>
      col_vals_in_set(
        label = "When MEASURED_FLAG is blank, check MEASURED_UNIT is in parameter_unit_vocabulary()",
        preconditions = \(x) x |> filter(MEASURED_FLAG == ""),
        columns = MEASURED_UNIT,
        set = parameter_unit_vocabulary() |> pull(MEASURED_UNIT),
        actions = actions
      ) |>
      # # Check MEASURED_N >= 1
      col_vals_gte(
        label = "Check MEASURED_N >= 1",
        columns = MEASURED_N,
        value = 1,
        actions = actions
      ) |>
      # # Check that UNCERTAINTY_TYPE is in uncertainty_types_vocabulary()
      col_vals_in_set(
        label = "Check that UNCERTAINTY_TYPE is in uncertainty_types_vocabulary()",
        columns = UNCERTAINTY_TYPE,
        set = uncertainty_types_vocabulary(),
        actions = actions
      ) |>

      # # Check MEASURED_TYPE is in measured_types_vocabulary()
      col_vals_in_set(
        label = "Check MEASURED_TYPE is in measured_types_vocabulary()",
        columns = MEASURED_TYPE,
        set = measured_types_vocabulary(),
        actions = actions
      ) |>

      # # Check protocol IDs match the format produced by generate_protocol_id()
      # # See protocol_id_regex() for the pattern definition
      col_vals_regex(
        label = "Check SAMPLING_PROTOCOL matches protocol_id_regex()",
        preconditions = \(x) x |> filter(!is.na(SAMPLING_PROTOCOL)),
        columns = SAMPLING_PROTOCOL,
        regex = protocol_id_regex(),
        actions = actions
      ) |>
      col_vals_regex(
        label = "Check EXTRACTION_PROTOCOL matches protocol_id_regex()",
        preconditions = \(x) x |> filter(!is.na(EXTRACTION_PROTOCOL)),
        columns = EXTRACTION_PROTOCOL,
        regex = protocol_id_regex(),
        actions = actions
      ) |>
      col_vals_regex(
        label = "Check FRACTIONATION_PROTOCOL matches protocol_id_regex()",
        preconditions = \(x) x |> filter(!is.na(FRACTIONATION_PROTOCOL)),
        columns = FRACTIONATION_PROTOCOL,
        regex = protocol_id_regex(),
        actions = actions
      ) |>
      col_vals_regex(
        label = "Check ANALYTICAL_PROTOCOL matches protocol_id_regex()",
        preconditions = \(x) x |> filter(!is.na(ANALYTICAL_PROTOCOL)),
        columns = ANALYTICAL_PROTOCOL,
        regex = protocol_id_regex(),
        actions = actions
      ) |>

      # # LOQ/LOD values
      col_vals_gte(
        columns = LOQ_VALUE,
        value = 0,
        actions = actions
      ) |>
      col_vals_gte(
        columns = LOD_VALUE,
        value = 0,
        actions = actions
      ) |>

      # # When LOQ_VALUE is present, check LOQ_UNIT is in parameter_unit_vocabulary()
      # # See parameter_unit_vocabulary() for valid unit values
      col_vals_in_set(
        label = "When LOQ_VALUE is present, check LOQ_UNIT is in parameter_unit_vocabulary()",
        preconditions = \(x) x |> filter(!is.na(LOQ_VALUE)),
        columns = LOQ_UNIT,
        set = parameter_unit_vocabulary() |> pull(MEASURED_UNIT),
        actions = actions
      ) |>
      # # When LOD_VALUE is present, check LOD_UNIT is in parameter_unit_vocabulary()
      # # See parameter_unit_vocabulary() for valid unit values
      col_vals_in_set(
        label = "When LOD_VALUE is present, check LOD_UNIT is in parameter_unit_vocabulary()",
        preconditions = \(x) x |> filter(!is.na(LOD_VALUE)),
        columns = LOD_UNIT,
        set = parameter_unit_vocabulary() |> pull(MEASURED_UNIT),
        actions = actions
      ) |>

      # # Check REFERENCE_ID matches the format produced by generate_reference_id()
      # # and isn't a placeholder value
      col_vals_regex(
        label = "Check REFERENCE_ID is in the format YearLastnameFirstThreeWords",
        columns = REFERENCE_ID,
        regex = "^\\d{4}[A-Za-z0-9]{1,10}([A-Z][a-z]*){1,3}$",
        actions = actions
      ) |>
      col_vals_not_null(columns = REFERENCE_ID, actions = actions) |>
      col_vals_not_equal(
        columns = REFERENCE_ID,
        value = "Unknown Reference",
        actions = actions
      ) |>

      # # Check SAMPLE_ID matches the format produced by generate_sample_id_with_components()
      # # See sample_id_regex() for the pattern definition
      col_vals_regex(
        label = "Check SAMPLE_ID matches sample_id_regex()",
        columns = SAMPLE_ID,
        regex = sample_id_regex(),
        actions = actions
      ) |>
      col_vals_not_null(columns = SAMPLE_ID, actions = actions)
  }

  pb_validate_edata_table(
    data = data,
    table_name = "Measurements",
    validation_steps = apply_validations,
    agent = agent,
    actions = actions
  )
}

# ## Methods validation ----

#' Run pointblank validation on a Methods table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for an eData Methods table. Checks that protocol IDs match the
#' format produced by [generate_protocol_id()], that protocol ID and campaign
#' name fields are non-null, and that protocol category and name values are
#' within their controlled vocabularies.
#'
#' @param data Data frame containing Methods table data to validate
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @seealso [pb_validate_edata_table()] for the underlying validation framework,
#'   [pb_validate_all_edata_tables()] to validate all tables at once,
#'   [protocol_id_regex()] for the protocol ID format validated here,
#'   [protocol_categories_vocabulary()] for valid protocol category values,
#'   [protocol_options_vocabulary()] for valid protocol name values,
#'   [example_methods_tibble()] for an example Methods table.
#'
#' @family validation
#'
#' @importFrom pointblank col_vals_not_null col_vals_in_set col_vals_regex action_levels
#' @importFrom dplyr pull
#' @export
#'
#' @examples
#' \dontrun{
#' pb_validate_methods(example_methods_tibble())
#' }
pb_validate_methods <- function(
  data,
  actions = action_levels(),
  agent = TRUE
) {
  apply_validations <- function(x) {
    x |>
      # # Check PROTOCOL_ID matches the format produced by generate_protocol_id()
      # # See protocol_id_regex() for the pattern definition
      col_vals_regex(
        label = "Check PROTOCOL_ID matches protocol_id_regex()",
        columns = PROTOCOL_ID,
        regex = protocol_id_regex(),
        actions = actions
      ) |>
      col_vals_not_null(
        columns = c(PROTOCOL_ID, CAMPAIGN_NAME),
        actions = actions
      ) |>
      col_vals_in_set(
        columns = PROTOCOL_CATEGORY,
        set = protocol_categories_vocabulary(),
        actions = actions
      ) |>
      col_vals_in_set(
        columns = PROTOCOL_NAME,
        set = protocol_options_vocabulary() |> pull(Long_Name),
        actions = actions
      )
  }

  pb_validate_edata_table(
    data = data,
    table_name = "Methods",
    validation_steps = apply_validations,
    agent = agent,
    actions = actions
  )
}

# ## CREED Data validation ----

#' Run pointblank validation on a CREED Reliability data table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for a CREED reliability data table in the format produced by
#' [example_CREED_reliability_tibble()]. Checks that criterion IDs and titles
#' are within the expected sets, scores are integers between 0 and 4, and
#' required/recommended classification is valid.
#'
#' @param data Data frame containing CREED reliability data to validate
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @seealso [pb_validate_edata_table()] for the underlying validation framework,
#'   [pb_validate_CREED_data_relevance()] for the relevance equivalent,
#'   [example_CREED_reliability_tibble()] for an example CREED reliability table.
#'
#' @family validation
#'
#' @importFrom pointblank col_vals_in_set col_vals_between action_levels
#' @export
#'
#' @examples
#' \dontrun{
#' pb_validate_CREED_data_reliability(example_CREED_reliability_tibble())
#' }
pb_validate_CREED_data_reliability <- function(
  data,
  actions = action_levels(),
  agent = TRUE
) {
  valid_criterion_ids <- c(
    "RB1",
    "RB2",
    "RB3",
    "RB4",
    "RB5",
    "RB6",
    "RB7",
    "RB8",
    "RB9",
    "RB10",
    "RB11",
    "RB12",
    "RB13",
    "RB14",
    "RB15",
    "RB16",
    "RB17",
    "RB18",
    "RB19"
  )

  valid_criterion_titles <- c(
    "Sample Medium/Matrix",
    "Collection Method/Sample Type",
    "Sample Handling",
    "Site Location",
    "Date and Time",
    "Analyte(s) Measured",
    "Limit of Detection and/or Limit of Quantification",
    "Accreditation/Quality Management System",
    "Method",
    "Lab Blank Contamination",
    "Recovery/Accuracy",
    "Reproducibility/Precision",
    "Field QC",
    "Calculations",
    "Significant Figures",
    "Outliers",
    "Censored Data",
    "Summary Statistics Procedures",
    "Supporting Data Quality"
  )

  apply_validations <- function(x) {
    x |>
      col_vals_in_set(
        label = "Check criterion_id is in the expected reliability set (RB1-RB19)",
        columns = criterion_id,
        set = valid_criterion_ids,
        actions = actions
      ) |>
      col_vals_in_set(
        label = "Check criterion_title is in the expected reliability set",
        columns = criterion_title,
        set = valid_criterion_titles,
        actions = actions
      ) |>
      col_vals_between(
        label = "Check score is an integer between 0 and 4",
        columns = score,
        left = 0L,
        right = 4L,
        actions = actions
      ) |>
      col_vals_in_set(
        label = "Check required_recommended is 'Required' or 'Recommended'",
        columns = required_recommended,
        set = c("Required", "Recommended"),
        actions = actions
      )
  }

  pb_validate_edata_table(
    data = data,
    table_name = "CREED Reliability Data",
    validation_steps = apply_validations,
    agent = agent,
    actions = actions
  )
}

#' Run pointblank validation on a CREED Relevance data table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for a CREED relevance data table in the format produced by
#' [example_CREED_relevance_tibble()]. Checks that criterion IDs and titles
#' are within the expected sets, scores are integers between 0 and 4, and
#' required/recommended classification is valid.
#'
#' @param data Data frame containing CREED relevance data to validate
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @seealso [pb_validate_edata_table()] for the underlying validation framework,
#'   [pb_validate_CREED_data_reliability()] for the reliability equivalent,
#'   [example_CREED_relevance_tibble()] for an example CREED relevance table.
#'
#' @family validation
#'
#' @importFrom pointblank col_vals_in_set col_vals_between action_levels
#' @export
#'
#' @examples
#' \dontrun{
#' pb_validate_CREED_data_relevance(example_CREED_relevance_tibble())
#' }
pb_validate_CREED_data_relevance <- function(
  data,
  actions = action_levels(),
  agent = TRUE
) {
  valid_criterion_ids <- c(
    "RV1",
    "RV2",
    "RV3",
    "RV4",
    "RV5",
    "RV6",
    "RV7",
    "RV8",
    "RV9",
    "RV10",
    "RV11"
  )

  valid_criterion_titles <- c(
    "Sample Medium/Matrix",
    "Collection Method/Sample Type",
    "Study Area",
    "Site Type",
    "Sampling Timespan",
    "Sampling Frequency",
    "Temporal Conditions",
    "Analyte",
    "Sensitivity/LOD/LOQ",
    "Summary Statistics Type",
    "Supporting Parameters"
  )

  apply_validations <- function(x) {
    x |>
      col_vals_in_set(
        label = "Check criterion_id is in the expected relevance set (RV1-RV11)",
        columns = criterion_id,
        set = valid_criterion_ids,
        actions = actions
      ) |>
      col_vals_in_set(
        label = "Check criterion_title is in the expected relevance set",
        columns = criterion_title,
        set = valid_criterion_titles,
        actions = actions
      ) |>
      col_vals_between(
        label = "Check score is an integer between 0 and 4",
        columns = score,
        left = 0L,
        right = 4L,
        actions = actions
      ) |>
      col_vals_in_set(
        label = "Check required_recommended is 'Required' or 'Recommended'",
        columns = required_recommended,
        set = c("Required", "Recommended"),
        actions = actions
      )
  }

  pb_validate_edata_table(
    data = data,
    table_name = "CREED Relevance Data",
    validation_steps = apply_validations,
    agent = agent,
    actions = actions
  )
}

# ## CREED Scores validation ----

#' Run pointblank validation on a CREED Scores table
#'
#' Applies pointblank validation rules to check data quality and schema
#' compliance for an eData CREED Scores table. Checks that reference IDs match
#' the format produced by [generate_reference_id()], are non-null, are not the
#' placeholder value, and that reliability and relevance classification fields
#' contain valid values.
#'
#' @param data Data frame containing CREED Scores table data to validate
#' @param actions Action levels for pointblank agent (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a pointblank agent object.
#'   If FALSE, returns the validated data with validation failures removed.
#'
#' @return If agent = TRUE, a pointblank agent object containing validation results.
#'   If agent = FALSE, the input data with validation failures removed.
#'
#' @seealso [pb_validate_edata_table()] for the underlying validation framework,
#'   [pb_validate_all_edata_tables()] to validate all tables at once,
#'   [example_CREED_scores_tibble()] for an example CREED Scores table.
#'
#' @family validation
#'
#' @importFrom pointblank col_vals_not_null col_vals_not_equal col_vals_in_set col_vals_regex action_levels
#' @export
#'
#' @examples
#' \dontrun{
#' pb_validate_CREED_scores(example_CREED_scores_tibble())
#' }
pb_validate_CREED_scores <- function(
  data,
  actions = action_levels(),
  agent = TRUE
) {
  CREED_classifications_rb <- c(
    "Not usable",
    "Reliable with restrictions",
    "Reliable without restrictions"
  )
  CREED_classifications_rv <- c(
    "Not usable",
    "Relevant with restrictions",
    "Relevant without restrictions"
  )

  apply_validations <- function(x) {
    x |>
      # # Check REFERENCE_ID matches the format produced by generate_reference_id()
      col_vals_regex(
        label = "Check REFERENCE_ID is in the format YearLastnameFirstThreeWords",
        columns = REFERENCE_ID,
        regex = "^\\d{4}[A-Za-z0-9]{1,10}([A-Z][a-z]*){1,3}$",
        actions = actions
      ) |>
      col_vals_not_null(columns = REFERENCE_ID, actions = actions) |>
      col_vals_not_equal(
        columns = REFERENCE_ID,
        value = "Unknown Reference",
        actions = actions
      ) |>

      # CREED fields
      col_vals_in_set(
        columns = c(SILVER_RELIABILITY, GOLD_RELIABILITY),
        set = CREED_classifications_rb,
        actions = actions
      ) |>
      col_vals_in_set(
        columns = c(SILVER_RELEVANCE, GOLD_RELEVANCE),
        set = CREED_classifications_rv,
        actions = actions
      )
  }

  pb_validate_edata_table(
    data = data,
    table_name = "CREED Scores",
    validation_steps = apply_validations,
    agent = agent,
    actions = actions
  )
}

# ## Validate all tables ----
#' Validate all eData tables at once
#'
#' Applies pointblank validation rules to all supplied eData tables by calling
#' the individual table validation functions. Required tables are always
#' validated; optional tables are validated only when provided.
#'
#' @param campaign Data frame containing Campaign table data to validate
#' @param reference Data frame containing Reference table data to validate
#' @param parameters Data frame containing Parameters table data to validate
#' @param sites Data frame containing Sites table data to validate
#' @param samples Data frame containing Samples table data to validate (optional)
#' @param biota Data frame containing Biota table data to validate (optional)
#' @param measurements Data frame containing Measurements table data to validate
#' @param methods Data frame containing Methods table data to validate (optional)
#' @param creed_scores Data frame containing CREED Scores table data to validate (optional)
#' @param actions Action levels for pointblank agents (only used when agent = TRUE)
#' @param agent Logical. If TRUE (default), returns a list of pointblank agent objects.
#'   If FALSE, returns a list of validated data frames with failures removed.
#' @param northern_hemisphere Logical. If TRUE, check that site coordinates are in
#'   the northern hemisphere. Passed to [pb_validate_sites()].
#'
#' @return A named list. If agent = TRUE, each element is a pointblank agent object.
#'   If agent = FALSE, each element is a validated data frame with failing rows removed.
#'   The list always contains elements named `campaign`, `reference`, `parameters`,
#'   `sites`, and `measurements`. Optional elements (`samples`, `biota`, `methods`,
#'   `creed_scores`) are included only when the corresponding arguments are not `NULL`.
#'
#' @seealso [pb_validate_campaign()], [pb_validate_reference()],
#'   [pb_validate_parameters()], [pb_validate_sites()], [pb_validate_samples()],
#'   [pb_validate_biota()], [pb_validate_measurements()], [pb_validate_methods()],
#'   [pb_validate_CREED_scores()],
#'   [example_campaign_tibble()], [example_references_tibble()],
#'   [example_parameters_tibble()], [example_sites_tibble()],
#'   [example_measurements_tibble()]
#'
#' @family validation
#'
#' @export
#'
#' @examples
#' \dontrun{
#' agents <- pb_validate_all_edata_tables(
#'   campaign     = example_campaign_tibble(),
#'   reference    = example_references_tibble(),
#'   parameters   = example_parameters_tibble(),
#'   sites        = example_sites_tibble(),
#'   measurements = example_measurements_tibble()
#' )
#'
#' # Include optional tables
#' agents <- pb_validate_all_edata_tables(
#'   campaign     = example_campaign_tibble(),
#'   reference    = example_references_tibble(),
#'   parameters   = example_parameters_tibble(),
#'   sites        = example_sites_tibble(),
#'   measurements = example_measurements_tibble(),
#'   samples      = example_samples_tibble(),
#'   biota        = example_biota_tibble(),
#'   methods      = example_methods_tibble(),
#'   creed_scores = example_CREED_scores_tibble()
#' )
#' }
pb_validate_all_edata_tables <- function(
  campaign,
  reference,
  parameters,
  sites,
  samples = NULL,
  biota = NULL,
  measurements,
  methods = NULL,
  creed_scores = NULL,
  actions = action_levels(),
  agent = TRUE,
  northern_hemisphere = FALSE
) {
  results <- list(
    campaign = pb_validate_campaign(campaign, actions, agent),
    reference = pb_validate_reference(reference, actions, agent),
    parameters = pb_validate_parameters(parameters, actions, agent),
    sites = pb_validate_sites(sites, actions, agent, northern_hemisphere),
    measurements = pb_validate_measurements(measurements, actions, agent)
  )

  # Add optional tables if provided
  if (!is.null(samples)) {
    results$samples <- pb_validate_samples(samples, actions, agent)
  }

  if (!is.null(biota)) {
    results$biota <- pb_validate_biota(biota, actions, agent)
  }

  if (!is.null(methods)) {
    results$methods <- pb_validate_methods(methods, actions, agent)
  }

  if (!is.null(creed_scores)) {
    results$creed_scores <- pb_validate_CREED_scores(
      creed_scores,
      actions,
      agent
    )
  }

  return(results)
}
