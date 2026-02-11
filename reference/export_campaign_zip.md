# Export Multiple Datasets as ZIP of CSV Files

Creates a ZIP archive containing CSV files for each non-empty dataset in
the provided list. Useful for bundling campaign data for download or
archival.

## Usage

``` r
export_campaign_zip(
  dataset_list,
  campaign_name = "Unknown_Campaign",
  output_path = NULL
)
```

## Arguments

- dataset_list:

  Named list of tibbles/data.frames to export. Names should match
  expected dataset names (e.g., "edata_sites", "edata_measurements").
  Empty datasets (NULL, 0 rows) are automatically filtered out.

- campaign_name:

  Character. Campaign identifier used in the ZIP filename and individual
  CSV filenames. Special characters are replaced with underscores.
  Default is "Unknown_Campaign".

- output_path:

  Character. Full path where ZIP file should be saved. If NULL
  (default), saves to current working directory with auto-generated
  name.

## Value

Character. Path to the created ZIP file (returned invisibly).

## Details

The function:

- Filters out empty or NULL datasets

- Creates timestamped filenames for reproducibility

- Writes CSVs with Excel-compatible encoding

- Cleans up temporary files automatically

- Provides progress messages during export

ZIP filename format: `{campaign_name}_{timestamp}.zip`

CSV filename format: `{campaign_name}_{dataset_name}_{timestamp}.csv`

## Examples

``` r
if (FALSE) { # \dontrun{
# Create sample datasets
my_data <- list(
  edata_sites = tibble(SITE_CODE = "S01", SITE_NAME = "Site 1"),
  edata_measurements = tibble(VALUE = c(1.2, 3.4))
)

# Export to ZIP
zip_path <- export_campaign_zip(my_data, "MyStudy2024")

# Export to specific location
export_campaign_zip(my_data, "MyStudy", "~/Downloads/export.zip")
} # }
```
