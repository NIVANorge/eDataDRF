# Controlled vocabulary for the PARAMETER_TYPES column, Parameters table

Returns controlled vocabulary options for broad parameter
classifications.

## Usage

``` r
parameter_types_vocabulary()
```

## Value

A character vector of parameter type options

## See also

Other parameter:
[`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`parameter_types_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_sub_vocabulary.md),
[`parameters_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameters_vocabulary.md)

## Examples

``` r
parameter_types_vocabulary()
#> [1] "Not relevant"         "Stressor"             "Quality parameter"   
#> [4] "Normalisation"        "Background"           "Ecological Indicator"
#> [7] "Other"               
```
