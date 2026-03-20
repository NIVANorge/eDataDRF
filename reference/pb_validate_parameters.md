# Run pointblank validation on a Parameters table

Applies pointblank validation rules to check data quality and schema
compliance for an eData Parameters table. Checks that core identifier
fields are non-null, parameter names are within the expected controlled
vocabulary, and entry metadata is present.

## Usage

``` r
pb_validate_parameters(data, actions = action_levels(), agent = TRUE)
```

## Arguments

- data:

  Data frame containing Parameters table data to validate

- actions:

  Action levels for pointblank agent (only used when `agent = TRUE`)

- agent:

  Logical. If `TRUE` (default), returns a pointblank agent object. If
  `FALSE`, returns the validated data with validation failures removed.

## Value

If `agent = TRUE`, a pointblank agent object containing validation
results. If `agent = FALSE`, the input data with validation failures
removed.

## Details

Validation thresholds are configured using
[`pointblank::action_levels()`](https://rstudio.github.io/pointblank/reference/action_levels.html).

## See also

[`pb_validate_edata_table()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_edata_table.md)
for the underlying validation framework,
[`pb_validate_all_edata_tables()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_all_edata_tables.md)
to validate all tables at once,
[`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md)
for an example Parameters table.

Other validation:
[`pb_validate_CREED_data_relevance()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_CREED_data_relevance.md),
[`pb_validate_CREED_data_reliability()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_CREED_data_reliability.md),
[`pb_validate_CREED_scores()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_creed_scores.md),
[`pb_validate_all_edata_tables()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_all_edata_tables.md),
[`pb_validate_biota()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_biota.md),
[`pb_validate_campaign()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_campaign.md),
[`pb_validate_edata_table()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_edata_table.md),
[`pb_validate_measurements()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_measurements.md),
[`pb_validate_methods()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_methods.md),
[`pb_validate_reference()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_reference.md),
[`pb_validate_samples()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_samples.md),
[`pb_validate_sites()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_sites.md)

## Examples

``` r
if (FALSE) { # \dontrun{
pb_validate_parameters(example_parameters_tibble())
} # }
```
