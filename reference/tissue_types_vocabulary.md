# Controlled vocabulary for the `SAMPLE_TISSUE` column, Biota table

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
tissue_types_vocabulary()
#>  [1] "Not reported"                    "Not relevant"                   
#>  [3] "Whole body"                      "Total soft tissues"             
#>  [5] "Muscle"                          "Liver"                          
#>  [7] "Kidney"                          "Fat/Adipose"                    
#>  [9] "Skin"                            "Bone"                           
#> [11] "Pyloric caeca"                   "Body wall"                      
#> [13] "Brain"                           "Heart"                          
#> [15] "Lung"                            "Gill"                           
#> [17] "Gonad"                           "Shell"                          
#> [19] "Carapace"                        "Digestive Gland"                
#> [21] "Mantle"                          "Blood"                          
#> [23] "Egg"                             "Larva"                          
#> [25] "Leaf"                            "Root"                           
#> [27] "Stem"                            "Fruit"                          
#> [29] "Seed"                            "Brown meat"                     
#> [31] "Shoot tips"                      "Disc skeleton"                  
#> [33] "Echinoid corona"                 "Bile"                           
#> [35] "Plant tissue"                    "Shoot tip"                      
#> [37] "Total soft tissues minus gonads" "Other"                          
```
