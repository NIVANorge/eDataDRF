# -----------------------
# ---- TABLE FORMATS ----
# -----------------------

#' Initialise an 8x0 tibble for storing organisational and date metadata
#'
#' Creates an empty tibble with the standardised column structure for campaign data.
#'
#' @details
#' Campaigns represent sampling projects or studies with metadata about timing,
#' organisation, data quality evaluation, and confidentiality. The tibble includes
#' the following columns:
#'
#' CAMPAIGN_NAME_SHORT: Short identifier for the campaign (mandatory)
#'
#' CAMPAIGN_NAME: Full descriptive name of the campaign (mandatory)
#'
#' CAMPAIGN_START_DATE: Date when campaign sampling began (mandatory)
#'
#' CAMPAIGN_END_DATE: Date when campaign sampling ended (optional)
#'
#' ORGANISATION: Organisation responsible for the campaign (mandatory)
#'
#' ENTERED_BY: Person or entity who entered the data (mandatory)
#'
#' ENTERED_DATE: Date when the data was entered into the system (mandatory)
#'
#' CAMPAIGN_COMMENT: Additional notes or comments about the campaign (optional)
#'
#' See `vignette("campaign_data")` for more information.
#'
#' @return A tibble with 0 rows and standardised campaign columns
#' @family initialise_tibble
#' @family campaign
#' @importFrom tibble tibble
#' @examples
#' initialise_campaign_tibble()
#' @export
initialise_campaign_tibble <- function() {
  tibble(
    CAMPAIGN_NAME_SHORT = character(),
    CAMPAIGN_NAME = character(),
    CAMPAIGN_START_DATE = as.Date(character()),
    CAMPAIGN_END_DATE = as.Date(character()),
    ORGANISATION = character(),
    ENTERED_BY = character(),
    ENTERED_DATE = as.Date(character()),
    CAMPAIGN_COMMENT = character()
  )
}

#' Initialise an 14x0 tibble for storing biota metadata
#'
#' @details
#' Biota data extends sample information with species-specific details including
#' taxonomic classification, tissue type, life stage, and gender information. The
#' tibble includes the following columns:
#'
#' SAMPLE_ID: Unique identifier linking to the samples table (mandatory, foreign key for measurements)
#'
#' SITE_CODE: Code identifying the sampling location (mandatory, foreign key for sites)
#'
#' PARAMETER_NAME: Name of the measured parameter or stressor (mandatory, foreign key for parameters)
#'
#' ENVIRON_COMPARTMENT: Broad environmental compartment category (mandatory, inherited from samples)
#'
#' ENVIRON_COMPARTMENT_SUB: Specific sub-category of the environmental compartment (mandatory, inherited from samples)
#'
#' MEASURED_CATEGORY: Category indicating measurement context (mandatory, inherited from samples)
#'
#' SAMPLING_DATE: Date when the biological sample was collected (mandatory, inherited from samples)
#'
#' SUBSAMPLE: Identifier for subsample or replicate (mandatory, inherited from samples)
#'
#' SPECIES_GROUP: Taxonomic group classification, e.g., Fish, Molluscs, Plants (mandatory)
#'
#' SAMPLE_SPECIES: Scientific binomial name of the sampled species (mandatory)
#'
#' SAMPLE_TISSUE: Type of biological tissue sampled (mandatory)
#'
#' SAMPLE_SPECIES_LIFESTAGE: Life stage of the organism at sampling (mandatory)
#'
#' SAMPLE_SPECIES_GENDER: Gender or sex of the sampled organism (mandatory)
#'
#' BIOTA_COMMENT: Additional notes or comments about the biological sample (optional)
#'
#' See `vignette("biota_data")` for more information.
#'
#' @return A tibble with 0 rows and standardised biota columns
#' @family initialise_tibble
#' @family biota
#' @importFrom tibble tibble
#' @examples
#' initialise_biota_tibble()
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


#' Initialise an 3x0 tibble for storing metadata on sampled environmental compartment
#'
#' Creates an empty tibble with the standardised column structure for environmental compartment data.
#'
#' @details
#' Compartments define the environmental matrix and measurement context for sampling
#' activities. The compartments table is not a direct output of the eData format but is used to
#' construct the samples table.
#' The tibble includes the following columns:
#'
#' ENVIRON_COMPARTMENT: Broad environmental compartment (Aquatic, Atmospheric, Terrestrial, Biota)
#'
#' ENVIRON_COMPARTMENT_SUB: Specific sub-category within the compartment
#'
#' MEASURED_CATEGORY: Measurement context (External Media, Internal to Organism, Surface of Organism)
#'
#' See `vignette("compartments_data")` for more information.
#'
#' @return A tibble with 0 rows and standardised compartment columns
#' @family initialise_tibble
#' @family compartment
#' @importFrom tibble tibble
#' @examples
#' initialise_compartments_tibble()
#' @export
initialise_compartments_tibble <- function() {
  tibble(
    ENVIRON_COMPARTMENT = character(),
    ENVIRON_COMPARTMENT_SUB = character(),
    MEASURED_CATEGORY = character()
  )
}

#' Initialise an 5x0 tibble for storing metadata on scientific/sampling methods and protocols
#'
#' Creates an empty tibble with the standardised column structure for methods.
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
#' See `vignette("methods_data")` for more information.
#'
#' @return A tibble with 0 rows and standardised methods columns
#' @family initialise_tibble
#' @family method
#' @importFrom tibble tibble
#' @examples
#' initialise_methods_tibble()
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

#' Initialise an 10x0 tibble for storing metadata on sampled parameters: stressors, quality, etc.
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
#' See `vignette("parameters_data")` for more information.
#'
#' @return A tibble with 0 rows and standardised parameter columns
#' @family initialise_tibble
#' @family parameter
#' @importFrom tibble tibble
#' @examples
#' initialise_parameters_tibble()
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

#' Initialise an 18x0 tibble for storing metadata on scientific literature
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
#' DATA_SOURCE: Whether reference is source of data (Primary, Secondary/Review, Other)
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
#' See `vignette("references_data")` for more information.
#'
#' @return A tibble with 0 rows and standardised reference columns
#' @family initialise_tibble
#' @family reference
#' @importFrom tibble tibble
#' @examples
#' initialise_references_tibble()
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

#' Initialise an 11x0 tibble for storing combinations of sites, dates, parameters, and compartments sampled
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
#' ENVIRON_COMPARTMENT: Environmental compartment defined as one of the earth's spheres (aquatic, atmospheric, etc.)
#'
#' ENVIRON_COMPARTMENT_SUB: Sub-divisions of environmental compartments into water body types, soil profile, etc.
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
#' See `vignette("samples_data")` for more information.
#'
#' @return A tibble with 0 rows and standardised sample columns
#' @family initialise_tibble
#' @family sample
#' @importFrom tibble tibble
#' @examples
#' initialise_samples_tibble()
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

#' Initialise an 13x0 tibble for storing geographical metadata
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
#' See `vignette("sites_data")` for more information.
#'
#' @return A tibble with 0 rows and standardised site columns
#' @family initialise_tibble
#' @family site
#' @importFrom tibble tibble
#' @examples
#' initialise_sites_tibble()
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

#' Initialise an 26x0 tibble for storing measurement data
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
#' See `vignette("measurements_data")` for more information.
#'
#' @return A tibble with 0 rows and standardised measurement columns
#' @family initialise_tibble
#' @family measurement
#' @importFrom tibble tibble
#' @examples
#' initialise_measurements_tibble()
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

#' Initialise an 5x0 tibble for storing a data source's overall CREED score
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
#' See `vignette("CREED_scores_data")` for more information.
#'
#' @return A tibble with 0 rows and standardised CREED columns
#' @family initialise_tibble
#' @family CREED
#' @importFrom tibble tibble
#' @examples
#' initialise_CREED_scores_tibble()
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

#' Initialise an 6x0 tibble for storing CREED assessment data
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
#' See `vignette("CREED_data")` for more information.
#'
#' @return A tibble with 0 rows and standardised CREED criterion columns
#' @family initialise_tibble
#' @family CREED
#' @importFrom tibble tibble
#' @examples
#' initialise_CREED_data_tibble()
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
