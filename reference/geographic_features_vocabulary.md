# Controlled vocabulary for the `SITE_GEOGRAPHIC_FEATURE` column, Sites table

Returns controlled vocabulary options for site geographic features.

## Usage

``` r
geographic_features_vocabulary()
```

## Value

A character vector of geographic feature options

## See also

Other site:
[`altitude_units_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/altitude_units_vocabulary.md),
[`areas_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/areas_vocabulary.md),
[`coordinate_systems_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/coordinate_systems_vocabulary.md),
[`countries_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/countries_vocabulary.md),
[`example_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_sites_tibble.md),
[`geographic_features_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/geographic_features_sub_vocabulary.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md),
[`ocean_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/ocean_vocabulary.md)

## Examples

``` r
geographic_features_vocabulary()
#>  [1] "Not relevant"                      "Not reported"                     
#>  [3] "River, stream, canal"              "Lake, pond, pool, reservoir"      
#>  [5] "Ocean, sea, territorial waters"    "Coastal, fjord"                   
#>  [7] "Estuary"                           "Drainage, sewer, artificial water"
#>  [9] "Swamp, wetland"                    "Groundwater, aquifer"             
#> [11] "WWTP"                              "Artificial Land/Urban Areas"      
#> [13] "Landfills"                         "Cropland"                         
#> [15] "Woodland, forest"                  "Shrubland"                        
#> [17] "Grassland"                         "Bare land and lichen/moss"        
#> [19] "Glacier"                           "Other"                            
```
