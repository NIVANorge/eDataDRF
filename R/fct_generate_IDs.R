#' Generic function to abbreviate string to first n words with case formatting
#'
#' Takes a string, extracts the first n words (removing special characters),
#' and formats them according to the specified case style.
#'
#' @param string Character. The input string to abbreviate.
#' @param n_words Integer. Number of words to include in the abbreviation.
#' @param case Character. Case style for the output. One of:
#'   - `"lower"` — all lowercase, no separator (e.g., `"dogsandcats"`)
#'   - `"upper"` — all uppercase, no separator (e.g., `"DOGSANDCATS"`)
#'   - `"sentence"` — sentence case, no separator (e.g., `"Dogsandcats"`)
#'   - `"snake"` — lowercase with underscores (e.g., `"dogs_and_cats"`)
#'   - `"title"` — title case, no separator (e.g., `"DogsAndCats"`)
#'   - `"screamingsnake"` — uppercase with underscores (e.g., `"DOGS_AND_CATS"`)
#'   - `"camel"` — camel case (e.g., `"dogsAndCats"`)
#'
#' @returns Character. The abbreviated and formatted string.
#'
#' @importFrom stringr str_to_title str_split str_to_sentence str_to_snake str_to_camel
#' @importFrom utils head
#'
#' @examples
#' abbreviate_string("Total Phosphorus Concentration", n_words = 2L, "snake")
#' abbreviate_string("dogs and cats", n_words = 3L, "title")
#' abbreviate_string("Water Quality Index", n_words = 3L, "camel")
#'
#' @family generate_id
#' @export
abbreviate_string <- function(
  string,
  n_words,
  case = c(
    "lower",
    "upper",
    "sentence",
    "snake",
    "title",
    "screamingsnake",
    "camel"
  )
) {
  case <- match.arg(case)

  stopifnot(
    is.character(as.character(string)),
    is.integer(as.integer(n_words))
  )

  n_words <- as.integer(n_words)
  string <- as.character(string)

  words <- strsplit(gsub("[^A-Za-z0-9 ]", " ", string), "\\s+")
  words <- words[[nchar(words) > 0]] # Remove empty strings

  # Take first n words
  selected_words <- head(words, n_words)

  # Apply case transformation
  result <- switch(
    case,
    "lower" = paste(tolower(selected_words), collapse = ""),
    "upper" = paste(toupper(selected_words), collapse = ""),
    "sentence" = paste(str_to_sentence(selected_words), collapse = " "),
    "snake" = paste(str_to_snake(selected_words), collapse = "_"),
    "title" = paste(str_to_title(selected_words), collapse = ""),
    "screamingsnake" = paste(
      toupper(str_to_snake(selected_words)),
      collapse = "_"
    ),
    "camel" = str_to_camel(paste(selected_words, collapse = " ")),
  )

  return(result)
}

#' Generate a semi-unique string ID for a protocol (`PROTOCOL_ID`) based on its type,
#' name, the campaign name, and a sequence number; used as a key between Methods
#' and Measurements table.
#'
#' @description
#' Generates a standardised protocol identifier based on protocol type, name,
#' sequence number, and campaign. The function is fully vectorised and can
#' handle multiple protocols simultaneously.
#'
#' @param protocol_type Character vector. The category of protocol
#'   (e.g., "Sampling Protocol", "Analytical Protocol"). Must match one of
#'   the predefined categories or will default to "X".
#' @param protocol_name Character vector. The specific name/method within
#'   the protocol category. Will be abbreviated and cleaned for ID generation.
#' @param sequence_number Numeric vector. Sequential number for protocols
#'   within the same category. Defaults to 1. Will be zero-padded to 2 digits.
#' @param campaign_name Character vector. Name of the campaign/study.
#'   Will be abbreviated to first 10 alphanumeric characters. Defaults to "".
#'
#' @returns Character vector of protocol IDs with format:
#'   `TypeCodeSequenceNumber_AbbreviatedName_CampaignAbbrev`
#'
#'   Where:
#'   - TypeCode: S (Sampling), F (Fractionation), E (Extraction),
#'     A (Analytical), X (Unknown)
#'   - SequenceNumber: Zero-padded 2-digit number
#'   - AbbreviatedName: Up to 15 alphanumeric characters (optional)
#'   - CampaignAbbrev: Up to 10 alphanumeric characters (optional)
#'
#' @details
#' Edge cases:
#' - NULL or empty values result in appropriate defaults
#' - Invalid protocol types default to "X"
#' - Names are cleaned of special characters and spaces
#' - Empty components are omitted from the final ID
#'
#' @examples
#' # Single protocol
#' generate_protocol_id("Sampling Protocol", "Water Sample", 1, "MyStudy")
#' # Returns: "S01_WaterSample_MyStudy"
#'
#' # Multiple protocols (vectorised)
#' types <- c("Sampling Protocol", "Analytical Protocol")
#' names <- c("Water Sample", "LC-MS Analysis")
#' sequences <- c(1, 2)
#' generate_protocol_id(types, names, sequences, "Study2024")
#' # Returns: c("S01_WaterSample_Study2024", "A02_LCMSAnalysis_Study2024")
#'
#' @family generate_id
#' @family method
#' @family protocol_functions
#' @importFrom stringr str_trim str_split str_to_upper str_to_lower str_sub
#'   str_remove_all str_c
#' @export
generate_protocol_id <- function(
  protocol_type,
  protocol_name,
  sequence_number = 1,
  campaign_name = ""
) {
  # Map protocol categories to single letters ----
  type_mapping <- c(
    "Sampling Protocol" = "S",
    "Fractionation Protocol" = "F",
    "Extraction Protocol" = "E",
    "Analytical Protocol" = "A"
  )

  # Get the letter code (vectorised) ----
  type_code <- type_mapping[protocol_type]
  type_code <- ifelse(is.na(type_code), "X", type_code)

  # Create abbreviated name (vectorised) ----
  # Handle NULL, NA, and empty values
  is_empty <- is.na(protocol_name) | str_trim(protocol_name) == ""

  abbreviated_name <- ifelse(
    is_empty,
    "",
    {
      # Split by whitespace, capitalise first letter of each word, rejoin
      words <- str_split(protocol_name, "\\s+")

      # Process each set of words
      processed <- vapply(
        words,
        FUN = function(word_vec) {
          # Capitalise first letter of each word, but preserve fully-uppercase
          # words (e.g. acronyms like "ICP", "MS")
          capitalised <- ifelse(
            word_vec == str_to_upper(word_vec) & nchar(word_vec) > 0,
            word_vec, # preserve all-caps words as-is
            str_c(
              str_to_upper(str_sub(word_vec, 1, 1)),
              str_to_lower(str_sub(word_vec, 2, -1))
            )
          )
          # Join words, remove non-alphanumeric, truncate
          str_c(capitalised, collapse = "") |>
            str_remove_all("[^A-Za-z0-9]") |>
            str_sub(1, 15)
        },
        FUN.VALUE = character(1)
      )

      processed
    }
  )

  # Format sequence number (vectorised) ----
  formatted_sequence <- sprintf("%02d", sequence_number)

  # Create campaign abbreviation (vectorised) ----
  is_empty_campaign <- is.na(campaign_name) | str_trim(campaign_name) == ""

  campaign_abbrev <- ifelse(
    is_empty_campaign,
    "",
    campaign_name |>
      str_remove_all("[^A-Za-z0-9]") |>
      str_sub(1, 10)
  )

  # Combine all parts (vectorised) ----
  protocol_id <- str_c(
    type_code,
    formatted_sequence,
    ifelse(abbreviated_name == "", "", str_c("_", abbreviated_name)),
    ifelse(campaign_abbrev == "", "", str_c("_", campaign_abbrev))
  )

  return(protocol_id)
}

#' Generate compact reference ID (YYYYLNameFirstThreeWords) for `REFERENCE_ID` in References table
#'
#' Creates a compact reference identifier by combining the publication year,
#' first author's last name, and the first three words of the title in
#' PascalCase.
#'
#' @param date Integer or character. Publication year (e.g. `2018`).
#' @param author Character. Semicolon-separated author list in
#'   "Last, First" format. Only the first author's last name is used
#'   (truncated to 10 alphanumeric characters).
#' @param title Character. Publication title. The first three words are
#'   extracted and converted to PascalCase.
#'
#' @returns Character string with format `YearLastnameTitleWords`,
#'   e.g. `"2018Last1AStudyOf"`.
#'
#' @examples
#' generate_reference_id(
#'   date = 2018,
#'   author = "Last1, First1; Last2, First2",
#'   title = "A study of recent developments in the field"
#' )
#' # Returns: "2018Last1AStudyOf"
#'
#' @family generate_id
#' @family reference
#' @importFrom stringr str_to_title
#' @export
generate_reference_id <- function(date, author, title) {
  # Year as-is ----
  date_part <- as.character(date)

  # First author's last name ----
  author_part <- ""
  if (!is.null(author) && nchar(trimws(author)) > 0) {
    first_author <- trimws(strsplit(author, ";")[[1]][1])
    author_part <- trimws(strsplit(first_author, ",")[[1]][1])
    author_part <- gsub("[^A-Za-z0-9]", "", author_part)
    author_part <- substr(author_part, 1, 10)
  }

  # First three title words in PascalCase ----
  title_part <- abbreviate_string(title, 3, case = "title")

  # Combine ----
  reference_id <- paste0(date_part, author_part, title_part)

  return(reference_id)
}


#' Regular expression to check [generate_protocol_id()] protocol IDs for Methods table
#'
#' Returns the regex pattern that matches protocol IDs generated by
#' [generate_protocol_id()].
#'
#' @details
#' The pattern matches the format `TypeCodeSequenceNumber_AbbreviatedName_CampaignAbbrev`
#' as produced by [generate_protocol_id()], where:
#'
#' - `TypeCode`: one of `S`, `F`, `E`, `A`, or `X`
#' - `SequenceNumber`: exactly two digits (zero-padded)
#' - `_AbbreviatedName`: optional underscore + up to 15 alphanumeric characters
#' - `_CampaignAbbrev`: optional underscore + up to 10 alphanumeric characters
#'
#' Examples of valid IDs: `S01_WaterSample_MyStudy`, `A02_LCMS_Study2024`
#'
#' @return A character string containing the regex pattern.
#'
#' @seealso [generate_protocol_id()]
#' @family generate_id
#' @family method
#' @export
protocol_id_regex <- function() {
  "^[SFEAXsfex]\\d{2}(_[A-Za-z0-9]{1,15})?(_[A-Za-z0-9]{1,10})?$"
}

#' Generate compact Sample ID (`SiteCode-ParamAbbrev-CompartmentAbbrev-Date-R-SubsampleAbbrev`)
#' for `SAMPLE_ID` in Samples table
#'
#' @description
#' Generates a standardised sample identifier by combining the site code,
#' abbreviated parameter name, abbreviated environmental sub-compartment,
#' sampling date, and subsample label. The function is fully vectorised and
#' can handle multiple samples simultaneously.
#'
#' @param site_code Character vector. The site code (e.g. `"SITE-001"`).
#' @param parameter_name Character vector. The parameter name. Will be
#'   abbreviated to the first 8 alphanumeric characters.
#' @param environ_compartment Character vector. The environmental compartment
#'   (e.g. `"Aquatic"`). Not used in the ID directly but retained as a
#'   parameter for future use and documentation purposes.
#' @param environ_compartment_sub Character vector. The environmental
#'   sub-compartment (e.g. `"Aquatic Sediment"`). Will be abbreviated to
#'   the first 12 alphanumeric characters.
#' @param date Character or Date vector. The sampling date (e.g.
#'   `"2023-03-15"`). Used as-is in the ID.
#' @param subsample Character or numeric vector. The subsample label.
#'   Will be abbreviated to the first 3 words in title case. Defaults to `1`.
#'
#' @returns Character vector of sample IDs with format:
#'   `SiteCode-ParamAbbrev-CompartmentAbbrev-Date-R-SubsampleAbbrev`
#'
#' @examples
#' # Single sample
#' generate_sample_id_with_components(
#'   site_code = "SITE-001",
#'   parameter_name = "Copper",
#'   environ_compartment = "Aquatic",
#'   environ_compartment_sub = "Aquatic Sediment",
#'   date = "2023-03-15",
#'   subsample = "1"
#' )
#'
#' # Vectorised use
#' generate_sample_id_with_components(
#'   site_code = c("SITE-001", "SITE-002"),
#'   parameter_name = c("Copper", "Lead"),
#'   environ_compartment = c("Aquatic", "Aquatic"),
#'   environ_compartment_sub = c("Aquatic Sediment", "Aquatic Sediment"),
#'   date = c("2023-03-15", "2023-04-20"),
#'   subsample = "1"
#' )
#'
#' @family generate_id
#' @family sample
#' @importFrom glue glue
#' @importFrom stringr str_to_title str_remove_all
#' @export
generate_sample_id_with_components <- function(
  site_code,
  parameter_name,
  environ_compartment,
  environ_compartment_sub,
  date,
  subsample = 1
) {
  # Create abbreviated versions for ID (vectorised)
  param_abbrev <- substr(gsub("[^A-Za-z0-9]", "", parameter_name), 1, 8)
  comp_abbrev <- substr(
    gsub("[^A-Za-z0-9]", "", environ_compartment_sub),
    1,
    12
  )
  date_abbrev <- as.character(date)

  base_id <- glue("{site_code}-{param_abbrev}-{comp_abbrev}-{date_abbrev}")

  # Vectorised replicate
  # Subsamples will generally be text, so let's abbreviate them a bit

  subsample_suffix <- sapply(
    subsample,
    function(x) abbreviate_string(string = x, n_words = 3, case = "title")
  )
  glue("{base_id}-R-{subsample_suffix}")
}

#' Regular expression to check [generate_sample_id_with_components()] protocol IDs for Samples table
#'
#' Returns the regex pattern that matches sample IDs generated by
#' [generate_sample_id_with_components()].
#'
#' @details
#' The pattern matches the format
#' `SiteCode-ParamAbbrev-CompartmentAbbrev-Date-R-SubsampleAbbrev`
#' as produced by [generate_sample_id_with_components()], where:
#'
#' - `SiteCode`: one or more alphanumeric characters or hyphens
#' - `ParamAbbrev`: up to 8 alphanumeric characters
#' - `CompartmentAbbrev`: up to 12 alphanumeric characters
#' - `Date`: ISO 8601 date (`YYYY-MM-DD`)
#' - `R`: literal separator character
#' - `SubsampleAbbrev`: one or more alphanumeric characters
#'
#' Example: `SITE-001-Copper-AquaticSedi-2023-03-15-R-1`
#'
#' @return A character string containing the regex pattern.
#'
#' @seealso [generate_sample_id_with_components()]
#' @family generate_id
#' @family sample
#' @export
sample_id_regex <- function() {
  "^[A-Za-z0-9-]+-[A-Za-z0-9]{1,8}-[A-Za-z0-9]{1,12}-\\d{4}-\\d{2}-\\d{2}-R-[A-Za-z0-9]+$"
}
