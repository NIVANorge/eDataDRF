# Initialise tibbles for each "table" of data used across the modules.
# Doing this in one place makes it easier (but not easy) to keep things consistent.
# The plan is that eventually all functions that are dependent on table format will
# be based in some way on these functions. That may prove to be impractical. But it's a start.
# I also mention a bunch of database TABLES. These don't actually exist yet, but are
# useful for understanding the structure of the data
# eData DRF Version - Not Tracked
# Last Updated 2025.02.05

# -----------------------
# ---- TABLE FORMATS ----
# -----------------------

#' Initialise campaign tibble
#'
#' Creates an empty tibble with the standardised column structure for campaign data.
#'
#' @details
#' Campaigns represent sampling projects or studies with metadata about timing,
#' organisation, data quality evaluation, and confidentiality. The tibble includes
#' the following columns:
#'
#' CAMPAIGN_NAME_SHORT: Short identifier for the campaign
#'
#' CAMPAIGN_NAME: Full descriptive name of the campaign
#'
#' CAMPAIGN_START_DATE: Date when campaign sampling began
#'
#' CAMPAIGN_END_DATE: Date when campaign sampling ended
#'
#' RELIABILITY_SCORE: Quality assessment score for the campaign data
#'
#' RELIABILITY_EVAL_SYS: System or framework used for reliability evaluation
#'
#' CONFIDENTIALITY_EXPIRY_DATE: Date when data confidentiality restrictions expire
#'
#' ORGANISATION: Organisation responsible for the campaign
#'
#' ENTERED_BY: Person or entity who entered the data
#'
#' ENTERED_DATE: Date when the data was entered into the system
#'
#' CAMPAIGN_COMMENT: Additional notes or comments about the campaign
#'
#' See vignette("campaign-data") for more information.
#'
#' @return A tibble with 0 rows and standardised campaign columns
#' @family initialise_tibble
#' @family campaign
#' @importFrom tibble tibble
#' @export
initialise_campaign_tibble <- function() {
  tibble(
    CAMPAIGN_NAME_SHORT = character(),
    CAMPAIGN_NAME = character(),
    CAMPAIGN_START_DATE = as.Date(character()),
    CAMPAIGN_END_DATE = as.Date(character()),
    RELIABILITY_SCORE = character(),
    RELIABILITY_EVAL_SYS = character(),
    CONFIDENTIALITY_EXPIRY_DATE = as.Date(character()),
    ORGANISATION = character(),
    ENTERED_BY = character(),
    ENTERED_DATE = as.Date(character()),
    CAMPAIGN_COMMENT = character()
  )
}

#' Initialise biota tibble
#'
#' Creates an empty tibble with the standardised column structure for biota data.
#'
#' @details
#' Biota data extends sample information with species-specific details including
#' taxonomic classification, tissue type, life stage, and gender information. The
#' tibble includes the following columns:
#'
#' SAMPLE_ID: Unique identifier linking to the samples table
#'
#' SITE_CODE: Code identifying the sampling location
#'
#' PARAMETER_NAME: Name of the measured parameter or stressor
#'
#' ENVIRON_COMPARTMENT: Broad environmental compartment category
#'
#' ENVIRON_COMPARTMENT_SUB: Specific sub-category of the environmental compartment
#'
#' MEASURED_CATEGORY: Category indicating measurement context (External, Internal, Surface)
#'
#' SAMPLING_DATE: Date when the biological sample was collected
#'
#' SUBSAMPLE: Identifier for subsample or replicate
#'
#' SPECIES_GROUP: Taxonomic group classification (e.g., Fish, Molluscs, Plants)
#'
#' SAMPLE_SPECIES: Scientific or common name of the sampled species
#'
#' SAMPLE_TISSUE: Type of biological tissue sampled
#'
#' SAMPLE_SPECIES_LIFESTAGE: Life stage of the organism at sampling
#'
#' SAMPLE_SPECIES_GENDER: Gender or sex of the sampled organism
#'
#' BIOTA_COMMENT: Additional notes or comments about the biological sample
#'
#' @return A tibble with 0 rows and standardised biota columns
#' @family initialise_tibble
#' @family biota
#' @importFrom tibble tibble
#' @export
initialise_biota_tibble <- function() {
  tibble(
    SAMPLE_ID = character(),
    SITE_CODE = character(),
    PARAMETER_NAME = character(),
    ENVIRON_COMPARTMENT = character(),
    ENVIRON_COMPARTMENT_SUB = character(),
    MEASURED_CATEGORY = character(),
    SAMPLING_DATE = character(),
    SUBSAMPLE = character(),
    SPECIES_GROUP = character(),
    SAMPLE_SPECIES = character(),
    SAMPLE_TISSUE = character(),
    SAMPLE_SPECIES_LIFESTAGE = character(),
    SAMPLE_SPECIES_GENDER = character(),
    BIOTA_COMMENT = character()
  )
}


#' Initialise compartments tibble
#'
#' Creates an empty tibble with the standardised column structure for environmental compartment data.
#'
#' @details
#' Compartments define the environmental matrix and measurement context for sampling
#' activities. The tibble includes the following columns:
#'
#' ENVIRON_COMPARTMENT: Broad environmental compartment (Aquatic, Atmospheric, Terrestrial, Biota)
#'
#' ENVIRON_COMPARTMENT_SUB: Specific sub-category within the compartment
#'
#' MEASURED_CATEGORY: Measurement context (External Media, Internal to Organism, Surface of Organism)
#'
#' One immediate child function: create_compartment_combination() in mod_compartments_fct.R
#'
#' @return A tibble with 0 rows and standardised compartment columns
#' @family initialise_tibble
#' @family compartment
#' @importFrom tibble tibble
#' @export
initialise_compartments_tibble <- function() {
  tibble(
    ENVIRON_COMPARTMENT = character(),
    ENVIRON_COMPARTMENT_SUB = character(),
    MEASURED_CATEGORY = character()
  )
}

#' Initialise methods tibble
#'
#' Creates an empty tibble with the standardised column structure for analytical methods data.
#'
#' @details
#' Methods describe the protocols used for sampling, extraction, fractionation, and
#' analysis procedures. The tibble includes the following columns:
#'
#' PROTOCOL_ID: Unique identifier for the protocol (Primary Key)
#'
#' CAMPAIGN_NAME: Name of the campaign this protocol was used in
#'
#' PROTOCOL_CATEGORY: Type of protocol (Sampling, Extraction, Fractionation, Analytical)
#'
#' PROTOCOL_NAME: Standardised name of the protocol
#'
#' PROTOCOL_COMMENT: Additional notes or details about the protocol
#'
#' @return A tibble with 0 rows and standardised methods columns
#' @family initialise_tibble
#' @family method
#' @importFrom tibble tibble
#' @export
initialise_methods_tibble <- function() {
  tibble(
    PROTOCOL_ID = character(), # Primary Key
    CAMPAIGN_NAME = character(),
    PROTOCOL_CATEGORY = character(),
    PROTOCOL_NAME = character(),
    PROTOCOL_COMMENT = character()
  )
}

#' Initialise parameters tibble
#'
#' Creates an empty tibble with the standardised column structure for parameter data.
#'
#' @details
#' Parameters define chemical substances, physical properties, or biological markers
#' being measured, including classification and chemical identifiers. The tibble
#' includes the following columns:
#'
#' PARAMETER_TYPE: Broad classification (Stressor, Quality parameter, Normalisation, etc.)
#'
#' PARAMETER_TYPE_SUB: Sub-classification providing more specific categorisation
#'
#' MEASURED_TYPE: Type of measurement (Concentration, Dose, Physical parameter, etc.)
#'
#' PARAMETER_NAME: Standardised name of the parameter (Primary Key)
#'
#' PARAMETER_NAME_SUB: Additional specification or variant of the parameter name
#'
#' INCHIKEY_SD: InChIKey identifier for chemical substances
#'
#' PUBCHEM_CID: PubChem Compound Identifier
#'
#' CAS_RN: Chemical Abstracts Service Registry Number
#'
#' ENTERED_BY: Person or entity who entered the parameter
#'
#' PARAMETER_COMMENT: Additional notes about the parameter
#'
#' @return A tibble with 0 rows and standardised parameter columns
#' @family initialise_tibble
#' @family parameter
#' @importFrom tibble tibble
#' @export
initialise_parameters_tibble <- function() {
  tibble(
    PARAMETER_TYPE = character(),
    PARAMETER_TYPE_SUB = character(),
    MEASURED_TYPE = character(),
    PARAMETER_NAME = character(), # Primary Key
    PARAMETER_NAME_SUB = character(),
    INCHIKEY_SD = character(),
    PUBCHEM_CID = integer(),
    CAS_RN = character(),
    ENTERED_BY = character(),
    PARAMETER_COMMENT = character()
  )
}

#' Initialise references tibble
#'
#' Creates an empty tibble with the standardised column structure for reference data.
#'
#' @details
#' References provide bibliographic information for data sources including journals,
#' reports, datasets, and other published materials. The tibble includes the following
#' columns:
#'
#' REFERENCE_ID: Unique identifier for the reference (Primary Key)
#'
#' REFERENCE_TYPE: Type of publication (Journal Article, Report, Dataset, etc.)
#'
#' DATA_SOURCE: Source or database where the reference was obtained
#'
#' AUTHOR: Author(s) of the reference
#'
#' TITLE: Title of the publication or document
#'
#' YEAR: Publication year
#'
#' ACCESS_DATE: Date when the reference was accessed or retrieved
#'
#' PERIODICAL_JOURNAL: Name of the journal or periodical
#'
#' VOLUME: Volume number of the journal
#'
#' ISSUE: Issue number of the journal
#'
#' PUBLISHER: Publisher of the document
#'
#' INSTITUTION: Institution associated with the publication
#'
#' DOI: Digital Object Identifier
#'
#' URL: Web address for online access
#'
#' ISBN_ISSN: ISBN or ISSN identifier
#'
#' EDITION: Edition of the publication
#'
#' DOCUMENT_NUMBER: Document or report number
#'
#' REF_COMMENT: Additional notes about the reference
#'
#' @return A tibble with 0 rows and standardised reference columns
#' @family initialise_tibble
#' @family reference
#' @importFrom tibble tibble
#' @export
initialise_references_tibble <- function() {
  tibble(
    REFERENCE_ID = character(), # Primary Key
    REFERENCE_TYPE = character(),
    DATA_SOURCE = character(),
    AUTHOR = character(),
    TITLE = character(),
    YEAR = integer(),
    ACCESS_DATE = as.Date(character()),
    PERIODICAL_JOURNAL = character(),
    VOLUME = integer(),
    ISSUE = integer(),
    PUBLISHER = character(),
    INSTITUTION = character(),
    DOI = character(),
    URL = character(),
    ISBN_ISSN = character(),
    EDITION = character(),
    DOCUMENT_NUMBER = character(),
    REF_COMMENT = character()
  )
}

#' Initialise samples tibble
#'
#' Creates an empty tibble with the standardised column structure for sample data.
#'
#' @details
#' Samples represent individual collections from sites with temporal, spatial, and
#' methodological information linking sites, parameters, and compartments. The tibble
#' includes the following columns:
#'
#' SITE_CODE: Code identifying the sampling location
#'
#' SITE_NAME: Descriptive name of the sampling site
#'
#' PARAMETER_NAME: Name of the measured parameter
#'
#' PARAMETER_TYPE: Classification of the parameter
#'
#' ENVIRON_COMPARTMENT: Environmental compartment sampled
#'
#' ENVIRON_COMPARTMENT_SUB: Specific sub-compartment
#'
#' MEASURED_CATEGORY: Measurement context category
#'
#' SAMPLING_DATE: Date of sample collection
#'
#' SUBSAMPLE: Subsample or replicate identifier
#'
#' SUBSAMPLE_ID: Unique identifier for the subsample
#'
#' SAMPLE_ID: Unique identifier for the sample (Key)
#'
#' @return A tibble with 0 rows and standardised sample columns
#' @family initialise_tibble
#' @family sample
#' @importFrom tibble tibble
#' @export
initialise_samples_tibble <- function() {
  tibble(
    SITE_CODE = character(),
    SITE_NAME = character(),
    PARAMETER_NAME = character(),
    PARAMETER_TYPE = character(),
    ENVIRON_COMPARTMENT = character(),
    ENVIRON_COMPARTMENT_SUB = character(),
    MEASURED_CATEGORY = character(),
    SAMPLING_DATE = character(),
    SUBSAMPLE = character(),
    SUBSAMPLE_ID = character(),
    SAMPLE_ID = character() # Key
  )
}

#' Initialise sites tibble
#'
#' Creates an empty tibble with the standardised column structure for site data.
#'
#' @details
#' Sites represent sampling locations with geographic coordinates, administrative
#' boundaries, and descriptive metadata about the sampling location. The tibble
#' includes the following columns:
#'
#' SITE_CODE: Unique code identifying the site (Primary Key)
#'
#' SITE_NAME: Descriptive name of the sampling site
#'
#' SITE_GEOGRAPHIC_FEATURE: Broad geographic feature type
#'
#' SITE_GEOGRAPHIC_FEATURE_SUB: Specific sub-category of the geographic feature
#'
#' COUNTRY_ISO: ISO country code where the site is located
#'
#' OCEAN_IHO: International Hydrographic Organisation ocean region
#'
#' LATITUDE: Latitude coordinate in decimal degrees
#'
#' LONGITUDE: Longitude coordinate in decimal degrees
#'
#' SITE_COORDINATE_SYSTEM: Coordinate reference system used
#'
#' ALTITUDE_VALUE: Elevation or depth value
#'
#' ALTITUDE_UNIT: Unit of measurement for altitude
#'
#' ENTERED_BY: Person or entity who entered the site data
#'
#' ENTERED_DATE: Date when the site data was entered
#'
#' SITE_COMMENT: Additional notes about the site
#'
#' @return A tibble with 0 rows and standardised site columns
#' @family initialise_tibble
#' @family site
#' @importFrom tibble tibble
#' @export
initialise_sites_tibble <- function() {
  # Used to construct SITES table
  tibble(
    SITE_CODE = character(), # Primary Key
    SITE_NAME = character(),
    SITE_GEOGRAPHIC_FEATURE = character(),
    SITE_GEOGRAPHIC_FEATURE_SUB = character(),
    COUNTRY_ISO = character(),
    OCEAN_IHO = character(),
    LATITUDE = numeric(),
    LONGITUDE = numeric(),
    SITE_COORDINATE_SYSTEM = character(),
    ALTITUDE_VALUE = numeric(),
    ALTITUDE_UNIT = character(),
    ENTERED_BY = character(),
    ENTERED_DATE = character(),
    SITE_COMMENT = character()
  )
}

#' Initialise measurements tibble
#'
#' Creates an empty tibble with the standardised column structure for measurements data.
#'
#' @details
#' Measurements represent quantitative observations combining sample, compartment, and
#' biota information with analytical results and quality metrics. The tibble includes
#' the following columns:
#'
#' SITE_CODE: Code identifying the sampling location
#'
#' PARAMETER_NAME: Name of the measured parameter (Foreign key)
#'
#' SAMPLING_DATE: Date of sample collection
#'
#' ENVIRON_COMPARTMENT_SUB: Specific environmental sub-compartment
#'
#' SUBSAMPLE: Subsample identifier
#'
#' MEASURED_FLAG: Quality flag for the measurement (e.g., < LOQ, < LOD)
#'
#' MEASURED_VALUE: Numeric value of the measurement
#'
#' UNCERTAINTY_TYPE: Type of uncertainty or variability metric
#'
#' UNCERTAINTY_UPPER: Upper bound of uncertainty
#'
#' UNCERTAINTY_LOWER: Lower bound of uncertainty
#'
#' MEASURED_UNIT: Unit of measurement
#'
#' MEASURED_N: Number of replicates or observations
#'
#' LOQ_VALUE: Limit of quantification value
#'
#' LOQ_UNIT: Unit for limit of quantification
#'
#' LOD_VALUE: Limit of detection value
#'
#' LOD_UNIT: Unit for limit of detection
#'
#' SAMPLING_PROTOCOL: Protocol used for sample collection (Foreign key)
#'
#' EXTRACTION_PROTOCOL: Protocol used for sample extraction (Foreign key)
#'
#' FRACTIONATION_PROTOCOL: Protocol used for sample fractionation (Foreign key)
#'
#' ANALYTICAL_PROTOCOL: Protocol used for analysis (Foreign key)
#'
#' REFERENCE_ID: Reference identifier for data source (Foreign key)
#'
#' SAMPLE_ID: Unique sample identifier
#'
#' CAMPAIGN_NAME_SHORT: Short name of the associated campaign
#'
#' ENVIRON_COMPARTMENT: Broad environmental compartment
#'
#' PARAMETER_TYPE: Classification of the parameter
#'
#' MEASURED_TYPE: Type of measurement
#'
#' MEASUREMENT_COMMENT: Additional notes about the measurement
#'
#' @return A tibble with 0 rows and standardised measurement columns
#' @family initialise_tibble
#' @family measurement
#' @importFrom tibble tibble
#' @export
## Initialise measurement combinations data frame ----
initialise_measurements_tibble <- function() {
  # Used to construct MEASUREMENTS table
  # Merges SAMPLES, COMPARTMENTS, BIOTA
  tibble(
    SITE_CODE = character(),
    PARAMETER_NAME = character(), # Foreign key
    SAMPLING_DATE = character(),
    ENVIRON_COMPARTMENT_SUB = character(),
    SUBSAMPLE = character(),
    MEASURED_FLAG = character(),
    MEASURED_VALUE = numeric(),
    UNCERTAINTY_TYPE = character(),
    UNCERTAINTY_UPPER = numeric(),
    UNCERTAINTY_LOWER = numeric(),
    MEASURED_UNIT = character(),
    MEASURED_N = numeric(),
    LOQ_VALUE = numeric(),
    LOQ_UNIT = character(),
    LOD_VALUE = numeric(),
    LOD_UNIT = character(),
    SAMPLING_PROTOCOL = character(), # Foreign key
    EXTRACTION_PROTOCOL = character(), # Foreign key
    FRACTIONATION_PROTOCOL = character(), # Foreign key
    ANALYTICAL_PROTOCOL = character(), # Foreign key
    # These variables are not immediately relevant to measurement entry, so we shuffle them to the back
    REFERENCE_ID = character(), # Foreign key
    SAMPLE_ID = character(),
    CAMPAIGN_NAME_SHORT = character(),
    ENVIRON_COMPARTMENT = character(),
    PARAMETER_TYPE = character(),
    MEASURED_TYPE = character(),
    MEASUREMENT_COMMENT = character()
  )
}

#' Initialise CREED scores tibble
#'
#' Creates an empty tibble with the standardised column structure for CREED final scores.
#'
#' @details
#' CREED scores provide data quality assessment results for references, evaluating both
#' reliability and relevance at silver and gold standard levels. The tibble includes
#' the following columns:
#'
#' REFERENCE_ID: Unique identifier linking to the references table
#'
#' SILVER_RELIABILITY: Reliability score at silver standard level
#'
#' SILVER_RELEVANCE: Relevance score at silver standard level
#'
#' GOLD_RELIABILITY: Reliability score at gold standard level
#'
#' GOLD_RELEVANCE: Relevance score at gold standard level
#'
#' @return A tibble with 0 rows and standardised CREED columns
#' @family initialise_tibble
#' @family CREED
#' @importFrom tibble tibble
#' @export
initialise_CREED_scores_tibble <- function() {
  # Used to construct CREED SCORES table
  tibble(
    REFERENCE_ID = character(),
    SILVER_RELIABILITY = character(),
    SILVER_RELEVANCE = character(),
    GOLD_RELIABILITY = character(),
    GOLD_RELEVANCE = character()
  )
}

#' Initialise CREED criteria data tibble
#'
#' Creates an empty tibble with the standardised column structure for detailed CREED
#' criterion assessment data.
#'
#' @details
#' CREED criteria data stores individual criterion scores, relevant data, and limitations
#' for both reliability and relevance assessments. This structure is used internally
#' by assessment modules and is not part of the externally-available table structure.
#' The tibble includes the following columns:
#'
#' criterion_id: Unique identifier for the CREED criterion
#'
#' criterion_title: Descriptive title of the criterion
#'
#' required_recommended: Whether the criterion is required or recommended
#'
#' relevant_data: Data or information relevant to assessing the criterion
#'
#' score: Assessment score for the criterion
#'
#' limitations: Identified limitations or concerns for the criterion
#'
#' @return A tibble with 0 rows and standardised CREED criterion columns
#' @family initialise_tibble
#' @family CREED
#' @importFrom tibble tibble
#' @export
initialise_CREED_data_tibble <- function() {
  tibble(
    criterion_id = character(),
    criterion_title = character(),
    required_recommended = character(),
    relevant_data = character(),
    score = character(),
    limitations = character()
  )
}

# ------------------------
# ------ VOCABULARY ------
# ------------------------

#' Geographic features controlled vocabulary
#'
#' Returns controlled vocabulary options for site geographic features.
#'
#' @details
#' Provides standardised categories for classifying sampling site locations by their
#' primary geographic feature type. Options include:
#'
#' Not relevant
#'
#' Not reported
#'
#' River, stream, canal
#'
#' Lake, pond, pool, reservoir
#'
#' Ocean, sea, territorial waters
#'
#' Coastal, fjord
#'
#' Estuary
#'
#' Drainage, sewer, artificial water
#'
#' Swamp, wetland
#'
#' Groundwater, aquifer
#'
#' WWTP
#'
#' Artificial Land/Urban Areas
#'
#' Landfills
#'
#' Cropland
#'
#' Woodland, forest
#'
#' Shrubland
#'
#' Grassland
#'
#' Bare land and lichen/moss
#'
#' Glacier
#'
#' Other
#'
#' @return A character vector of geographic feature options
#' @family vocabulary
#' @family site
#' @export
geographic_features_vocabulary <- function() {
  c(
    "Not relevant",
    "Not reported",
    "River, stream, canal",
    "Lake, pond, pool, reservoir",
    "Ocean, sea, territorial waters",
    "Coastal, fjord",
    "Estuary",
    "Drainage, sewer, artificial water",
    "Swamp, wetland",
    "Groundwater, aquifer",
    "WWTP",
    "Artificial Land/Urban Areas",
    "Landfills",
    "Cropland",
    "Woodland, forest",
    "Shrubland",
    "Grassland",
    "Bare land and lichen/moss",
    "Glacier",
    "Other"
  )
}

#' Geographic feature sub-categories controlled vocabulary
#'
#' Returns controlled vocabulary options for geographic feature subcategories.
#'
#' @details
#' Provides additional detail for geographic features, particularly for aquatic
#' environments. Options include:
#'
#' Not relevant
#'
#' Not reported
#'
#' Water surface
#'
#' Water column, pelagic zone
#'
#' Water benthos
#'
#' Other
#'
#' @return A character vector of geographic feature subcategory options
#' @family vocabulary
#' @family site
#' @export
geographic_features_sub_vocabulary <- function() {
  c(
    "Not relevant",
    "Not reported",
    "Water surface",
    "Water column, pelagic zone",
    "Water benthos",
    "Other"
  )
}

#' Coordinate systems controlled vocabulary
#'
#' Returns controlled vocabulary options for spatial coordinate reference systems.
#'
#' @details
#' Provides standardised coordinate system identifiers commonly used in environmental
#' monitoring. Options include:
#'
#' Not relevant
#'
#' Not reported
#'
#' WGS 84
#'
#' UTM 32
#'
#' UTM 33
#'
#' UTM 34
#'
#' UTM 35
#'
#' ETRS89
#'
#' Other
#'
#' @return A character vector of coordinate system options
#' @family vocabulary
#' @family site
#' @export
coordinate_systems_vocabulary <- function() {
  c(
    "Not relevant",
    "Not reported",
    "WGS 84",
    "UTM 32",
    "UTM 33",
    "UTM 34",
    "UTM 35",
    "ETRS89",
    "Other"
  )
}

#' Countries controlled vocabulary
#'
#' Returns controlled vocabulary options for country names based on ISO 3166-1 standard.
#'
#' @details
#' Provides country names from the \link[ISOcodes]{ISO_3166_1} standard, with additional
#' options for data quality flags. Complete list includes:
#'
#' Not relevant
#'
#' Not reported
#'
#' All ISO 3166-1 country names (e.g., Afghanistan, Albania, Algeria, ...)
#'
#' @return A character vector of country options
#' @family vocabulary
#' @family site
#' @import ISOcodes
#' @export
countries_vocabulary <- function() {
  c(
    "Not relevant",
    "Not reported",
    ISOcodes::ISO_3166_1$Name
  )
}

#' Ocean areas controlled vocabulary
#'
#' Returns controlled vocabulary options for IHO ocean regions.
#'
#' @details
#' Provides ocean and sea names from the International Hydrographic Organisation (IHO)
#' regions dataset. The complete list is read from an internal data file (IHO_oceans.rds)
#' and includes options such as:
#'
#' Not relevant
#'
#' Not reported
#'
#' Other
#'
#' All IHO ocean region names (e.g., Arctic Ocean, Atlantic Ocean, Baltic Sea, Mediterranean Sea, ...)
#'
#' Data source: extdata/IHO_oceans.rds
#'
#' @return A character vector of ocean area options
#' @family vocabulary
#' @family site
#' @importFrom dplyr pull
#' @export
areas_vocabulary <- function() {
  IHO_oceans <- readRDS(
    system.file(
      "extdata",
      "IHO_oceans.rds",
      package = "eDataDRF",
      mustWork = TRUE
    )
  ) |>
    pull(NAME)

  c(
    "Not relevant",
    "Not reported",
    "Other",
    IHO_oceans
  )
}

#' Altitude units controlled vocabulary
#'
#' Returns controlled vocabulary options for altitude measurement units.
#'
#' @details
#' Provides standardised units for expressing elevation or depth values. Options include:
#'
#' km
#'
#' m
#'
#' cm
#'
#' mm
#'
#' @return A character vector of altitude unit options
#' @family vocabulary
#' @family site
#' @export
altitude_units_vocabulary <- function() {
  c("km", "m", "cm", "mm")
}

#' Dummy parameters controlled vocabulary
#'
#' Returns comprehensive parameter data combining quality parameters and chemical parameters.
#'
#' @details
#' Combines quality parameters with chemical parameters from the ClassyFire taxonomy.
#' Quality parameters are read from dummy_quality_parameters.parquet and chemical
#' parameters from ClassyFire_Taxonomy_2025_02.parquet. The resulting dataset includes
#' columns for parameter classification, chemical identifiers (InChIKey, PubChem CID,
#' CAS RN), and measurement types.
#'
#' Note: Quality parameters are currently "dummy" data as a comprehensive validated
#' list has not yet been compiled.
#'
#' Data sources:
#'
#' extdata/dummy_quality_parameters.parquet
#'
#' extdata/ClassyFire_Taxonomy_2025_02.parquet
#'
#' @return A data frame combining quality and chemical parameter data
#' @family vocabulary
#' @family parameter
#' @importFrom dplyr mutate arrange bind_rows case_when
#' @importFrom arrow read_parquet
#' @export
# TODO: We call this "dummy" data for the simple reason that I've never looked for or made my own comprehensive list of quality parameters.
dummy_parameters_vocabulary <- function() {
  # Read dummy_parameters ----
  dummy_quality_params <- read_parquet(
    file = system.file(
      "extdata",
      "dummy_quality_parameters.parquet",
      package = "eDataDRF",
      mustWork = TRUE
    )
  ) |>
    mutate(ENTERED_BY = "saw@niva.no")

  # Read and prepare chemical_parameters ----
  chemical_parameters <- read_parquet(
    file = system.file(
      "extdata",
      "ClassyFire_Taxonomy_2025_02.parquet",
      package = "eDataDRF",
      mustWork = TRUE
    )
  ) |>
    mutate(
      MEASURED_TYPE = "Concentration",
      ENTERED_BY = "saw@niva.no"
    ) |>
    arrange(PARAMETER_NAME) |>
    mutate(
      PARAMETER_TYPE_SUB = case_when(
        PARAMETER_NAME == "Carbon" ~ "Carbon",
        TRUE ~ PARAMETER_TYPE_SUB
      ),
      PARAMETER_NAME_SUB = "",
      CAS_RN = as.character(CAS_RN)
    )

  # Merge datasets ----
  bind_rows(dummy_quality_params, chemical_parameters)
}

#' Parameter types controlled vocabulary
#'
#' Returns controlled vocabulary options for broad parameter classifications.
#'
#' @details
#' Provides high-level categories for classifying measured parameters. Options include:
#'
#' Not relevant
#'
#' Stressor
#'
#' Quality parameter
#'
#' Normalisation
#'
#' Background
#'
#' Ecological Indicator
#'
#' Other
#'
#' @return A character vector of parameter type options
#' @family vocabulary
#' @family parameter
#' @export
parameter_types_vocabulary <- function() {
  c(
    "Not relevant",
    "Stressor",
    "Quality parameter",
    "Normalisation",
    "Background",
    "Ecological Indicator",
    "Other"
  )
}

#' Parameter type sub-categories controlled vocabulary
#'
#' Returns controlled vocabulary options for parameter type subcategories.
#'
#' @details
#' Provides more specific classifications derived from the dummy parameters dataset.
#' The list is dynamically generated from unique PARAMETER_TYPE_SUB values and includes
#' options such as:
#'
#' Mixture
#'
#' Not reported
#'
#' All unique sub-types from dummy_parameters_vocabulary() (e.g., Carbon, Inorganic compounds, Organic compounds, etc.)
#'
#' @return A character vector of parameter type subcategory options
#' @family vocabulary
#' @family parameter
#' @importFrom dplyr select distinct arrange pull
#' @export
parameter_types_sub_vocabulary <- function() {
  dummy_parameters <- dummy_parameters_vocabulary()

  dummy_parameters |>
    select(PARAMETER_TYPE_SUB) |>
    distinct() |>
    arrange(PARAMETER_TYPE_SUB) |>
    pull(PARAMETER_TYPE_SUB) |>
    append(c("Mixture", "Not reported"))
}

#' Measured types controlled vocabulary
#'
#' Returns controlled vocabulary options for types of measurements.
#'
#' @details
#' Provides standardised categories for the nature of measurements being recorded.
#' Options include:
#'
#' Concentration
#'
#' Dose rate
#'
#' Dose
#'
#' Physical parameter
#'
#' Amount
#'
#' Volume
#'
#' Fraction of total
#'
#' Percent
#'
#' Irradiance
#'
#' Response
#'
#' Ecological Indicator
#'
#' Not relevant
#'
#' Other
#'
#' @return A character vector of measured type options
#' @family vocabulary
#' @family parameter
#' @family measurement
#' @export
measured_types_vocabulary <- function() {
  c(
    "Concentration",
    "Dose rate",
    "Dose",
    "Physical parameter",
    "Amount",
    "Volume",
    "Fraction of total",
    "Percent",
    "Irradiance",
    "Response",
    "Ecological Indicator",
    "Not relevant",
    "Other"
  )
}

#' Environmental compartment sub-categories controlled vocabulary
#'
#' Returns controlled vocabulary mapping for environmental sub-compartments organized by main compartment.
#'
#' @details
#' Provides a hierarchical structure of environmental sub-compartments grouped by their
#' main compartment type. The list includes:
#'
#' Aquatic: Freshwater, Marine/Salt Water, Brackish/Transitional Water, Groundwater, Wastewater, Liquid Growth Medium, Rainwater, Stormwater, Leachate, Aquatic Sediment, Porewater, Sludge, Snow/Ice
#'
#' Atmospheric: Indoor Air, Outdoor Air
#'
#' Terrestrial: Terrestrial Biological Residue, Soil H Horizon (Peat), Soil O Horizon (Organic), Soil A Horizon (Topsoil), Soil E Horizon (Mineral), Soil S Horizon (Mineral), Soil C Horizon (Parent Material), Soil R Horizon (Bedrock)
#'
#' Biota: Biota, Terrestrial, Biota, Aquatic, Biota, Atmospheric, Biota, Other
#'
#' @return A named list of character vectors with sub-compartment options for each main compartment
#' @family vocabulary
#' @family compartment
#' @export
environ_compartments_sub_vocabulary <- function() {
  list(
    "Aquatic" = c(
      "Freshwater" = "Freshwater",
      "Marine/Salt Water" = "Marine/Salt Water",
      "Brackish/Transitional Water" = "Brackish/Transitional Water",
      "Groundwater" = "Groundwater",
      "Wastewater" = "Wastewater",
      "Liquid Growth Medium" = "Liquid Growth Medium",
      "Rainwater" = "Rainwater",
      "Stormwater" = "Stormwater",
      "Leachate" = "Leachate",
      "Aquatic Sediment" = "Aquatic Sediment",
      "Porewater" = "Porewater",
      "Sludge" = "Sludge",
      "Snow/Ice" = "Snow/Ice"
    ),
    "Atmospheric" = c(
      "Indoor Air" = "Indoor Air",
      "Outdoor Air" = "Outdoor Air"
    ),
    "Terrestrial" = c(
      "Terrestrial Biological Residue" = "Terrestrial Biological Residue",
      "Soil H Horizon (Peat)" = "Soil H Horizon (Peat)",
      "Soil O Horizon (Organic)" = "Soil O Horizon (Organic)",
      "Soil A Horizon (Topsoil)" = "Soil A Horizon (Topsoil)",
      "Soil E Horizon (Mineral)" = "Soil E Horizon (Mineral)",
      "Soil S Horizon (Mineral)" = "Soil S Horizon (Mineral)",
      "Soil C Horizon (Parent Material)" = "Soil C Horizon (Parent Material)",
      "Soil R Horizon (Bedrock)" = "Soil R Horizon (Bedrock)"
    ),
    "Biota" = c(
      "Biota, Terrestrial" = "Biota, Terrestrial",
      "Biota, Aquatic" = "Biota, Aquatic",
      "Biota, Atmospheric" = "Biota, Atmospheric",
      "Biota, Other" = "Biota, Other"
    )
  )
}

#' Environmental compartments controlled vocabulary
#'
#' Returns controlled vocabulary options for broad environmental compartments.
#'
#' @details
#' Provides top-level categories for environmental matrices. Options include:
#'
#' Aquatic
#'
#' Atmospheric
#'
#' Terrestrial
#'
#' Biota
#'
#' Not relevant
#'
#' Not reported
#'
#' Other
#'
#' @return A character vector of environmental compartment options
#' @family vocabulary
#' @family compartment
#' @export
environ_compartments_vocabulary <- function() {
  c(
    "Aquatic",
    "Atmospheric",
    "Terrestrial",
    "Biota",
    "Not relevant",
    "Not reported",
    "Other"
  )
}

#' Measured categories controlled vocabulary
#'
#' Returns controlled vocabulary options for measurement context categories.
#'
#' @details
#' Provides standardised categories indicating where measurements were taken relative
#' to organisms. Options include:
#'
#' External: External Media
#'
#' Internal: Internal to Organism
#'
#' Surface: Surface of Organism
#'
#' @return A character vector of measured category options
#' @family vocabulary
#' @family compartment
#' @family measurement
#' @export
measured_categories_vocabulary <- function() {
  c(
    "External" = "External Media",
    "Internal" = "Internal to Organism",
    "Surface" = "Surface of Organism"
  )
}

#' Species names controlled vocabulary
#'
#' Returns species information from EPA ECOTOX database.
#'
#' @details
#' Provides comprehensive species data including common names, scientific names, kingdom,
#' and species group classifications. Data is read from ecotox_2025_06_12_species.parquet
#' and includes the following columns:
#'
#' SPECIES_COMMON_NAME: Common or vernacular name
#'
#' SPECIES_NAME: Scientific (Latin) name
#'
#' SPECIES_KINGDOM: Taxonomic kingdom
#'
#' SPECIES_GROUP: Broad taxonomic grouping
#'
#' Additional entries for "Other" and "Ecosystem" are included.
#'
#' Data source: extdata/ecotox_2025_06_12_species.parquet
#'
#' @return A data frame of species information
#' @family vocabulary
#' @family biota
#' @importFrom dplyr mutate bind_rows
#' @importFrom tibble tibble
#' @importFrom arrow read_parquet
#' @export
species_names_vocabulary <- function() {
  read_parquet(
    system.file(
      "extdata",
      "ecotox_2025_06_12_species.parquet",
      package = "eDataDRF",
      mustWork = TRUE
    )
  ) |>
    mutate(
      SPECIES_COMMON_NAME = common_name,
      SPECIES_NAME = latin_name,
      SPECIES_KINGDOM = kingdom,
      SPECIES_GROUP = species_group,
      .keep = "none"
    ) |>
    bind_rows(tibble(
      SPECIES_COMMON_NAME = c("Other", "Ecosystem"),
      SPECIES_NAME = c("Other", "Ecosystem"),
      SPECIES_KINGDOM = c("Other", "Ecosystem"),
      SPECIES_GROUP = c("Other", "Ecosystem")
    ))
}


#' Tissue types controlled vocabulary
#'
#' Returns controlled vocabulary options for biological tissue types.
#'
#' @details
#' Provides standardised categories for biological tissues sampled from organisms.
#' Options include:
#'
#' Not reported
#'
#' Not relevant
#'
#' Whole body
#'
#' Total soft tissues
#'
#' Muscle
#'
#' Liver
#'
#' Kidney
#'
#' Fat/Adipose
#'
#' Skin
#'
#' Bone
#'
#' Pyloric caeca
#'
#' Body wall
#'
#' Brain
#'
#' Heart
#'
#' Lung
#'
#' Gill
#'
#' Gonad
#'
#' Shell
#'
#' Carapace
#'
#' Digestive Gland
#'
#' Mantle
#'
#' Blood
#'
#' Egg
#'
#' Larva
#'
#' Leaf
#'
#' Root
#'
#' Stem
#'
#' Fruit
#'
#' Seed
#'
#' Other
#'
#' @return A character vector of tissue type options
#' @family vocabulary
#' @family biota
#' @export
tissue_types_vocabulary <- function() {
  c(
    "Not reported",
    "Not relevant",
    "Whole body",
    "Total soft tissues",
    "Muscle",
    "Liver",
    "Kidney",
    "Fat/Adipose",
    "Skin",
    "Bone",
    "Pyloric caeca",
    "Body wall",
    "Brain",
    "Heart",
    "Lung",
    "Gill",
    "Gonad",
    "Shell",
    "Carapace",
    "Digestive Gland", # TODO: New
    "Mantle", # TODO: New
    "Blood",
    "Egg",
    "Larva",
    "Leaf",
    "Root",
    "Stem",
    "Fruit",
    "Seed",
    "Other"
  )
}

#' Life stages controlled vocabulary
#'
#' Returns controlled vocabulary options for organism life stages.
#'
#' @details
#' Provides standardised categories for developmental stages of sampled organisms.
#' Options include:
#'
#' Not reported
#'
#' Not relevant
#'
#' Adult
#'
#' Juvenile
#'
#' Larva
#'
#' Embryo
#'
#' Egg
#'
#' Seedling
#'
#' Mature
#'
#' Young
#'
#' Mixed
#'
#' Other
#'
#' @return A character vector of life stage options
#' @family vocabulary
#' @family biota
#' @export
lifestage_vocabulary <- function() {
  c(
    "Not reported",
    "Not relevant",
    "Adult",
    "Juvenile",
    "Larva",
    "Embryo",
    "Egg",
    "Seedling",
    "Mature",
    "Young",
    "Mixed",
    "Other"
  )
}

#' Gender controlled vocabulary
#'
#' Returns controlled vocabulary options for organism sex or gender.
#'
#' @details
#' Provides standardised categories for biological sex of sampled organisms. Options include:
#'
#' Not reported
#'
#' Not relevant
#'
#' Male
#'
#' Female
#'
#' Mixed
#'
#' Hermaphrodite
#'
#' Other
#'
#' @return A character vector of gender options
#' @family vocabulary
#' @family biota
#' @export
gender_vocabulary <- function() {
  c(
    "Not reported",
    "Not relevant",
    "Male",
    "Female",
    "Mixed",
    "Hermaphrodite",
    "Other"
  )
}

#' Species groups controlled vocabulary
#'
#' Returns controlled vocabulary options for broad taxonomic groups from EPA ECOTOX database.
#'
#' @details
#' Provides high-level taxonomic groupings used in the ECOTOX database. Options include:
#'
#' All
#'
#' Algae
#'
#' Amphibians
#'
#' Bacteria
#'
#' Birds
#'
#' Crustaceans
#'
#' Ecosystem
#'
#' Fish
#'
#' Fungi
#'
#' Insects/Spiders
#'
#' Invertebrates
#'
#' Mammals
#'
#' Molluscs
#'
#' Moss/Hornworts
#'
#' Plants
#'
#' Reptiles
#'
#' Worms
#'
#' Other
#'
#' @return A character vector of species group options
#' @family vocabulary
#' @family biota
#' @export
species_groups_vocabulary <- function() {
  c(
    "All",
    "Algae",
    "Amphibians",
    "Bacteria",
    "Birds",
    "Crustaceans",
    "Ecosystem",
    "Fish",
    "Fungi",
    "Insects/Spiders",
    "Invertebrates",
    "Mammals",
    "Molluscs",
    "Moss/Hornworts",
    "Plants",
    "Reptiles",
    "Worms",
    "Other"
  )
}

#' Uncertainty types controlled vocabulary
#'
#' Returns controlled vocabulary options for statistical uncertainty and variability measures.
#'
#' @details
#' Provides standardised categories for expressing measurement uncertainty commonly found
#' in scientific literature and databases. Options include:
#'
#' Not Reported
#'
#' Not Relevant
#'
#' Arithmetic Mean
#'
#' Geometric Mean
#'
#' Standard Deviation
#'
#' Standard Error
#'
#' 95% Confidence Interval
#'
#' 90% Confidence Interval
#'
#' 99% Confidence Interval
#'
#' Min-Max Range
#'
#' Interquartile Range (Q1-Q3)
#'
#' 10th-90th Percentile
#'
#' 5th-95th Percentile
#'
#' Coefficient of Variation (%)
#'
#' Median Absolute Deviation
#'
#' First-Third Quartile Range
#'
#' Minimum-Maximum
#'
#' Variance
#'
#' Standard Error of Mean
#'
#' Relative Standard Deviation (%)
#'
#' 95% Credible Interval
#'
#' 95% Prediction Interval
#'
#' 95% Tolerance Interval
#'
#' 95% Bootstrap CI
#'
#' Other
#'
#' @return A character vector of uncertainty type options
#' @family vocabulary
#' @family measurement
#' @export
uncertainty_types_vocabulary <- function() {
  c(
    "Not Reported",
    "Not Relevant",
    "Arithmetic Mean",
    "Geometric Mean",
    "Standard Deviation",
    "Standard Error",
    "95% Confidence Interval",
    "90% Confidence Interval",
    "99% Confidence Interval",
    "Min-Max Range",
    "Interquartile Range (Q1-Q3)",
    "10th-90th Percentile",
    "5th-95th Percentile",
    "Coefficient of Variation (%)",
    "Median Absolute Deviation",
    "First-Third Quartile Range",
    "Minimum-Maximum",
    "Variance",
    "Standard Error of Mean",
    "Relative Standard Deviation (%)",
    "95% Credible Interval",
    "95% Prediction Interval",
    "95% Tolerance Interval",
    "95% Bootstrap CI",
    "Other"
  )
}

# ------------------------
# --- CHARACTER LIMITS ---
# ------------------------

#' Reference field character limits
#'
#' Returns maximum character lengths for text fields in the references table.
#'
#' @details
#' Provides a named list of character limits for reference metadata fields to ensure
#' data quality and database compatibility. Limits include:
#'
#' DOCUMENT_NUMBER: 200 characters
#'
#' DOI: 200 characters
#'
#' EDITION: 200 characters
#'
#' INSTITUTION: 200 characters
#'
#' ISBN_ISSN: 200 characters
#'
#' PERIODICAL_JOURNAL: 200 characters
#'
#' PUBLISHER: 200 characters
#'
#' REF_COMMENT: 1000 characters
#'
#' URL: 200 characters
#'
#' @return A named list of character limits for reference fields
#' @family limits
#' @family reference
#' @export
reference_character_limits <- function() {
  list(
    # ACCESSION_NUMBER = 200,  # COMMENTED OUT
    # DB_NAME = 200,           # COMMENTED OUT
    # DB_PROVIDER = 200,       # COMMENTED OUT
    DOCUMENT_NUMBER = 200,
    DOI = 200,
    EDITION = 200,
    INSTITUTION = 200,
    ISBN_ISSN = 200,
    # NUMBER_OF_PAGES = 50,    # COMMENTED OUT
    # NUMBER_OF_VOLUMES = 100, # COMMENTED OUT
    # PAGES = 200,             # COMMENTED OUT
    PERIODICAL_JOURNAL = 200,
    # PMCID = 200,             # COMMENTED OUT
    # PUBLISHED_PLACE = 200,   # COMMENTED OUT
    PUBLISHER = 200,
    REF_COMMENT = 1000,
    # SERIES_EDITOR = 200,     # COMMENTED OUT
    # SERIES_TITLE = 200,      # COMMENTED OUT
    URL = 200
  )
}

# Protocol Vocabulary Functions ----
# Each protocol type creates its own tribble, then combined with bind_rows

#' Sampling protocols controlled vocabulary
#'
#' Returns sampling protocol options with short and long names.
#'
#' @details
#' Provides standardised sampling method classifications as a tibble with three columns:
#'
#' Protocol_Type: Always "Sampling Protocol"
#'
#' Short_Name: Abbreviated protocol name (e.g., "Point", "Composite", "Trawl")
#'
#' Long_Name: Full descriptive name (e.g., "Point sampling", "Composite sampling", "Trawl sampling")
#'
#' Available protocols include: Not relevant, Not reported, Point, Composite, Trawl, Grab, Core, Seine net, Electrofishing, Plankton net, Bailer, Peristaltic pump, Active air, Passive air, SPMD, SPE, LVSPE, DGT, Caged organisms, Blood sample, Biopsy, Other
#'
#' @return A tibble with Protocol_Type, Short_Name, and Long_Name columns
#' @family vocabulary
#' @family method
#' @importFrom tibble tribble
#' @export
sampling_protocols_vocabulary <- function() {
  tribble(
    ~Protocol_Type      , ~Short_Name        , ~Long_Name                            ,
    "Sampling Protocol" , "Not relevant"     , "Not relevant"                        ,
    "Sampling Protocol" , "Not reported"     , "Not reported"                        ,
    "Sampling Protocol" , "Point"            , "Point sampling"                      ,
    "Sampling Protocol" , "Composite"        , "Composite sampling"                  ,
    "Sampling Protocol" , "Trawl"            , "Trawl sampling"                      ,
    "Sampling Protocol" , "Grab"             , "Grab sampling"                       ,
    "Sampling Protocol" , "Core"             , "Core sampling"                       ,
    "Sampling Protocol" , "Seine net"        , "Seine net sampling"                  ,
    "Sampling Protocol" , "Electrofishing"   , "Electrofishing"                      ,
    "Sampling Protocol" , "Plankton net"     , "Plankton net sampling"               ,
    "Sampling Protocol" , "Bailer"           , "Bailer sampling"                     ,
    "Sampling Protocol" , "Peristaltic pump" , "Peristaltic pump sampling"           ,
    "Sampling Protocol" , "Active air"       , "Active air sampling"                 ,
    "Sampling Protocol" , "Passive air"      , "Passive air sampling"                ,
    "Sampling Protocol" , "SPMD"             , "Semipermeable membrane device"       ,
    "Sampling Protocol" , "SPE"              , "Solid phase extraction device"       ,
    "Sampling Protocol" , "LVSPE"            , "Large volume solid phase extraction" ,
    "Sampling Protocol" , "DGT"              , "Diffusive gradients in thin films"   ,
    "Sampling Protocol" , "Caged organisms"  , "Caged organism deployment"           ,
    "Sampling Protocol" , "Blood sample"     , "Blood sample"                        ,
    "Sampling Protocol" , "Biopsy"           , "Biopsy"                              ,
    "Sampling Protocol" , "Other"            , "Other"
  )
}

#' Fractionation protocols controlled vocabulary
#'
#' Returns fractionation protocol options with short and long names.
#'
#' @details
#' Provides standardised fractionation method classifications as a tibble with three columns:
#'
#' Protocol_Type: Always "Fractionation Protocol"
#'
#' Short_Name: Abbreviated protocol name (e.g., "Total", "Dissolved", "Filtered")
#'
#' Long_Name: Full descriptive name (e.g., "Total fraction", "Dissolved fraction", "Filtered fraction")
#'
#' Available protocols include: Not relevant, Not reported, Total, Particles, Colloidal, LMM, Aqueous, Filtered 0.45um, Filtered 0.2um, Dissolved, Filtered, Acid extractable, Reducible, Oxidisable, Residual, Bioavailable, Free ion, Size fractionated, Other
#'
#' @return A tibble with Protocol_Type, Short_Name, and Long_Name columns
#' @family vocabulary
#' @family method
#' @importFrom tibble tribble
#' @export
fractionation_protocols_vocabulary <- function() {
  tribble(
    ~Protocol_Type           , ~Short_Name         , ~Long_Name                                  ,
    "Fractionation Protocol" , "Not relevant"      , "Not relevant"                              ,
    "Fractionation Protocol" , "Not reported"      , "Not reported"                              ,
    "Fractionation Protocol" , "Total"             , "Total fraction"                            ,
    "Fractionation Protocol" , "Particles"         , "Particulate fraction"                      ,
    "Fractionation Protocol" , "Colloidal"         , "Colloidal fraction"                        ,
    "Fractionation Protocol" , "LMM"               , "Low molecular mass fraction"               ,
    "Fractionation Protocol" , "Aqueous"           , "Aqueous fraction"                          ,
    "Fractionation Protocol" , "Filtered 0.45um"   , "Filtered through 0.45 micrometer membrane" ,
    "Fractionation Protocol" , "Filtered 0.2um"    , "Filtered through 0.2 micrometer membrane"  ,
    "Fractionation Protocol" , "Dissolved"         , "Dissolved fraction"                        ,
    "Fractionation Protocol" , "Filtered"          , "Filtered fraction"                         ,
    "Fractionation Protocol" , "Acid extractable"  , "Acid extractable fraction"                 ,
    "Fractionation Protocol" , "Reducible"         , "Reducible fraction"                        ,
    "Fractionation Protocol" , "Oxidisable"        , "Oxidisable fraction"                       ,
    "Fractionation Protocol" , "Residual"          , "Residual fraction"                         ,
    "Fractionation Protocol" , "Bioavailable"      , "Bioavailable fraction"                     ,
    "Fractionation Protocol" , "Free ion"          , "Free ion activity"                         ,
    "Fractionation Protocol" , "Size fractionated" , "Size fractionated"                         ,
    "Fractionation Protocol" , "Other"             , "Other"
  )
}

#' Extraction protocols controlled vocabulary
#'
#' Returns extraction protocol options with short and long names.
#'
#' @details
#' Provides standardised extraction method classifications as a tibble with three columns:
#'
#' Protocol_Type: Always "Extraction Protocol"
#'
#' Short_Name: Abbreviated protocol name (e.g., "Methanol", "SPE Isolute Env+", "QuEChERS")
#'
#' Long_Name: Full descriptive name (e.g., "Methanol extraction", "Solid phase extraction with Isolute Env+ cartridge", "Quick easy cheap effective rugged safe extraction")
#'
#' Available protocols include: Not relevant, Not reported, None, Methanol, Dichloromethane, SPE Isolute Env+, Membrane filtration 0.45um, Membrane filtration 0.2um, Membrane filtration, Filtration, Microwave-assisted acid digestion, Acid digestion, Pressurised liquid, Ultrasonic, Soxhlet, QuEChERS, Accelerated solvent, Sequential extraction, Other
#'
#' @return A tibble with Protocol_Type, Short_Name, and Long_Name columns
#' @family vocabulary
#' @family method
#' @importFrom tibble tribble
#' @export
extraction_protocols_vocabulary <- function() {
  tribble(
    ~Protocol_Type        , ~Short_Name                         , ~Long_Name                                           ,
    "Extraction Protocol" , "Not relevant"                      , "Not relevant"                                       ,
    "Extraction Protocol" , "Not reported"                      , "Not reported"                                       ,
    "Extraction Protocol" , "None"                              , "No extraction"                                      ,
    "Extraction Protocol" , "Methanol"                          , "Methanol extraction"                                ,
    "Extraction Protocol" , "Dichloromethane"                   , "Dichloromethane extraction"                         ,
    "Extraction Protocol" , "SPE Isolute Env+"                  , "Solid phase extraction with Isolute Env+ cartridge" ,
    "Extraction Protocol" , "Membrane filtration 0.45um"        , "Membrane filtration through 0.45 micrometer"        ,
    "Extraction Protocol" , "Membrane filtration 0.2um"         , "Membrane filtration through 0.2 micrometer"         ,
    "Extraction Protocol" , "Membrane filtration"               , "Membrane filtration"                                ,
    "Extraction Protocol" , "Filtration"                        , "Filtration"                                         ,
    "Extraction Protocol" , "Microwave-assisted acid digestion" , "Microwave-assisted acid digestion"                  ,
    "Extraction Protocol" , "Acid digestion"                    , "Acid digestion"                                     ,
    "Extraction Protocol" , "Pressurised liquid"                , "Pressurised liquid extraction"                      ,
    "Extraction Protocol" , "Ultrasonic"                        , "Ultrasonic extraction"                              ,
    "Extraction Protocol" , "Soxhlet"                           , "Soxhlet extraction"                                 ,
    "Extraction Protocol" , "QuEChERS"                          , "Quick easy cheap effective rugged safe extraction"  ,
    "Extraction Protocol" , "Accelerated solvent"               , "Accelerated solvent extraction"                     ,
    "Extraction Protocol" , "Sequential extraction"             , "Sequential extraction protocol"                     ,
    "Extraction Protocol" , "Other"                             , "Other"
  )
}

#' Analytical protocols controlled vocabulary
#'
#' Returns analytical protocol options with short and long names.
#'
#' @details
#' Provides standardised analytical method classifications as a tibble with three columns:
#'
#' Protocol_Type: Always "Analytical Protocol"
#'
#' Short_Name: Abbreviated protocol name (e.g., "GC-MS", "LC-MS/MS", "ICP-MS")
#'
#' Long_Name: Full descriptive name (e.g., "Gas chromatography mass spectrometry", "Liquid chromatography tandem mass spectrometry", "Inductively coupled plasma mass spectrometry")
#'
#' Available protocols include: Not relevant, Not reported, GC-MS, LC-MS, LC-MS/MS, GC-MS/MS, UPLC, ICP-MS, ICP-OES, AAS, XRF, Ion chromatography, Spectrophotometry, Fluorescence, Other
#'
#' @return A tibble with Protocol_Type, Short_Name, and Long_Name columns
#' @family vocabulary
#' @family method
#' @importFrom tibble tribble
#' @export
analytical_protocols_vocabulary <- function() {
  tribble(
    ~Protocol_Type        , ~Short_Name          , ~Long_Name                                                 ,
    "Analytical Protocol" , "Not relevant"       , "Not relevant"                                             ,
    "Analytical Protocol" , "Not reported"       , "Not reported"                                             ,
    "Analytical Protocol" , "GC-MS"              , "Gas chromatography mass spectrometry"                     ,
    "Analytical Protocol" , "LC-MS"              , "Liquid chromatography mass spectrometry"                  ,
    "Analytical Protocol" , "LC-MS/MS"           , "Liquid chromatography tandem mass spectrometry"           ,
    "Analytical Protocol" , "GC-MS/MS"           , "Gas chromatography tandem mass spectrometry"              ,
    "Analytical Protocol" , "UPLC"               , "Ultra performance liquid chromatography"                  ,
    "Analytical Protocol" , "ICP-MS"             , "Inductively coupled plasma mass spectrometry"             ,
    "Analytical Protocol" , "ICP-OES"            , "Inductively coupled plasma optical emission spectroscopy" ,
    "Analytical Protocol" , "AAS"                , "Atomic absorption spectroscopy"                           ,
    "Analytical Protocol" , "XRF"                , "X-ray fluorescence spectroscopy"                          ,
    "Analytical Protocol" , "Ion chromatography" , "Ion chromatography"                                       ,
    "Analytical Protocol" , "Spectrophotometry"  , "Spectrophotometry"                                        ,
    "Analytical Protocol" , "Fluorescence"       , "Fluorescence spectroscopy"                                ,
    "Analytical Protocol" , "Other"              , "Other"
  )
}

#' All protocols controlled vocabulary
#'
#' Returns combined protocol options from all protocol categories.
#'
#' @details
#' Combines all protocol vocabularies (sampling, fractionation, extraction, and analytical)
#' into a single comprehensive tibble. Contains columns:
#'
#' Protocol_Type: Category of protocol (Sampling, Fractionation, Extraction, or Analytical Protocol)
#'
#' Short_Name: Abbreviated protocol name
#'
#' Long_Name: Full descriptive protocol name
#'
#' This function aggregates results from sampling_protocols_vocabulary(),
#' fractionation_protocols_vocabulary(), extraction_protocols_vocabulary(), and
#' analytical_protocols_vocabulary().
#'
#' @return A tibble with Protocol_Type, Short_Name, and Long_Name columns for all protocols
#' @family vocabulary
#' @family method
#' @importFrom dplyr bind_rows
#' @export
protocol_options_vocabulary <- function() {
  bind_rows(
    sampling_protocols_vocabulary(),
    fractionation_protocols_vocabulary(),
    extraction_protocols_vocabulary(),
    analytical_protocols_vocabulary()
  )
}

#' Protocol categories controlled vocabulary
#'
#' Returns controlled vocabulary options for protocol type classifications.
#'
#' @details
#' Provides the four main protocol category classifications used in the methods table.
#' Options include:
#'
#' Sampling Protocol
#'
#' Fractionation Protocol
#'
#' Extraction Protocol
#'
#' Analytical Protocol
#'
#' @return A character vector of protocol category options
#' @family vocabulary
#' @family method
#' @export
protocol_categories_vocabulary <- function() {
  c(
    "Sampling Protocol",
    "Fractionation Protocol",
    "Extraction Protocol",
    "Analytical Protocol"
  )
}


#' Parameter units and conversion factors vocabulary
#'
#' Returns unit definitions and SI conversion factors for environmental measurements.
#'
#' @param select_column Optional column name to extract: "MEASURED_UNIT", "BASE_SI_UNIT", "CONVERSION_FACTOR", or "UNIT_COMMENTS"
#'
#' @details
#' Reads unit conversion data from unit_conversion_factors.csv containing standardised
#' units for ecotoxicological and environmental measurements. The complete dataset includes
#' columns:
#'
#' MEASURED_UNIT: Unit as recorded in measurements
#'
#' BASE_SI_UNIT: Corresponding SI base unit
#'
#' CONVERSION_FACTOR: Numeric factor to convert to SI units
#'
#' UNIT_COMMENTS: Additional notes about unit usage or conversion
#'
#' Data source: extdata/unit_conversion_factors.csv
#'
#' @return A dataframe (if select_column is NULL) or a character vector (if column specified)
#' @family vocabulary
#' @family measurement
#' @importFrom readr read_csv
#' @export
parameter_unit_vocabulary <- function(select_column = NULL) {
  units <- read_csv(
    file = system.file(
      "extdata",
      "unit_conversion_factors.csv",
      package = "eDataDRF",
      mustWork = TRUE
    ),
    col_names = TRUE,
    show_col_types = FALSE
  )
  if (is.null(select_column)) {
    return(units)
  }
  stopifnot(select_column %in% names(units))
  return(units[[select_column]])
}


#' Measurement flags controlled vocabulary
#'
#' Returns controlled vocabulary options for measurement quality flags.
#'
#' @details
#' Provides standardised flags for indicating measurements below detection or quantification
#' limits. Options include:
#'
#' "" (empty string for measurements above limits)
#'
#' < LOQ (below limit of quantification)
#'
#' < LOD (below limit of detection)
#'
#' @return A character vector of measurement flag options
#' @family vocabulary
#' @family measurement
#' @export
measured_flags_vocabulary <- function() {
  c("", "< LOQ", "< LOD")
}


#' CREED assessment scores controlled vocabulary
#'
#' Returns standardised scoring options for CREED data quality assessment.
#'
#' @details
#' Provides the four-level scoring system used in CREED (Criteria for Reporting and
#' Evaluating Ecotoxicity Data) assessments. Options include:
#'
#' Not Met: Score value 4
#'
#' Fully Met: Score value 1
#'
#' Partly Met: Score value 2
#'
#' Not Reported: Score value 3
#'
#' Not Relevant: Score value 1
#'
#' @return Named character vector with CREED scoring choices and their numeric values
#' @family vocabulary
#' @family CREED
#' @export
CREED_choices_vocabulary <- function() {
  c(
    "Not Met" = 4,
    "Fully Met" = 1,
    "Partly Met" = 2,
    "Not Reported" = 3,
    "Not Relevant" = 1
  )
}
