# Controlled vocabulary for the `ENVIRON_COMPARTMENT` column, Compartments table

Returns controlled vocabulary options for broad environmental
compartments. Calls `names(environ_compartments_sub_vocabulary())` to
return the first level of the list.

## Usage

``` r
environ_compartments_vocabulary()
```

## Value

A character vector of environmental compartment options

## See also

Other compartment:
[`environ_compartments_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/environ_compartments_sub_vocabulary.md),
[`example_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_compartments_tibble.md),
[`initialise_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_compartments_tibble.md),
[`measured_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_categories_vocabulary.md)

## Examples

``` r
environ_compartments_vocabulary()
#> [1] "Aquatic"      "Atmospheric"  "Terrestrial"  "Biota"        "Not relevant"
#> [6] "Not reported" "Other"       
```
