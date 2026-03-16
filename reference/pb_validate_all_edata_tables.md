# Validate all eData tables at once

Applies pointblank validation rules to all supplied eData tables by
calling the individual table validation functions. Required tables are
always validated; optional tables are validated only when provided.

## Usage

``` r
pb_validate_all_edata_tables(
  campaign,
  reference,
  parameters,
  sites,
  samples = NULL,
  biota = NULL,
  measurements,
  methods = NULL,
  creed_scores = NULL,
  actions = action_levels(),
  agent = TRUE,
  northern_hemisphere = FALSE
)
```

## Arguments

- campaign:

  Data frame containing Campaign table data to validate

- reference:

  Data frame containing Reference table data to validate

- parameters:

  Data frame containing Parameters table data to validate

- sites:

  Data frame containing Sites table data to validate

- samples:

  Data frame containing Samples table data to validate (optional)

- biota:

  Data frame containing Biota table data to validate (optional)

- measurements:

  Data frame containing Measurements table data to validate

- methods:

  Data frame containing Methods table data to validate (optional)

- creed_scores:

  Data frame containing CREED Scores table data to validate (optional)

- actions:

  Action levels for pointblank agents (only used when agent = TRUE)

- agent:

  Logical. If TRUE (default), returns a list of pointblank agent
  objects. If FALSE, returns a list of validated data frames with
  failures removed.

- northern_hemisphere:

  Logical. If TRUE, check that site coordinates are in the northern
  hemisphere. Passed to
  [`pb_validate_sites()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_sites.md).

## Value

A named list. If agent = TRUE, each element is a pointblank agent
object. If agent = FALSE, each element is a validated data frame with
failing rows removed. The list always contains elements named
`campaign`, `reference`, `parameters`, `sites`, and `measurements`.
Optional elements (`samples`, `biota`, `methods`, `creed_scores`) are
included only when the corresponding arguments are not `NULL`.

## See also

[`pb_validate_campaign()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_campaign.md),
[`pb_validate_reference()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_reference.md),
[`pb_validate_parameters()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_parameters.md),
[`pb_validate_sites()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_sites.md),
[`pb_validate_samples()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_samples.md),
[`pb_validate_biota()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_biota.md),
[`pb_validate_measurements()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_measurements.md),
[`pb_validate_methods()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_methods.md),
[`pb_validate_creed_scores()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_creed_scores.md)
