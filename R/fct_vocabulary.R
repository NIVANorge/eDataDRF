#' Controlled vocabulary for the SITE_GEOGRAPHIC_FEATURE column, Sites table
#'
#' Returns controlled vocabulary options for site geographic features.
#'
#' @return A character vector of geographic feature options
#' @family site
#' @examples
#' head(geographic_features_vocabulary(), 5)
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

#' Controlled vocabulary for the SITE_GEOGRAPHIC_FEATURE_SUB column, Sites table
#'
#' Returns controlled vocabulary options for geographic feature subcategories.
#'
#' @return A character vector of geographic feature subcategory options
#' @family site
#' @examples
#' geographic_features_sub_vocabulary()
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

#' Controlled vocabulary for the SITE_COORDINATE_SYSTEM column, Sites table
#'
#' Returns controlled vocabulary options for spatial coordinate reference systems.
#'
#' @details
#' Sourced from the EPSG Dataset via the \pkg{crsuggest} package.
#'
#' More CRS will be added as needed. In the long term, vocabulary may be replaced
#' entirely for better standardisation with EPSG and/or PROJ4String.
#'
#' CRS data sourced from \pkg{crsuggest} (Walker 2022).
#' Using the EPSG Dataset v10.019, a product of the International Association of
#' Oil & Gas Producers. Please view the terms of use at
#' \url{https://epsg.org/terms-of-use.html}.
#'
#' @param common_only Return only the most common CRS options (default TRUE)
#'
#' @return A character vector of coordinate system options
#' @family site
#' @import crsuggest
#' @importFrom dplyr filter arrange pull
#' @examples
#' head(coordinate_systems_vocabulary(), 5)
#' @export
coordinate_systems_vocabulary <- function(common_only = TRUE) {
  common_crs <- c(
    "WGS 84" = 4326,
    "ETRS89" = 4258,
    "UTM 32" = 32632,
    "UTM 33" = 32633,
    "UTM 34" = 32634,
    "UTM 35" = 32635
  )

  crs_names <- if (common_only) {
    crsuggest::crs_sf |>
      filter(as.integer(crs_code) %in% common_crs) |>
      arrange(match(as.integer(crs_code), common_crs)) |>
      pull(crs_name)
  } else {
    crsuggest::crs_sf |>
      arrange(match(as.integer(crs_code), common_crs)) |>
      pull(crs_name)
  }

  c("Not relevant", "Not reported", "Other", "WGS 84", crs_names)
}

#' Controlled vocabulary for the COUNTRY_ISO column, Sites table
#'
#' Returns controlled vocabulary options for country names based on ISO 3166-1 standard.
#'
#' @details
#' Provides country names from the \link[ISOcodes]{ISO_3166_1} standard, with additional
#' options for data quality flags.
#'
#' @return A character vector of country options
#' @family site
#' @import ISOcodes
#' @examples
#' head(countries_vocabulary(), 5)
#' @export
countries_vocabulary <- function() {
  c(
    "Not relevant",
    "Not reported",
    ISOcodes::ISO_3166_1$Name
  )
}

#' Controlled vocabulary for the OCEAN_IHO column, Sites table
#'
#' Returns controlled vocabulary options for IHO ocean regions.
#'
#' @details
#' Provides ocean and sea names from the International Hydrographic Organisation (IHO)
#' regions dataset, regions dataset (\url{https://www.marineregions.org/downloads.php}, World Seas IHO v3).
#'
#' @return A character vector of ocean name options
#' @family site
#' @importFrom dplyr pull
#' @examples
#' head(ocean_vocabulary(), 5)
#' @export
ocean_vocabulary <- function() {
  IHO_oceans <- c(
    "Torres Strait",
    "Tasman Sea",
    "Solomon Sea",
    "Ross Sea",
    "Coral Sea",
    "Bismarck Sea",
    "Bellingshausen Sea",
    "Bass Strait",
    "Amundsen Sea",
    "Timor Sea",
    "Sunda Strait",
    "Sumba Strait",
    "Sulu Sea",
    "Sulawesi Sea",
    "South China Sea",
    "Singapore Strait",
    "Seram Sea",
    "Sawu Sea",
    "Natuna Sea",
    "Mindanao Sea",
    "Maluku Sea",
    "Makasar Strait",
    "Joseph Bonaparte Gulf",
    "Jawa Sea",
    "Halmahera Sea",
    "Gulf of Tonkin",
    "Gulf of Tomini",
    "Gulf of Thailand",
    "Gulf of Carpentaria",
    "Gulf of Bone",
    "Gulf of Berau",
    "Flores Sea",
    "Banda Sea",
    "Bali Sea",
    "Aru Sea",
    "Arafura Sea",
    "South Pacific Ocean",
    "Yellow Sea",
    "Taiwan Strait",
    "Seto Naikai",
    "Sea of Okhotsk",
    "Philippine Sea",
    "Liaodong Gulf",
    "Japan Sea",
    "Gulf of Tartary",
    "Gulf of Panama",
    "Gulf of California",
    "Gulf of Alaska",
    "East China Sea",
    "Coastal waters of SE Alaska",
    "Bo Sea",
    "Bering Sea",
    "Anadyrskiy Gulf",
    "North Pacific Ocean",
    "Pacific Ocean",
    "Weddell Sea",
    "Scotia Sea",
    "Rio de la Plata",
    "Lazarev Sea",
    "Drake Passage",
    "South Atlantic Ocean",
    "Skagerrak",
    "Scotland Sea",
    "North Sea",
    "Labrador Sea",
    "Irish Sea",
    "Gulf of St. Lawrence",
    "Gulf of Mexico",
    "Gulf of Guinea",
    "Greenland Sea",
    "English Channel",
    "Celtic Sea",
    "Caribbean Sea",
    "Canarias Sea",
    "Bristol Channel",
    "Bay of Fundy",
    "Bay of Biscay",
    "North Atlantic Ocean",
    "Atlantic Ocean",
    "Tirreno Sea",
    "Strait of Sicilia",
    "Strait of Gibraltar",
    "Sea of Marmara",
    "Sea of Azov",
    "Ligure Sea",
    "Ionian Sea",
    "Black Sea",
    "Balear Sea",
    "Alboran Sea",
    "Aegean Sea",
    "Adriatic Sea",
    "Western Basin",
    "Eastern Basin",
    "Mediterranean Sea",
    "Mediterranean Region",
    "Riiser-Larsen Sea",
    "Red Sea",
    "Prydz Bay",
    "Persian Gulf",
    "Palk Bay, Palk Strait",
    "Mozambique Channel",
    "Malacca Strait",
    "Lakshadweep Sea",
    "Gulf of Suez",
    "Gulf of Oman",
    "Gulf of Mannar",
    "Gulf of Aqaba",
    "Gulf of Aden",
    "Great Australian Bight",
    "Cosmonaut Sea",
    "Burma Sea, Andaman Sea",
    "Bay of Bengal",
    "Arabian Sea",
    "Indian Ocean",
    "The Sound",
    "The Little Belt",
    "The Great Belt",
    "Kattegat",
    "Gulf of Riga",
    "Gulf of Finland",
    "Gulf of Bothnia",
    "Baltic Sea",
    "White Sea",
    "Norwegian Sea",
    "Northwestern Passages",
    "North Greenland Sea",
    "Lincoln Sea",
    "Laptev Sea",
    "Kara Sea",
    "Iceland Sea",
    "Hudson Strait",
    "Hudson Bay",
    "East Siberian Sea",
    "Davis Strait",
    "Chukchi Sea",
    "Beaufort Sea",
    "Barents Sea",
    "Baffin Bay",
    "Arctic Ocean"
  )

  c(
    "Not relevant",
    "Not reported",
    "Other",
    IHO_oceans
  )
}

#' Ocean controlled vocabulary (wrapper for ocean_vocabulary())
#'
#' Returns controlled vocabulary options for IHO ocean regions.
#'
#' @details
#' Wrapper for \code{ocean_vocabulary()} used to maintain compatibility.
#'
#' @return A character vector of ocean name options
#' @family site
#' @importFrom dplyr pull
#' @examples
#' head(areas_vocabulary(), 5)
#' @export
areas_vocabulary <- function() {
  ocean_vocabulary()
}

#' Controlled vocabulary for the ALTITUDE_UNIT column, Sites table
#'
#' Returns controlled vocabulary options for altitude measurement units.
#'
#' @return A character vector of altitude unit options
#' @family site
#' @examples
#' altitude_units_vocabulary()
#' @export
altitude_units_vocabulary <- function() {
  c("km", "m", "cm", "mm")
}

#' Data for PARAMETER_NAME, PARAMETER_TYPE, etc. in the Parameters table
#'
#' Returns comprehensive parameter data combining quality and chemical parameters.
#'
#' @details
#' Combines quality parameters with chemical parameters from the
#' \href{http://classyfire.wishartlab.com}{ClassyFire} chemical taxonomy
#' (Djoumbou Feunang et al. 2016, \doi{10.1186/s13321-016-0174-y}, reused non-commercially).
#' Quality parameters are read from quality_parameters.parquet and chemical
#' parameters from ClassyFire_Taxonomy_2025_02.parquet. The resulting dataset includes
#' columns for parameter classification, chemical identifiers (InChIKey, PubChem CID,
#' CAS RN), and measurement types.
#'
#' Note: Quality parameters have not yet been comprehensively validated as we are not
#' aware of any taxonomy to validate them against.
#'
#' Data sources:
#'
#' extdata/quality_parameters.parquet
#'
#' extdata/ClassyFire_Taxonomy_2025_02.parquet
#'
#' @return A data frame combining quality and chemical parameter options
#' @family parameter
#' @importFrom dplyr mutate arrange bind_rows case_when
#' @importFrom arrow read_parquet
#' @examples
#' head(parameters_vocabulary(), 5)
#' @export
parameters_vocabulary <- function() {
  # Read quality_parameters.parquet
  quality_params <- read_parquet(
    file = system.file(
      "extdata",
      "quality_parameters.parquet",
      package = "eDataDRF",
      mustWork = TRUE
    )
  ) |>
    mutate(ENTERED_BY = "saw@niva.no")

  # Read and prepare chemical_parameters
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
  bind_rows(quality_params, chemical_parameters)
}

#' Controlled vocabulary for the PARAMETER_TYPES column, Parameters table
#'
#' Returns controlled vocabulary options for broad parameter classifications.
#'
#' @return A character vector of parameter type options
#' @family parameter
#' @examples
#' parameter_types_vocabulary()
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

#' Controlled vocabulary for the PARAMETER_TYPES_SUB column, Parameters table
#'
#' Returns controlled vocabulary options for parameter type subcategories.
#'
#' @details
#' Dynamically generated from unique PARAMETER_TYPE_SUB values in
#' \code{parameters_vocabulary()}, with "Mixture" appended and standard data quality
#' flags prepended.
#'
#' @return A character vector of parameter type subcategory options
#' @family parameter
#' @importFrom dplyr select distinct arrange pull
#' @importFrom purrr prepend
#' @examples
#' head(parameter_types_sub_vocabulary(), 5)
#' @export
parameter_types_sub_vocabulary <- function() {
  parameters <- parameters_vocabulary()

  # Rather messy way to include non-data values at the start of the vector
  parameters_sorted <- parameters |>
    select(PARAMETER_TYPE_SUB) |>
    distinct() |>
    pull(PARAMETER_TYPE_SUB) |>
    setdiff("Other") |>
    append(c("Mixture")) |>
    sort()

  return(c("Not relevant", "Not reported", "Other", parameters_sorted))
}

#' Controlled vocabulary for the MEASURED_TYPE column, Parameters table
#'
#' Returns controlled vocabulary options for types of measurements.
#'
#' @return A character vector of measured type options
#' @family parameter
#' @family measurement
#' @examples
#' head(measured_types_vocabulary(), 5)
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

#' Controlled vocabulary for the ENVIRON_COMPARTMENT and ENVIRON_COMPARTMENT_SUB columns, Compartments table
#'
#' Returns controlled vocabulary mapping for environmental sub-compartments organized by main compartment.
#'
#' @details
#' Provides a hierarchical structure of environmental sub-compartments grouped by their
#' main compartment type. The list includes:
#'
#' Provides a hierarchical structure of environmental sub-compartments grouped by their
#' main compartment type (Aquatic, Atmospheric, Terrestrial, Biota).
#'
#' @return A named list of character vectors with sub-compartment options for each main compartment
#' @family compartment
#' @examples
#' head(environ_compartments_sub_vocabulary(), 5)
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
    ),
    "Not relevant" = c(),
    "Not reported" = c(),
    "Other" = c()
  )
}

#' Controlled vocabulary for the ENVIRON_COMPARTMENT column, Compartments table
#'
#' Returns controlled vocabulary options for broad environmental compartments.
#' Calls \code{names(environ_compartments_sub_vocabulary())} to return the first
#' level of the list.
#'
#' @return A character vector of environmental compartment options
#' @family compartment
#' @examples
#' environ_compartments_vocabulary()
#' @export
environ_compartments_vocabulary <- function() {
  names(environ_compartments_sub_vocabulary())
}

#' Controlled vocabulary for the MEASURED_CATEGORY column, Compartments table
#'
#' Returns controlled vocabulary options for measurement context categories.
#'
#' @details
#' Provides standardised categories indicating where measurements were taken relative
#' to organisms. Options include:
#'
#' @return A character vector of measured category options
#' @family compartment
#' @family measurement
#' @examples
#' measured_categories_vocabulary()
#' @export
measured_categories_vocabulary <- function() {
  c(
    "External" = "External Media",
    "Internal" = "Internal to Organism",
    "Surface" = "Surface of Organism"
  )
}

#' Controlled vocabulary for the SPECIES_NAME column, Biota table
#'
#' Returns species information from EPA ECOTOX database.
#'
#' @details
#' Provides comprehensive species data including common names, scientific names, kingdom,
#' and species group classifications. Data is read from ecotox_2025_06_12_species.parquet
#' and species group classifications. Data is read from ecotox_2025_06_12_species.parquet.
#' Additional entries for "Other" and "Ecosystem" are included. Data retrieved from
#' \url{https://cfpub.epa.gov/ecotox/}, 2025.06.12.
#'
#' Data source: extdata/ecotox_2025_06_12_species.parquet
#'
#' @return A data frame of species information
#' @family biota
#' @importFrom dplyr mutate bind_rows
#' @importFrom tibble tibble
#' @importFrom arrow read_parquet
#' @examples
#' head(species_names_vocabulary(), 5)
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

#' Controlled vocabulary for the SAMPLE_TISSUE column, Biota table
#'
#' Returns controlled vocabulary options for biological tissue types.
#'
#' @details
#' In future, this will be standardised with the BRENDA and/or Uberon tissue ontologies.
#'
#' @return A character vector of tissue type options
#' @family biota
#' @examples
#' head(tissue_types_vocabulary(), 5)
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
    "Digestive Gland",
    "Mantle",
    "Blood",
    "Egg",
    "Larva",
    "Leaf",
    "Root",
    "Stem",
    "Fruit",
    "Seed",
    "Brown meat",
    "Shoot tips",
    "Disc skeleton",
    "Echinoid corona",
    "Bile",
    "Plant tissue",
    "Shoot tip",
    "Total soft tissues minus gonads",
    "Other"
  )
}

#' Controlled vocabulary for the SAMPLE_SPECIES_LIFESTAGE column, Biota table
#'
#' Returns controlled vocabulary options for organism life stages.
#'
#' @return A character vector of life stage options
#' @family biota
#' @examples
#' head(lifestage_vocabulary(), 5)
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

#' Controlled vocabulary for the SAMPLE_SPECIES_GENDER column, Biota table
#'
#' Returns controlled vocabulary options for organism sex or gender.
#'
#' @return A character vector of gender options
#' @family biota
#' @examples
#' gender_vocabulary()
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

#' Controlled vocabulary for the SPECIES_GROUP column, Biota table
#'
#' Returns controlled vocabulary options for broad taxonomic groups from the EPA ECOTOX database.
#'
#' @return A character vector of species group options
#' @family biota
#' @examples
#' head(species_groups_vocabulary(), 5)
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

#' Controlled vocabulary for the UNCERTAINTY_TYPE column, Measurements table
#'
#' Returns controlled vocabulary options for statistical uncertainty and variability measures.
#'
#' @return A character vector of uncertainty type options
#' @family measurement
#' @examples
#' head(uncertainty_types_vocabulary(), 5)
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

#' Controlled vocabulary for the REFERENCE_TYPE column, References table
#'
#' Returns the set of valid values for the `REFERENCE_TYPE` field in the
#' Reference table.
#'
#' @return A character vector of permitted reference types.
#' @examples
#' reference_type_vocabulary()
#' @export
reference_type_vocabulary <- function() {
  c("Journal Article", "Book", "Report", "Dataset/Database")
}

#' Controlled vocabulary for the DATA_SOURCE column, References table
#'
#' Returns the set of valid values for the `DATA_SOURCE` field in the
#' Reference table.
#'
#' Primary: Data object reports first-party data
#'
#' Secondary/Review: Data object reports third-party data
#'
#' Other: Data sourcing otherwise not relevant
#'
#' @return A character vector of permitted data source types.
#' @examples
#' data_source_vocabulary()
#' @export
data_source_vocabulary <- function() {
  c("Primary", "Secondary/Review", "Other")
}


# Protocol Vocabulary Functions ----
# Each protocol type creates its own tribble, then combined with bind_rows

#' Controlled vocabulary for PROTOCOL_TYPE and PROTOCOL_NAME columns (sampling), Methods table
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

#' Controlled vocabulary for PROTOCOL_TYPE and PROTOCOL_NAME columns (fractionation), Methods table
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

#' Controlled vocabulary for PROTOCOL_TYPE and PROTOCOL_NAME columns (extraction), Methods table
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

#' Controlled vocabulary for PROTOCOL_TYPE and PROTOCOL_NAME columns (analytical), Methods table
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

#' Controlled vocabulary for PROTOCOL_TYPE and PROTOCOL_NAME columns (all), Methods table
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

#' Controlled vocabulary for PROTOCOL_CATEGORY column, Methods table
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


#' Controlled vocabulary for MEASURED_UNIT, LOQ_UNIT, and LOD_UNIT, with conversion factors and base units
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


#' Controlled vocabulary for MEASURED_FLAG, Measurements table
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


#' Controlled vocabulary for CREED scores, CREED table
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
