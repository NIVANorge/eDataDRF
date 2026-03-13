#' Abbreviate string to first n words with case formatting
#'
#' Takes a string, extracts the first n words (removing special characters),
#' and formats them according to the specified case style.
#'
#' @param string Character. The input string to abbreviate.
#' @param n_words Integer. Number of words to include in the abbreviation.
#' @param case Character. Case style for the output. One of:
#'   \itemize{
#'     \item "lower" - all lowercase, no separator (e.g., "dogsandcats")
#'     \item "upper" - all uppercase, no separator (e.g., "DOGSANDCATS")
#'     \item "sentence" - sentence case, no separator (e.g., "Dogsandcats")
#'     \item "snake" - lowercase with underscores (e.g., "dogs_and_cats")
#'     \item "title" - title case, no separator (e.g., "DogsAndCats")
#'     \item "screamingsnake" - uppercase with underscores (e.g., "DOGS_AND_CATS")
#'     \item "camel" - camel case (e.g., "dogsAndCats")
#'   }
#'
#' @return Character. The abbreviated and formatted string.
#'
#' @importFrom stringr str_to_title str_split str_to_sentence str_to_snake str_to_camel
#' @importFrom utils head
#'
#' @examples
#' abbreviate_string("Total Phosphorus Concentration", n_words = 2L, "snake")
#' abbreviate_string("dogs and cats", n_words = 3L, "title")
#' abbreviate_string("Water Quality Index", n_words = 3L, "camel")
#'
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

#' Generate a semi-unique string ID for a protocol based on its type,
#' name, the campaign name, and a sequence number
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
#' @return Character vector of protocol IDs with format:
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
#' The function handles edge cases gracefully:
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

#' Generate Reference ID
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
#' @return Character string with format `YearLastnameTitleWords`,
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

#' Generate Sample ID with Components ----
#' @param site_code Site code (vectorised)
#' @param parameter_name Parameter name (vectorised)
#' @param environ_compartment Environmental compartment (vectorised)
#' @param environ_compartment_sub Environmental sub-compartment (vectorised)
#' @param date Sampling date (vectorised)
#' @param subsample subsample
#' @importFrom glue glue
#' @importFrom stringr str_to_title str_remove_all
#' @import eDataDRF
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
  date_abbrev <- gsub("-", "-", date)

  base_id <- glue("{site_code}-{param_abbrev}-{comp_abbrev}-{date_abbrev}")

  # Vectorised replicate
  # Subsamples will generally be text, so let's abbreviate them a bit

  subsample_suffix <- sapply(
    subsample,
    function(x) abbreviate_string(string = x, n_words = 3, case = "title")
  )
  glue("{base_id}-R-{subsample_suffix}")
}
