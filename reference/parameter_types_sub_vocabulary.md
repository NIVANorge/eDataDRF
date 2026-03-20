# Controlled vocabulary for the PARAMETER_TYPES_SUB column, Parameters table

Returns controlled vocabulary options for parameter type subcategories.

## Usage

``` r
parameter_types_sub_vocabulary()
```

## Value

A character vector of parameter type subcategory options

## Details

Dynamically generated from unique PARAMETER_TYPE_SUB values in
[`parameters_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameters_vocabulary.md),
with "Mixture" appended and standard data quality flags prepended.

## See also

Other parameter:
[`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`parameter_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_vocabulary.md),
[`parameters_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameters_vocabulary.md)

## Examples

``` r
head(parameter_types_sub_vocabulary(), 5)
#> [1] "Not relevant"              "Not reported"             
#> [3] "Other"                     "Acetylides"               
#> [5] "Alkaloids and derivatives"
```
