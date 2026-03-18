# Run pointblank validation on a Measurements table

Applies pointblank validation rules to check data quality and schema
compliance for an eData Measurements table. Checks that core identifier
fields are non-null, sampling dates are within valid ranges,
environmental compartments are valid, measurement flags and values are
consistent, LOD/LOQ values and units are present and valid when
provided, protocol IDs match the expected format, MEASURED_TYPE is in
its controlled vocabulary, and reference and sample IDs are present and
correctly formatted.

## Usage

``` r
pb_validate_measurements(data, actions = action_levels(), agent = TRUE)
```

## Arguments

- data:

  Data frame containing Measurements table data to validate

- actions:

  Action levels for pointblank agent (only used when agent = TRUE)

- agent:

  Logical. If TRUE (default), returns a pointblank agent object. If
  FALSE, returns the validated data with validation failures removed.

## Value

If agent = TRUE, a pointblank agent object containing validation
results. If agent = FALSE, the input data with validation failures
removed.

## See also

[`pb_validate_edata_table()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_edata_table.md)
for the underlying validation framework,
[`pb_validate_all_edata_tables()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_all_edata_tables.md)
to validate all tables at once,
[`protocol_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_id_regex.md)
for the protocol ID format validated here,
[`sample_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/sample_id_regex.md)
for the sample ID format validated here,
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md)
for valid MEASURED_TYPE values,
[`parameter_unit_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_unit_vocabulary.md)
for valid unit values,
[`protocol_options_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_options_vocabulary.md)
for valid protocol names,
[`example_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_measurements_tibble.md)
for an example Measurements table.

Other validation:
[`pb_validate_CREED_data_relevance()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_CREED_data_relevance.md),
[`pb_validate_CREED_data_reliability()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_CREED_data_reliability.md),
[`pb_validate_CREED_scores()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_creed_scores.md),
[`pb_validate_all_edata_tables()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_all_edata_tables.md),
[`pb_validate_biota()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_biota.md),
[`pb_validate_campaign()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_campaign.md),
[`pb_validate_edata_table()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_edata_table.md),
[`pb_validate_methods()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_methods.md),
[`pb_validate_parameters()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_parameters.md),
[`pb_validate_reference()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_reference.md),
[`pb_validate_samples()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_samples.md),
[`pb_validate_sites()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_sites.md)

## Examples

``` r
if (FALSE) { # \dontrun{
pb_validate_measurements(example_measurements_tibble())
} # }
```
