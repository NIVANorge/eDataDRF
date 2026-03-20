# Controlled vocabulary for the `OCEAN_IHO` column, Sites table

Returns controlled vocabulary options for IHO ocean regions.

## Usage

``` r
ocean_vocabulary()
```

## Value

A character vector of sea and ocean name options

## Details

Provides ocean and sea names from the International Hydrographic
Organisation (IHO) regions dataset, regions dataset
(<https://www.marineregions.org/downloads.php>, World Seas IHO v3).

## See also

Other site:
[`altitude_units_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/altitude_units_vocabulary.md),
[`areas_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/areas_vocabulary.md),
[`coordinate_systems_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/coordinate_systems_vocabulary.md),
[`countries_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/countries_vocabulary.md),
[`example_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_sites_tibble.md),
[`geographic_features_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/geographic_features_sub_vocabulary.md),
[`geographic_features_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/geographic_features_vocabulary.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md)

## Examples

``` r
head(ocean_vocabulary(), 15)
#>  [1] "Not relevant"       "Not reported"       "Other"             
#>  [4] "Torres Strait"      "Tasman Sea"         "Solomon Sea"       
#>  [7] "Ross Sea"           "Coral Sea"          "Bismarck Sea"      
#> [10] "Bellingshausen Sea" "Bass Strait"        "Amundsen Sea"      
#> [13] "Timor Sea"          "Sunda Strait"       "Sumba Strait"      
```
