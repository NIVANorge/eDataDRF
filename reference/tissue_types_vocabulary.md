# Tissue types controlled vocabulary

Returns controlled vocabulary options for biological tissue types.

## Usage

``` r
tissue_types_vocabulary()
```

## Value

A character vector of tissue type options

## Details

In future, this will be standardised with the BRENDA and/or Uberon
tissue ontologies.

## See also

Other biota:
[`example_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_biota_tibble.md),
[`gender_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/gender_vocabulary.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`lifestage_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/lifestage_vocabulary.md),
[`species_groups_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_groups_vocabulary.md),
[`species_names_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_names_vocabulary.md)

## Examples

``` r
head(tissue_types_vocabulary(), 5)
#> [1] "Not reported"       "Not relevant"       "Whole body"        
#> [4] "Total soft tissues" "Muscle"            
```
