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
#' @importFrom stringr str_to_title str_split
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
    "sentence" = {
      words_lower <- tolower(selected_words)
      words_lower[1] <- paste0(
        toupper(substr(words_lower[1], 1, 1)),
        substr(words_lower[1], 2, nchar(words_lower[1]))
      )
      paste(words_lower, collapse = "")
    },
    "snake" = paste(tolower(selected_words), collapse = "_"),
    "title" = paste(str_to_title(selected_words), collapse = ""),
    "screamingsnake" = paste(toupper(selected_words), collapse = "_"),
    "camel" = {
      camel_words <- selected_words
      # Capitalise first letter of each word
      camel_words <- paste0(
        toupper(substr(camel_words, 1, 1)),
        tolower(substr(camel_words, 2, nchar(camel_words)))
      )
      # Make first word lowercase
      camel_words[1] <- tolower(camel_words[1])
      paste0(camel_words, collapse = "")
    }
  )

  return(result)
}

#' Generate Protocol ID ----
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
      # Split by whitespace, capitalize first letter of each word, rejoin
      words <- str_split(protocol_name, "\\s+")

      # Process each set of words
      processed <- vapply(
        words,
        FUN = function(word_vec) {
          # Capitalize and combine words
          capitalized <- str_c(
            str_to_upper(str_sub(word_vec, 1, 1)),
            str_to_lower(str_sub(word_vec, 2, -1))
          )
          # Join words, remove non-alphanumeric, truncate
          str_c(capitalized, collapse = "") |>
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
#' @param date Date (ACCESS_DATE or current date)
#' @param author Author string
#' @param title Title string
#' @return Character string with format DateAuthorFirstThreeWords
#' @importFrom stringr str_to_title
generate_reference_id <- function(date, author, title) {
  # Format date as YYYYMMDD
  date_part <- date

  # Extract first author's last name
  author_part <- ""
  if (!is.null(author) && nchar(trimws(author)) > 0) {
    # Split by semicolon and take first author
    first_author <- trimws(strsplit(author, ";")[[1]][1])
    # Extract last name (part before first comma)
    author_part <- trimws(strsplit(first_author, ",")[[1]][1])
    # Remove any non-alphanumeric characters and limit length
    author_part <- gsub("[^A-Za-z0-9]", "", author_part)
    author_part <- substr(author_part, 1, 10) # Limit author part length
  }

  # Extract first three words from title
  title_part <- abbreviate_string(title, 3, case = "title")
  # Combine parts
  reference_id <- paste0(date_part, author_part, title_part)

  return(reference_id)
}
