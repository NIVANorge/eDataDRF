# Controlled vocabulary for the `SAMPLE_SPECIES_GENDER` column, Biota table

Returns controlled vocabulary options for organism sex or gender.

## Usage

``` r
gender_vocabulary()
```

## Value

A character vector of gender options

## See also

Other biota:
[`example_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_biota_tibble.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`lifestage_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/lifestage_vocabulary.md),
[`species_groups_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_groups_vocabulary.md),
[`species_names_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_names_vocabulary.md),
[`tissue_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/tissue_types_vocabulary.md)

## Examples

``` r
gender_vocabulary()
#> [1] "Not reported"  "Not relevant"  "Male"          "Female"       
#> [5] "Mixed"         "Hermaphrodite" "Other"        
```
