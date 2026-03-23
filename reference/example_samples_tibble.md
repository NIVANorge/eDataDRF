# Create Example Samples Tibble

Creates a 2-row samples tibble with test data. Inherits column structure
from
[`initialise_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_samples_tibble.md).
`SAMPLE_ID` values are automatically generated using
[`generate_sample_id_with_components()`](https://NIVANorge.github.io/eDataDRF/reference/generate_sample_id_with_components.md).

## Usage

``` r
example_samples_tibble()
```

## Value

A tibble with 2 rows of dummy sample data

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
[`example_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_sites_tibble.md)

Other sample:
[`generate_sample_id_with_components()`](https://NIVANorge.github.io/eDataDRF/reference/generate_sample_id_with_components.md),
[`initialise_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_samples_tibble.md),
[`sample_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/sample_id_regex.md)

## Examples

``` r
example_samples_tibble()
#> # A tibble: 2 × 11
#>   SITE_CODE SITE_NAME       PARAMETER_NAME PARAMETER_TYPE ENVIRON_COMPARTMENT
#>   <chr>     <chr>           <chr>          <chr>          <chr>              
#> 1 SITE-001  Oslofjord Inner Copper         Stressor       Aquatic            
#> 2 SITE-002  Bergen Harbour  Lead           Stressor       Biota              
#> # ℹ 6 more variables: ENVIRON_COMPARTMENT_SUB <chr>, MEASURED_CATEGORY <chr>,
#> #   SAMPLING_DATE <chr>, SUBSAMPLE <chr>, SUBSAMPLE_ID <chr>, SAMPLE_ID <glue>
```
