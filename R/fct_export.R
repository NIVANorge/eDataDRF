# R/utils_export.R (or wherever these functions live) ----

#' Get Dataset Display Name
#'
#' Converts internal dataset names to user-friendly display names.
#'
#' @param dataset_name Character. Internal dataset name (e.g., "edata_sites")
#'
#' @return Character. User-friendly display name (e.g., "Sites"). If the
#'   dataset name is not recognized, returns the input name unchanged.
#'
#' @examples
#' get_dataset_display_name("edata_sites")
#' get_dataset_display_name("edata_measurements")
#'
#' @export
get_dataset_display_name <- function(dataset_name) {
  display_names <- c(
    edata_sites = "Sites",
    edata_parameters = "Parameters",
    edata_compartments = "Compartments",
    edata_reference = "Reference",
    edata_campaign = "Campaign",
    edata_methods = "Methods",
    edata_samples = "Samples",
    edata_biota = "Biota",
    edata_measurements = "Measurements"
  )

  display_names[[dataset_name]] %||% dataset_name
}

#' Export Multiple Datasets as ZIP of CSV Files
#'
#' Creates a ZIP archive containing CSV files for each non-empty dataset in the
#' provided list. Useful for bundling campaign data for download or archival.
#'
#' @param dataset_list Named list of tibbles/data.frames to export. Names should
#'   match expected dataset names (e.g., "edata_sites", "edata_measurements").
#'   Empty datasets (NULL, 0 rows) are automatically filtered out.
#' @param campaign_name Character. Campaign identifier used in the ZIP filename
#'   and individual CSV filenames. Special characters are replaced with underscores.
#'   Default is "Unknown_Campaign".
#' @param output_path Character. Full path where ZIP file should be saved.
#'   If NULL (default), saves to current working directory with auto-generated name.
#'
#' @return Character. Path to the created ZIP file (returned invisibly).
#'
#' @details
#' The function:
#' \itemize{
#'   \item Filters out empty or NULL datasets
#'   \item Creates timestamped filenames for reproducibility
#'   \item Writes CSVs with Excel-compatible encoding
#'   \item Cleans up temporary files automatically
#'   \item Provides progress messages during export
#' }
#'
#' ZIP filename format: `{campaign_name}_{timestamp}.zip`
#'
#' CSV filename format: `{campaign_name}_{dataset_name}_{timestamp}.csv`
#'
#' @examples
#' \dontrun{
#' # Create sample datasets
#' my_data <- list(
#'   edata_sites = tibble(SITE_CODE = "S01", SITE_NAME = "Site 1"),
#'   edata_measurements = tibble(VALUE = c(1.2, 3.4))
#' )
#'
#' # Export to ZIP
#' zip_path <- export_campaign_zip(my_data, "MyStudy2024")
#'
#' # Export to specific location
#' export_campaign_zip(my_data, "MyStudy", "~/Downloads/export.zip")
#' }
#'
#' @importFrom readr write_excel_csv
#' @importFrom glue glue
#' @importFrom zip zip
#' @export
export_campaign_zip <- function(
  dataset_list,
  campaign_name = "Unknown_Campaign",
  output_path = NULL
) {
  # Validate inputs ----
  if (!is.list(dataset_list) || length(dataset_list) == 0) {
    stop("dataset_list must be a non-empty named list")
  }

  if (is.null(names(dataset_list)) || any(names(dataset_list) == "")) {
    stop("dataset_list must have names for all elements")
  }

  # Filter to non-empty datasets ----
  non_empty_datasets <- Filter(
    function(df) {
      !is.null(df) && is.data.frame(df) && nrow(df) > 0
    },
    dataset_list
  )

  if (length(non_empty_datasets) == 0) {
    stop("No non-empty datasets to export")
  }

  message(glue("Preparing to export {length(non_empty_datasets)} datasets"))

  # Generate timestamp and clean campaign name ----
  timestamp <- format(Sys.time(), "%Y%m%d_%H%M%S")
  campaign <- gsub("[^A-Za-z0-9_]", "_", campaign_name)
  zip_filename <- glue("{campaign}_{timestamp}.zip")

  if (is.null(output_path)) {
    output_path <- file.path(getwd(), zip_filename)
  } else {
    output_path <- file.path(output_path, zip_filename)
  }

  # Create temporary directory for CSV files ----
  temp_dir <- tempfile("campaign_export_")
  dir.create(temp_dir, showWarnings = FALSE)

  # Write each dataset as CSV ----
  csv_files <- character(length(non_empty_datasets))

  for (i in seq_along(non_empty_datasets)) {
    dataset_name <- names(non_empty_datasets)[i]
    data <- non_empty_datasets[[dataset_name]]

    # Generate timestamped filename
    display_name <- get_dataset_display_name(dataset_name)
    display_name <- gsub(" ", "_", display_name)
    csv_name <- glue("{campaign}_{display_name}_{timestamp}.csv")

    csv_path <- file.path(temp_dir, csv_name)

    message(glue("  Writing {csv_name}: {nrow(data)} rows x {ncol(data)} cols"))

    # Write CSV
    write_excel_csv(data, file = csv_path, na = "")

    csv_files[i] <- csv_path
  }

  # Create ZIP file ----
  message(glue("Creating ZIP: {basename(output_path)}"))

  # Change to temp directory so ZIP contains just CSV filenames
  old_wd <- getwd()
  setwd(temp_dir)

  zip::zip(
    zipfile = output_path,
    files = basename(csv_files),
    mode = "cherry-pick"
  )

  setwd(old_wd)

  # Cleanup ----
  unlink(temp_dir, recursive = TRUE)

  message(glue(
    "Successfully exported {length(csv_files)} files to {output_path}"
  ))

  invisible(output_path)
}
