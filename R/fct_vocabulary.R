#' Geographic features controlled vocabulary
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

#' Geographic feature sub-categories controlled vocabulary
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

#' Coordinate systems controlled vocabulary
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

#' Countries controlled vocabulary
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

#' Ocean controlled vocabulary
#'
#' Returns controlled vocabulary options for IHO ocean regions.
#'
#' @details
#' Provides ocean and sea names from the International Hydrographic Organisation (IHO)
#' regions dataset, regions dataset (marineregions.org, World Seas IHO v3).
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

#' Altitude units controlled vocabulary
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

#' Sampled parameters controlled vocabulary
#'
#' Returns comprehensive parameter data combining quality and chemical parameters.
#'
#' @details
#' Combines quality parameters with chemical parameters from the
#' \href{http://classyfire.wishartlab.com}{ClassyFire} chemical taxonomy
#' (Djoumbou Feunang et al. 2016).
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

#' Parameter types controlled vocabulary
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

#' Parameter type sub-categories controlled vocabulary
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
  parameters |>
    select(PARAMETER_TYPE_SUB) |>
    distinct() |>
    pull(PARAMETER_TYPE_SUB) |>
    setdiff("Other") |>
    append(c("Mixture")) |>
    sort() |>
    prepend(c("Not relevant", "Not reported", "Other"))
}

#' Measured types controlled vocabulary
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

#' Environmental compartment sub-categories controlled vocabulary
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
    )
  )
}

#' Environmental compartments controlled vocabulary
#'
#' Returns controlled vocabulary options for broad environmental compartments.
#'
#' @return A character vector of environmental compartment options
#' @family compartment
#' @examples
#' environ_compartments_vocabulary()
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

#' Species names controlled vocabulary
#'
#' Returns species information from EPA ECOTOX database.
#'
#' @details
#' Provides comprehensive species data including common names, scientific names, kingdom,
#' and species group classifications. Data is read from ecotox_2025_06_12_species.parquet
#' and species group classifications. Data is read from ecotox_2025_06_12_species.parquet.
#' Additional entries for "Other" and "Ecosystem" are included.
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


#' Tissue types controlled vocabulary
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

#' Life stages controlled vocabulary
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

#' Gender controlled vocabulary
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

#' Species groups controlled vocabulary
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

#' Uncertainty types controlled vocabulary
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

#' Controlled vocabulary for reference types
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

#' Controlled vocabulary for data sources
#'
#' Returns the set of valid values for the `DATA_SOURCE` field in the
#' Reference table.
#'
#' @return A character vector of permitted data source types.
#' @examples
#' data_source_vocabulary()
#' @export
data_source_vocabulary <- function() {
  c("Primary", "Secondary/Review", "Other")
}
