# Create Example Sites Tibble

Creates a 2-row sites tibble with test data. Inherits column structure
from
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md).

## Usage

``` r
example_sites_tibble()
```

## Value

A tibble with 2 rows of dummy site data

## See also

Other example_tibble:
[`example_CREED_relevance_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_relevance_tibble.md),
[`example_CREED_reliability_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_reliability_tibble.md),
[`example_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_scores_tibble.md),
[`example_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_biota_tibble.md),
[`example_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_campaign_tibble.md),
[`example_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_compartments_tibble.md),
[`example_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_measurements_tibble.md),
[`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md),
[`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md),
[`example_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_references_tibble.md),
[`example_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_samples_tibble.md)

Other site:
[`altitude_units_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/altitude_units_vocabulary.md),
[`areas_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/areas_vocabulary.md),
[`coordinate_systems_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/coordinate_systems_vocabulary.md),
[`countries_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/countries_vocabulary.md),
[`geographic_features_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/geographic_features_sub_vocabulary.md),
[`geographic_features_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/geographic_features_vocabulary.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md),
[`ocean_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/ocean_vocabulary.md)

## Examples

``` r
example_sites_tibble()
#> # A tibble: 2 × 14
#>   SITE_CODE SITE_NAME  SITE_GEOGRAPHIC_FEAT…¹ SITE_GEOGRAPHIC_FEAT…² COUNTRY_ISO
#>   <chr>     <chr>      <chr>                  <chr>                  <chr>      
#> 1 SITE-001  Oslofjord… Coastal, fjord         Water column, pelagic… Norway     
#> 2 SITE-002  Bergen Ha… Coastal, fjord         Water benthos          Norway     
#> # ℹ abbreviated names: ¹​SITE_GEOGRAPHIC_FEATURE, ²​SITE_GEOGRAPHIC_FEATURE_SUB
#> # ℹ 9 more variables: OCEAN_IHO <chr>, LATITUDE <dbl>, LONGITUDE <dbl>,
#> #   SITE_COORDINATE_SYSTEM <chr>, ALTITUDE_VALUE <dbl>, ALTITUDE_UNIT <chr>,
#> #   ENTERED_BY <chr>, ENTERED_DATE <chr>, SITE_COMMENT <chr>
```
