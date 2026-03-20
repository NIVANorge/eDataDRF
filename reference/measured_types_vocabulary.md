# Controlled vocabulary for the MEASURED_TYPE column, Parameters table

Returns controlled vocabulary options for types of measurements.

## Usage

``` r
measured_types_vocabulary()
```

## Value

A character vector of measured type options

## See also

Other parameter:
[`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`parameter_types_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_sub_vocabulary.md),
[`parameter_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_vocabulary.md),
[`parameters_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameters_vocabulary.md)

Other measurement:
[`example_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_measurements_tibble.md),
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`measured_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_categories_vocabulary.md),
[`measured_flag_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_flag_vocabulary.md),
[`parameter_unit_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_unit_vocabulary.md),
[`uncertainty_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/uncertainty_types_vocabulary.md)

## Examples

``` r
head(measured_types_vocabulary(), 5)
#> [1] "Concentration"      "Dose rate"          "Dose"              
#> [4] "Physical parameter" "Amount"            
```
