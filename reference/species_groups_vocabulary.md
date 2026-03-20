# Controlled vocabulary for the SPECIES_GROUP column, Biota table

Returns controlled vocabulary options for broad taxonomic groups from
the EPA ECOTOX database.

## Usage

``` r
species_groups_vocabulary()
```

## Value

A character vector of species group options

## See also

Other biota:
[`example_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_biota_tibble.md),
[`gender_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/gender_vocabulary.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`lifestage_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/lifestage_vocabulary.md),
[`species_names_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_names_vocabulary.md),
[`tissue_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/tissue_types_vocabulary.md)

## Examples

``` r
head(species_groups_vocabulary(), 5)
#> [1] "All"        "Algae"      "Amphibians" "Bacteria"   "Birds"     
```
