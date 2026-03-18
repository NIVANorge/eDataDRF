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

#' Initialise biota tibble
#'
#' Creates an empty tibble with the standardised column structure for biota data.
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


#' Initialise compartments tibble
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

#' @family method
#' @importFrom tibble tribble
#' @examples
#' head(sampling_protocols_vocabulary(), 5)
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

#' @family method
#' @importFrom tibble tribble
#' @examples
#' head(fractionation_protocols_vocabulary(), 5)
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

#' @family method
#' @importFrom tibble tribble
#' @examples
#' head(extraction_protocols_vocabulary(), 5)
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

#' @family method
#' @importFrom tibble tribble
#' @examples
#' head(analytical_protocols_vocabulary(), 5)
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

#' @family method
#' @importFrom dplyr bind_rows
#' @examples
#' head(protocol_options_vocabulary(), 5)
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

#' @family method
#' @examples
#' protocol_categories_vocabulary()
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

#' @family measurement
#' @importFrom readr read_csv
#' @examples
#' head(parameter_unit_vocabulary(), 5)
#' parameter_unit_vocabulary(select_column = "MEASURED_UNIT") |> head(5)
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

#' @family measurement
#' @examples
#' measured_flag_vocabulary()
#' @export
measured_flag_vocabulary <- function() {
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

#' @family CREED
#' @examples
#' CREED_choices_vocabulary()
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
