# Controlled vocabulary for the UNCERTAINTY_TYPE column, Measurements table

Returns controlled vocabulary options for statistical uncertainty and
variability measures.

## Usage

``` r
uncertainty_types_vocabulary()
```

## Value

A character vector of uncertainty type options

## See also

Other measurement:
[`example_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_measurements_tibble.md),
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`measured_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_categories_vocabulary.md),
[`measured_flag_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_flag_vocabulary.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`parameter_unit_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_unit_vocabulary.md)

## Examples

``` r
head(uncertainty_types_vocabulary(), 5)
#> [1] "Not Reported"       "Not Relevant"       "Arithmetic Mean"   
#> [4] "Geometric Mean"     "Standard Deviation"
```
