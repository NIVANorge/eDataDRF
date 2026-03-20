# Example Data Creation Functions ----
# Functions for creating test/demonstration data
# These functions depend on their initialise_* parents in fct_formats.R
# to ensure column structure consistency

#' Create Example Campaign Tibble
#'
#' @description Creates a 1-row campaign tibble with test data.
#' Inherits column structure from [initialise_campaign_tibble()].
#'
#' @returns A tibble with 1 row of dummy campaign data
#'
#' @examples
#' example_campaign_tibble()
#'
#' @family example_tibble
#' @family campaign
#' @importFrom dplyr add_row mutate across
#' @importFrom tidyselect where
#' @export
example_campaign_tibble <- function() {
  initialise_campaign_tibble() |>
    add_row(
      CAMPAIGN_NAME_SHORT = "TestCamp2023",
      CAMPAIGN_NAME = "Test Campaign 2023: Heavy Metals in Coastal Sediments",
      CAMPAIGN_START_DATE = as.Date("2023-01-15"),
      CAMPAIGN_END_DATE = as.Date("2023-06-30"),
      ORGANISATION = "NIVA",
      ENTERED_BY = "test_user",
      ENTERED_DATE = as.Date("2023-07-01"),
      CAMPAIGN_COMMENT = "Example campaign for testing purposes"
    )
}

#' Create Example References Tibble
#'
#' @description Creates a 1-row references tibble with test data.
#' Inherits column structure from [initialise_references_tibble()].
#' `REFERENCE_ID` is automatically generated using [generate_reference_id()].
#'
#' @returns A tibble with 1 row of dummy reference data
#'
#' @examples
#' example_references_tibble()
#'
#' @family example_tibble
#' @family reference
#' @importFrom dplyr add_row
#' @export
example_references_tibble <- function() {
  initialise_references_tibble() |>
    add_row(
      REFERENCE_ID = generate_reference_id(
        date = 2023L,
        author = "Smith, J.; Jones, A.; Williams, B.",
        title = "Heavy metal contamination in Norwegian coastal sediments"
      ),
      REFERENCE_TYPE = "Journal Article",
      DATA_SOURCE = "Primary",
      AUTHOR = "Smith, J.; Jones, A.; Williams, B.",
      TITLE = "Heavy metal contamination in Norwegian coastal sediments",
      YEAR = 2023L,
      ACCESS_DATE = Sys.Date(),
      PERIODICAL_JOURNAL = "Environmental Science & Technology",
      VOLUME = 57L,
      ISSUE = 12L,
      PUBLISHER = NA_character_,
      INSTITUTION = NA_character_,
      DOI = "10.1021/acs.est.2023.12345",
      URL = NA_character_,
      ISBN_ISSN = NA_character_,
      EDITION = NA_character_,
      DOCUMENT_NUMBER = NA_character_,
      REF_COMMENT = "Example reference for testing"
    )
}

#' Create Example Sites Tibble
#'
#' @description Creates a 2-row sites tibble with test data.
#' Inherits column structure from [initialise_sites_tibble()].
#'
#' @returns A tibble with 2 rows of dummy site data
#'
#' @examples
#' example_sites_tibble()
#'
#' @family example_tibble
#' @family site
#' @importFrom dplyr add_row
#' @export
example_sites_tibble <- function() {
  initialise_sites_tibble() |>
    add_row(
      SITE_CODE = "SITE-001",
      SITE_NAME = "Oslofjord Inner",
      SITE_GEOGRAPHIC_FEATURE = "Coastal, fjord",
      SITE_GEOGRAPHIC_FEATURE_SUB = "Water column, pelagic zone",
      COUNTRY_ISO = "Norway",
      OCEAN_IHO = "Not relevant",
      LATITUDE = 59.9139,
      LONGITUDE = 10.7522,
      SITE_COORDINATE_SYSTEM = "WGS 84",
      ALTITUDE_VALUE = 0,
      ALTITUDE_UNIT = "m",
      ENTERED_BY = "test_user",
      ENTERED_DATE = "2023-07-01",
      SITE_COMMENT = "Primary test site"
    ) |>
    add_row(
      SITE_CODE = "SITE-002",
      SITE_NAME = "Bergen Harbour",
      SITE_GEOGRAPHIC_FEATURE = "Coastal, fjord",
      SITE_GEOGRAPHIC_FEATURE_SUB = "Water benthos",
      COUNTRY_ISO = "Norway",
      OCEAN_IHO = "North Sea",
      LATITUDE = 60.3913,
      LONGITUDE = 5.3221,
      SITE_COORDINATE_SYSTEM = "WGS 84",
      ALTITUDE_VALUE = 0,
      ALTITUDE_UNIT = "m",
      ENTERED_BY = "test_user",
      ENTERED_DATE = "2023-07-01",
      SITE_COMMENT = "Secondary test site"
    )
}

#' Create Example Parameters Tibble
#'
#' @description Creates a 3-row parameters tibble with test data.
#' Inherits column structure from [initialise_parameters_tibble()].
#'
#' @returns A tibble with 3 rows of dummy parameter data
#'
#' @examples
#' example_parameters_tibble()
#'
#' @family example_tibble
#' @family parameter
#' @importFrom dplyr add_row
#' @export
example_parameters_tibble <- function() {
  initialise_parameters_tibble() |>
    add_row(
      PARAMETER_TYPE = "Stressor",
      PARAMETER_TYPE_SUB = "Homogeneous metal compounds",
      MEASURED_TYPE = "Concentration",
      PARAMETER_NAME = "Copper",
      PARAMETER_NAME_SUB = NA_character_,
      INCHIKEY_SD = NA_character_,
      PUBCHEM_CID = 23978L,
      CAS_RN = "7440-50-8",
      ENTERED_BY = "test_user",
      PARAMETER_COMMENT = NA_character_
    ) |>
    add_row(
      PARAMETER_TYPE = "Stressor",
      PARAMETER_TYPE_SUB = "Homogeneous metal compounds",
      MEASURED_TYPE = "Concentration",
      PARAMETER_NAME = "Lead",
      PARAMETER_NAME_SUB = NA_character_,
      INCHIKEY_SD = NA_character_,
      PUBCHEM_CID = 5352425L,
      CAS_RN = "7439-92-1",
      ENTERED_BY = "test_user",
      PARAMETER_COMMENT = NA_character_
    ) |>
    add_row(
      PARAMETER_TYPE = "Stressor",
      PARAMETER_TYPE_SUB = "Homogeneous metal compounds",
      MEASURED_TYPE = "Concentration",
      PARAMETER_NAME = "Zinc",
      PARAMETER_NAME_SUB = NA_character_,
      INCHIKEY_SD = NA_character_,
      PUBCHEM_CID = 23994L,
      CAS_RN = "7440-66-6",
      ENTERED_BY = "test_user",
      PARAMETER_COMMENT = NA_character_
    )
}

#' Create Example Compartments Tibble
#'
#' @description Creates a 2-row compartments tibble with test data.
#' Inherits column structure from [initialise_compartments_tibble()].
#'
#' @returns A tibble with 2 rows of dummy compartment data
#'
#' @examples
#' example_compartments_tibble()
#'
#' @family example_tibble
#' @family compartment
#' @importFrom dplyr add_row
#' @export
example_compartments_tibble <- function() {
  initialise_compartments_tibble() |>
    add_row(
      ENVIRON_COMPARTMENT = "Aquatic",
      ENVIRON_COMPARTMENT_SUB = "Aquatic Sediment",
      MEASURED_CATEGORY = "External"
    ) |>
    add_row(
      ENVIRON_COMPARTMENT = "Biota",
      ENVIRON_COMPARTMENT_SUB = "Biota, Aquatic",
      MEASURED_CATEGORY = "Internal"
    )
}

#' Create Example Methods Tibble
#'
#' @description Creates a 4-row methods tibble with test data (one per protocol category).
#' Inherits column structure from [initialise_methods_tibble()].
#' `PROTOCOL_ID` values are automatically generated using [generate_protocol_id()].
#'
#' @returns A tibble with 4 rows of dummy methods data
#'
#' @examples
#' example_methods_tibble()
#'
#' @family example_tibble
#' @family method
#' @importFrom dplyr add_row
#' @export
example_methods_tibble <- function() {
  campaign <- "Test Campaign 2023: Heavy Metals in Coastal Sediments"
  initialise_methods_tibble() |>
    add_row(
      PROTOCOL_ID = generate_protocol_id(
        "Sampling Protocol",
        "Grab sampling",
        1,
        campaign
      ),
      CAMPAIGN_NAME = campaign,
      PROTOCOL_CATEGORY = "Sampling Protocol",
      PROTOCOL_NAME = "Grab sampling",
      PROTOCOL_COMMENT = "Surface sediment grab samples collected by Van Veen grab"
    ) |>
    add_row(
      PROTOCOL_ID = generate_protocol_id(
        "Extraction Protocol",
        "Acid digestion",
        1,
        campaign
      ),
      CAMPAIGN_NAME = campaign,
      PROTOCOL_CATEGORY = "Extraction Protocol",
      PROTOCOL_NAME = "Acid digestion",
      PROTOCOL_COMMENT = "HNO3/HCl microwave-assisted digestion"
    ) |>
    add_row(
      PROTOCOL_ID = generate_protocol_id(
        "Fractionation Protocol",
        "Total fraction",
        1,
        campaign
      ),
      CAMPAIGN_NAME = campaign,
      PROTOCOL_CATEGORY = "Fractionation Protocol",
      PROTOCOL_NAME = "Total fraction",
      PROTOCOL_COMMENT = NA_character_
    ) |>
    add_row(
      PROTOCOL_ID = generate_protocol_id(
        "Analytical Protocol",
        "Inductively coupled plasma mass spectrometry",
        1,
        campaign
      ),
      CAMPAIGN_NAME = campaign,
      PROTOCOL_CATEGORY = "Analytical Protocol",
      PROTOCOL_NAME = "Inductively coupled plasma mass spectrometry",
      PROTOCOL_COMMENT = "Inductively coupled plasma mass spectrometry using the ICP-MASTER 9000."
    )
}

#' Create Example Samples Tibble
#'
#' @description Creates a 2-row samples tibble with test data.
#' Inherits column structure from [initialise_samples_tibble()].
#' `SAMPLE_ID` values are automatically generated using
#' [generate_sample_id_with_components()].
#'
#' @returns A tibble with 2 rows of dummy sample data
#'
#' @examples
#' example_samples_tibble()
#'
#' @family example_tibble
#' @family sample
#' @importFrom dplyr add_row
#' @export
example_samples_tibble <- function() {
  initialise_samples_tibble() |>
    add_row(
      SITE_CODE = "SITE-001",
      SITE_NAME = "Oslofjord Inner",
      PARAMETER_NAME = "Copper",
      PARAMETER_TYPE = "Stressor",
      ENVIRON_COMPARTMENT = "Aquatic",
      ENVIRON_COMPARTMENT_SUB = "Aquatic Sediment",
      MEASURED_CATEGORY = "External",
      SAMPLING_DATE = "2023-03-15",
      SUBSAMPLE = "1",
      SUBSAMPLE_ID = NA_character_,
      SAMPLE_ID = generate_sample_id_with_components(
        site_code = "SITE-001",
        parameter_name = "Copper",
        environ_compartment = "Aquatic",
        environ_compartment_sub = "Aquatic Sediment",
        date = "2023-03-15",
        subsample = "1"
      )
    ) |>
    add_row(
      SITE_CODE = "SITE-002",
      SITE_NAME = "Bergen Harbour",
      PARAMETER_NAME = "Lead",
      PARAMETER_TYPE = "Stressor",
      ENVIRON_COMPARTMENT = "Aquatic",
      ENVIRON_COMPARTMENT_SUB = "Aquatic Sediment",
      MEASURED_CATEGORY = "External",
      SAMPLING_DATE = "2023-04-20",
      SUBSAMPLE = "1",
      SUBSAMPLE_ID = NA_character_,
      SAMPLE_ID = generate_sample_id_with_components(
        site_code = "SITE-002",
        parameter_name = "Lead",
        environ_compartment = "Aquatic",
        environ_compartment_sub = "Aquatic Sediment",
        date = "2023-04-20",
        subsample = "1"
      )
    )
}

#' Create Example Biota Tibble
#'
#' @description Creates a 1-row biota tibble with test data.
#' Inherits column structure from [initialise_biota_tibble()].
#' `SAMPLE_ID` is automatically generated using
#' [generate_sample_id_with_components()].
#'
#' @returns A tibble with 1 row of dummy biota data
#'
#' @examples
#' example_biota_tibble()
#'
#' @family example_tibble
#' @family biota
#' @importFrom dplyr add_row
#' @export
example_biota_tibble <- function() {
  initialise_biota_tibble() |>
    add_row(
      SAMPLE_ID = generate_sample_id_with_components(
        site_code = "SITE-001",
        parameter_name = "Copper",
        environ_compartment = "Biota",
        environ_compartment_sub = "Biota, Aquatic",
        date = "2023-05-10",
        subsample = "1"
      ),
      SITE_CODE = "SITE-001",
      PARAMETER_NAME = "Copper",
      ENVIRON_COMPARTMENT = "Biota",
      ENVIRON_COMPARTMENT_SUB = "Biota, Aquatic",
      MEASURED_CATEGORY = "Internal",
      SAMPLING_DATE = "2023-05-10",
      SUBSAMPLE = "1",
      SPECIES_GROUP = "Fish",
      SAMPLE_SPECIES = "Gadus morhua",
      SAMPLE_TISSUE = "Liver",
      SAMPLE_SPECIES_LIFESTAGE = "Adult",
      SAMPLE_SPECIES_GENDER = "Female",
      BIOTA_COMMENT = "Atlantic cod liver sample"
    )
}

#' Create Example Measurements Tibble
#'
#' @description Creates a 3-row measurements tibble with test data.
#' Inherits column structure from [initialise_measurements_tibble()].
#' `SAMPLE_ID` values match those generated by [example_samples_tibble()] and
#' [example_biota_tibble()]. `REFERENCE_ID` matches [example_references_tibble()].
#'
#' @returns A tibble with 3 rows of dummy measurement data
#'
#' @examples
#' example_measurements_tibble()
#'
#' @family example_tibble
#' @family measurement
#' @importFrom dplyr add_row
#' @export
example_measurements_tibble <- function() {
  ref_id <- generate_reference_id(
    date = 2023L,
    author = "Smith, J.; Jones, A.; Williams, B.",
    title = "Heavy metal contamination in Norwegian coastal sediments"
  )
  campaign <- "TestCamp2023"
  initialise_measurements_tibble() |>
    add_row(
      SITE_CODE = "SITE-001",
      PARAMETER_NAME = "Copper",
      SAMPLING_DATE = "2023-03-15",
      ENVIRON_COMPARTMENT_SUB = "Aquatic Sediment",
      SUBSAMPLE = "1",
      MEASURED_FLAG = "",
      MEASURED_VALUE = 45.2,
      UNCERTAINTY_TYPE = "Standard Deviation",
      UNCERTAINTY_UPPER = 3.1,
      UNCERTAINTY_LOWER = 3.1,
      MEASURED_UNIT = "mg/kg (dry)",
      MEASURED_N = 3,
      LOQ_VALUE = 0.5,
      LOQ_UNIT = "mg/kg (dry)",
      LOD_VALUE = 0.1,
      LOD_UNIT = "mg/kg (dry)",
      SAMPLING_PROTOCOL = generate_protocol_id(
        "Sampling Protocol",
        "Grab sampling",
        1,
        campaign
      ),
      EXTRACTION_PROTOCOL = generate_protocol_id(
        "Extraction Protocol",
        "Acid digestion",
        1,
        campaign
      ),
      FRACTIONATION_PROTOCOL = generate_protocol_id(
        "Fractionation Protocol",
        "Total fraction",
        1,
        campaign
      ),
      ANALYTICAL_PROTOCOL = generate_protocol_id(
        "Analytical Protocol",
        "Inductively coupled plasma mass spectrometry",
        1,
        campaign
      ),
      REFERENCE_ID = ref_id,
      SAMPLE_ID = generate_sample_id_with_components(
        site_code = "SITE-001",
        parameter_name = "Copper",
        environ_compartment = "Aquatic",
        environ_compartment_sub = "Aquatic Sediment",
        date = "2023-03-15",
        subsample = "1"
      ),
      CAMPAIGN_NAME_SHORT = "TestCamp2023",
      ENVIRON_COMPARTMENT = "Aquatic",
      PARAMETER_TYPE = "Stressor",
      MEASURED_TYPE = "Concentration",
      MEASUREMENT_COMMENT = NA_character_
    ) |>
    add_row(
      SITE_CODE = "SITE-002",
      PARAMETER_NAME = "Lead",
      SAMPLING_DATE = "2023-04-20",
      ENVIRON_COMPARTMENT_SUB = "Aquatic Sediment",
      SUBSAMPLE = "1",
      MEASURED_FLAG = "",
      MEASURED_VALUE = 12.8,
      UNCERTAINTY_TYPE = "Arithmetic Mean",
      UNCERTAINTY_UPPER = 1.2,
      UNCERTAINTY_LOWER = 1.2,
      MEASURED_UNIT = "mg/kg (wet)",
      MEASURED_N = 3,
      LOQ_VALUE = 1.0,
      LOQ_UNIT = "mg/kg (wet)",
      LOD_VALUE = 0.3,
      LOD_UNIT = "mg/kg (wet)",
      SAMPLING_PROTOCOL = generate_protocol_id(
        "Sampling Protocol",
        "Grab sampling",
        1,
        campaign
      ),
      EXTRACTION_PROTOCOL = generate_protocol_id(
        "Extraction Protocol",
        "Acid digestion",
        1,
        campaign
      ),
      FRACTIONATION_PROTOCOL = generate_protocol_id(
        "Fractionation Protocol",
        "Total fraction",
        1,
        campaign
      ),
      ANALYTICAL_PROTOCOL = generate_protocol_id(
        "Analytical Protocol",
        "Inductively coupled plasma mass spectrometry",
        1,
        campaign
      ),
      REFERENCE_ID = ref_id,
      SAMPLE_ID = generate_sample_id_with_components(
        site_code = "SITE-002",
        parameter_name = "Lead",
        environ_compartment = "Aquatic",
        environ_compartment_sub = "Aquatic Sediment",
        date = "2023-04-20",
        subsample = "1"
      ),
      CAMPAIGN_NAME_SHORT = "TestCamp2023",
      ENVIRON_COMPARTMENT = "Aquatic",
      PARAMETER_TYPE = "Stressor",
      MEASURED_TYPE = "Concentration",
      MEASUREMENT_COMMENT = NA_character_
    ) |>
    add_row(
      SITE_CODE = "SITE-001",
      PARAMETER_NAME = "Copper",
      SAMPLING_DATE = "2023-05-10",
      ENVIRON_COMPARTMENT_SUB = "Biota, Aquatic",
      SUBSAMPLE = "1",
      MEASURED_FLAG = "< LOQ",
      MEASURED_VALUE = NA_real_,
      UNCERTAINTY_TYPE = "Not Reported",
      UNCERTAINTY_UPPER = NA_real_,
      UNCERTAINTY_LOWER = NA_real_,
      MEASURED_UNIT = "Not Relevant",
      MEASURED_N = 1,
      LOQ_VALUE = 0.05,
      LOQ_UNIT = "mg/kg (wet)",
      LOD_VALUE = 0.01,
      LOD_UNIT = "mg/kg (wet)",
      SAMPLING_PROTOCOL = generate_protocol_id(
        "Sampling Protocol",
        "Grab sampling",
        1,
        campaign
      ),
      EXTRACTION_PROTOCOL = generate_protocol_id(
        "Extraction Protocol",
        "Acid digestion",
        1,
        campaign
      ),
      FRACTIONATION_PROTOCOL = generate_protocol_id(
        "Fractionation Protocol",
        "Total fraction",
        1,
        campaign
      ),
      ANALYTICAL_PROTOCOL = generate_protocol_id(
        "Analytical Protocol",
        "Inductively coupled plasma mass spectrometry",
        1,
        campaign
      ),
      REFERENCE_ID = ref_id,
      SAMPLE_ID = generate_sample_id_with_components(
        site_code = "SITE-001",
        parameter_name = "Copper",
        environ_compartment = "Biota",
        environ_compartment_sub = "Biota, Aquatic",
        date = "2023-05-10",
        subsample = "1"
      ),
      CAMPAIGN_NAME_SHORT = "TestCamp2023",
      ENVIRON_COMPARTMENT = "Biota",
      PARAMETER_TYPE = "Stressor",
      MEASURED_TYPE = "Concentration",
      MEASUREMENT_COMMENT = "Below LOQ - biota sample"
    )
}

#' Create Example CREED Reliability Tibble
#'
#' @description Creates a 19-row CREED reliability tibble (RB1-RB19) with
#' realistic test data including scores, extracted data, and limitations.
#' Inherits column structure from [initialise_CREED_data_tibble()].
#'
#' @returns A tibble with 19 rows of dummy CREED reliability data
#'
#' @examples
#' example_CREED_reliability_tibble()
#'
#' @family example_tibble
#' @family CREED
#' @importFrom dplyr add_row mutate
#' @export
example_CREED_reliability_tibble <- function() {
  initialise_CREED_data_tibble() |>
    # Convert score to integer to match collect_CREED_data behaviour
    mutate(score = integer(0)) |>

    # RB1: Sample Medium/Matrix ----
    add_row(
      criterion_id = "RB1",
      criterion_title = "Sample Medium/Matrix",
      required_recommended = "Required",
      relevant_data = "1 compartment: Aquatic Sediment\n2 samples. Grain size: <63um sieved fraction.",
      score = 1L,
      limitations = ""
    ) |>

    # RB2: Collection Method/Sample Type ----
    add_row(
      criterion_id = "RB2",
      criterion_title = "Collection Method/Sample Type",
      required_recommended = "Recommended",
      relevant_data = "1 protocol:\nSampling Protocol - Grab: (Surface sediments collected using Van Veen grab sampler)",
      score = 1L,
      limitations = ""
    ) |>

    # RB3: Sample Handling ----
    add_row(
      criterion_id = "RB3",
      criterion_title = "Sample Handling",
      required_recommended = "Recommended",
      relevant_data = "Samples stored frozen at -20 degrees C until analysis. Dried at 60 degrees C before digestion.",
      score = 1L,
      limitations = ""
    ) |>

    # RB4: Site Location ----
    add_row(
      criterion_id = "RB4",
      criterion_title = "Site Location",
      required_recommended = "Required",
      relevant_data = "2 sites. Countries (1): Norway. Areas (1): Oslofjord. Lowest coordinate precision: 4",
      score = 1L,
      limitations = ""
    ) |>

    # RB5: Date and Time ----
    add_row(
      criterion_id = "RB5",
      criterion_title = "Date and Time",
      required_recommended = "Required",
      relevant_data = "2023-03-15 to 2023-04-20 (n=2)",
      score = 1L,
      limitations = ""
    ) |>

    # RB6: Analyte(s) Measured ----
    add_row(
      criterion_id = "RB6",
      criterion_title = "Analyte(s) Measured",
      required_recommended = "Required",
      relevant_data = "1 protocol:\nAnalytical Protocol - ICP-MS: (Inductively coupled plasma mass spectrometry)",
      score = 1L,
      limitations = ""
    ) |>

    # RB7: LOD/LOQ ----
    add_row(
      criterion_id = "RB7",
      criterion_title = "Limit of Detection and/or Limit of Quantification",
      required_recommended = "Required",
      relevant_data = "LOD: 0.1-0.3 mg/kg; LOQ: 0.5-1.0 mg/kg",
      score = 1L,
      limitations = ""
    ) |>

    # RB8: Accreditation/QMS ----
    add_row(
      criterion_id = "RB8",
      criterion_title = "Accreditation/Quality Management System",
      required_recommended = "Required",
      relevant_data = "Relevant data not collected by app. Please complete manually.",
      score = 4L,
      limitations = "Justification: Laboratory accreditation status not reported in source."
    ) |>

    # RB9: Method ----
    add_row(
      criterion_id = "RB9",
      criterion_title = "Method",
      required_recommended = "Required",
      relevant_data = "4 protocols:\nSampling Protocol - Grab\nExtraction Protocol - Acid digestion: (HNO3/HCl microwave-assisted)\nFractionation Protocol - Total\nAnalytical Protocol - ICP-MS",
      score = 1L,
      limitations = ""
    ) |>

    # RB10: Lab Blank Contamination ----
    add_row(
      criterion_id = "RB10",
      criterion_title = "Lab Blank Contamination",
      required_recommended = "Recommended",
      relevant_data = "Method blanks analysed with each batch.",
      score = 2L,
      limitations = "Blank values not explicitly reported."
    ) |>

    # RB11: Recovery/Accuracy ----
    add_row(
      criterion_id = "RB11",
      criterion_title = "Recovery/Accuracy",
      required_recommended = "Recommended",
      relevant_data = "CRM MESS-3 analysed. Recovery: 95-102%.",
      score = 1L,
      limitations = ""
    ) |>

    # RB12: Reproducibility/Precision ----
    add_row(
      criterion_id = "RB12",
      criterion_title = "Reproducibility/Precision",
      required_recommended = "Recommended",
      relevant_data = "Triplicate analyses performed. RSD <10%.",
      score = 1L,
      limitations = ""
    ) |>

    # RB13: Field QC ----
    add_row(
      criterion_id = "RB13",
      criterion_title = "Field QC",
      required_recommended = "Recommended",
      relevant_data = "1 protocol:\nSampling Protocol - Grab",
      score = 4L,
      limitations = "No evidence of field blanks or duplicates."
    ) |>

    # RB14: Calculations ----
    add_row(
      criterion_id = "RB14",
      criterion_title = "Calculations",
      required_recommended = "Recommended",
      relevant_data = "Uncertainty types: Standard Deviation",
      score = 1L,
      limitations = "Not relevant - no normalisation applied."
    ) |>

    # RB15: Significant Figures ----
    add_row(
      criterion_id = "RB15",
      criterion_title = "Significant Figures",
      required_recommended = "Recommended",
      relevant_data = "Measured parameter values reported to 3 significant figures",
      score = 1L,
      limitations = ""
    ) |>

    # RB16: Outliers ----
    add_row(
      criterion_id = "RB16",
      criterion_title = "Outliers",
      required_recommended = "Recommended",
      relevant_data = "Relevant data not collected by app. Please complete manually.",
      score = 1L,
      limitations = "No outliers reported or removed."
    ) |>

    # RB17: Censored Data ----
    add_row(
      criterion_id = "RB17",
      criterion_title = "Censored Data",
      required_recommended = "Required",
      relevant_data = "Relevant data not collected by app. Please complete manually.",
      score = 1L,
      limitations = "One value reported as <LOQ with LOQ provided."
    ) |>

    # RB18: Summary Statistics Procedures ----
    add_row(
      criterion_id = "RB18",
      criterion_title = "Summary Statistics Procedures",
      required_recommended = "Recommended",
      relevant_data = "Uncertainty types: Standard Deviation",
      score = 1L,
      limitations = ""
    ) |>

    # RB19: Supporting Data Quality ----
    add_row(
      criterion_id = "RB19",
      criterion_title = "Supporting Data Quality",
      required_recommended = "Recommended",
      relevant_data = "Relevant data not collected by app. Please complete manually.",
      score = 1L,
      limitations = "No supporting parameters required."
    )
}


#' Create Example CREED Relevance Tibble
#'
#' @description Creates an 11-row CREED relevance tibble (RV1-RV11) with
#' realistic test data including scores, extracted data, and limitations.
#' Inherits column structure from [initialise_CREED_data_tibble()].
#'
#' @returns A tibble with 11 rows of dummy CREED relevance data
#'
#' @examples
#' example_CREED_relevance_tibble()
#'
#' @family example_tibble
#' @family CREED
#' @importFrom dplyr add_row mutate
#' @export
example_CREED_relevance_tibble <- function() {
  initialise_CREED_data_tibble() |>
    # Convert score to integer to match collect_CREED_data behaviour
    mutate(score = integer(0)) |>

    # RV1: Sample Medium/Matrix ----
    add_row(
      criterion_id = "RV1",
      criterion_title = "Sample Medium/Matrix",
      required_recommended = "Required",
      relevant_data = "1 compartment: Aquatic Sediment",
      score = 1L,
      limitations = ""
    ) |>

    # RV2: Collection Method/Sample Type ----
    add_row(
      criterion_id = "RV2",
      criterion_title = "Collection Method/Sample Type",
      required_recommended = "Recommended",
      relevant_data = "1 protocol:\nSampling Protocol - Grab: (Surface sediments collected using Van Veen grab sampler)",
      score = 1L,
      limitations = "Sampling reported to adequate level of detail."
    ) |>

    # RV3: Study Area ----
    add_row(
      criterion_id = "RV3",
      criterion_title = "Study Area",
      required_recommended = "Required",
      relevant_data = "2 sites. Countries (1): Norway. Areas (1): Oslofjord. Lowest coordinate precision: 4",
      score = 2L,
      limitations = "Limited to two sites within single fjord system."
    ) |>

    # RV4: Site Type ----
    add_row(
      criterion_id = "RV4",
      criterion_title = "Site Type",
      required_recommended = "Recommended",
      relevant_data = "2 sites. Distinct features: Types: Coastal, fjord, Subtypes: Sediment",
      score = 2L,
      limitations = "Rationale for specific site selection not provided."
    ) |>

    # RV5: Sampling Timespan ----
    add_row(
      criterion_id = "RV5",
      criterion_title = "Sampling Timespan",
      required_recommended = "Required",
      relevant_data = "2023-03-15 to 2023-04-20 (n=2)",
      score = 1L,
      limitations = ""
    ) |>

    # RV6: Sampling Frequency ----
    add_row(
      criterion_id = "RV6",
      criterion_title = "Sampling Frequency",
      required_recommended = "Required",
      relevant_data = "2023-03-15 to 2023-04-20 (n=2)",
      score = 2L,
      limitations = "Single sampling event per site."
    ) |>

    # RV7: Temporal Conditions ----
    add_row(
      criterion_id = "RV7",
      criterion_title = "Temporal Conditions",
      required_recommended = "Recommended",
      relevant_data = "Relevant data not collected by app. Please complete manually.",
      score = 4L,
      limitations = "Season, weather conditions not reported."
    ) |>

    # RV8: Analyte ----
    add_row(
      criterion_id = "RV8",
      criterion_title = "Analyte",
      required_recommended = "Required",
      relevant_data = "1 protocol:\nFractionation Protocol - Total",
      score = 1L,
      limitations = "Total metal concentration appropriate for purpose."
    ) |>

    # RV9: Sensitivity/LOD/LOQ ----
    add_row(
      criterion_id = "RV9",
      criterion_title = "Sensitivity/LOD/LOQ",
      required_recommended = "Required",
      relevant_data = "1 protocol:\nAnalytical Protocol - ICP-MS: (Inductively coupled plasma mass spectrometry)",
      score = 1L,
      limitations = "ICP-MS provides adequate sensitivity for environmental assessment."
    ) |>

    # RV10: Summary Statistics Type ----
    add_row(
      criterion_id = "RV10",
      criterion_title = "Summary Statistics Type",
      required_recommended = "Recommended",
      relevant_data = "Uncertainty types: Standard Deviation",
      score = 2L,
      limitations = "Mean +/- SD reported."
    ) |>

    # RV11: Supporting Parameters ----
    add_row(
      criterion_id = "RV11",
      criterion_title = "Supporting Parameters",
      required_recommended = "Recommended",
      relevant_data = "1 protocol:\nFractionation Protocol - Total",
      score = 1L,
      limitations = "Total metals appropriate; no additional supporting parameters required."
    )
}


#' Create Example CREED Scores Tibble
#'
#' @description Creates a 1-row CREED scores summary tibble with test data.
#' Inherits column structure from [initialise_CREED_scores_tibble()].
#'
#' @returns A tibble with 1 row of dummy CREED scores data
#'
#' @examples
#' example_CREED_scores_tibble()
#'
#' @family example_tibble
#' @family CREED
#' @importFrom dplyr add_row
#' @export
example_CREED_scores_tibble <- function() {
  initialise_CREED_scores_tibble() |>
    add_row(
      REFERENCE_ID = "REF-001",
      SILVER_RELIABILITY = "Usable with restrictions",
      SILVER_RELEVANCE = "Usable with restrictions",
      GOLD_RELIABILITY = "Usable with restrictions",
      GOLD_RELEVANCE = "Usable with restrictions"
    )
}

#' Convert CREED Tibble to Mock Input List
#'
#' @description Converts a CREED data tibble (from [example_CREED_reliability_tibble()]
#' or [example_CREED_relevance_tibble()]) into a mock Shiny input list object suitable
#' for testing `collect_CREED_data()`.
#'
#' @param creed_tibble A tibble with columns: `criterion_id`, `relevant_data`,
#'   `score`, `limitations`.
#'
#' @returns A named list with entries for each criterion's score, relevant data,
#'   and limitations (or justification for RB8), suitable for use as a mock
#'   Shiny `input` object.
#'
#' @details
#' Score values are converted from numeric to text:
#' - 1 = "Fully Met" (or "Not Relevant")
#' - 2 = "Partly Met"
#' - 3 = "Not Reported"
#' - 4 = "Not Met"
#'
#' @examples
#' CREED_tibble_to_mock_input(example_CREED_reliability_tibble())
#'
#' @family CREED
#' @export
CREED_tibble_to_mock_input <- function(creed_tibble) {
  # Score numeric -> text lookup (inverse of CREED_choices_vocabulary) ----
  score_labels <- c(
    "1" = "Fully Met",
    "2" = "Partly Met",
    "3" = "Not Reported",
    "4" = "Not Met"
  )

  # Build mock input list ----
  mock_input <- list()

  for (i in seq_len(nrow(creed_tibble))) {
    row <- creed_tibble[i, ]
    criterion_id <- row$criterion_id

    # Convert numeric score to text label ----
    score_text <- score_labels[as.character(row$score)]

    # Add score and relevant_data ----
    mock_input[[paste0(criterion_id, "_score")]] <- score_text
    mock_input[[paste0(criterion_id, "_relevant_data")]] <- row$relevant_data

    # RB8 uses _justification; all others use _limitations ----
    if (criterion_id == "RB8") {
      # Strip "Justification: " prefix if present (it gets added back by collect_CREED_data)
      justification <- row$limitations
      justification <- sub("^Justification: ", "", justification)
      mock_input[[paste0(criterion_id, "_justification")]] <- justification
    } else {
      mock_input[[paste0(criterion_id, "_limitations")]] <- row$limitations
    }
  }

  mock_input
}
