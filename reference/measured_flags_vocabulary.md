# Measurement flags controlled vocabulary

Returns controlled vocabulary options for measurement quality flags.

## Usage

``` r
measured_flags_vocabulary()
```

## Value

A character vector of measurement flag options

## Details

Provides standardised flags for indicating measurements below detection
or quantification limits. Options include:

"" (empty string for measurements above limits)

\< LOQ (below limit of quantification)

\< LOD (below limit of detection)

## See also

Other measurement:
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`measured_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_categories_vocabulary.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`parameter_unit_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_unit_vocabulary.md),
[`uncertainty_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/uncertainty_types_vocabulary.md)
