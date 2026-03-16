# Create Example Campaign Tibble

Creates a 1-row campaign tibble with test data. Inherits column
structure from
[`initialise_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_campaign_tibble.md).

## Usage

``` r
example_campaign_tibble()
```

## Value

A tibble with 1 row of dummy campaign data

## See also

Other example_tibble:
[`example_CREED_relevance_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_relevance_tibble.md),
[`example_CREED_reliability_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_reliability_tibble.md),
[`example_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_scores_tibble.md),
[`example_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_biota_tibble.md),
[`example_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_compartments_tibble.md),
[`example_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_measurements_tibble.md),
[`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md),
[`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md),
[`example_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_references_tibble.md),
[`example_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_samples_tibble.md),
[`example_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_sites_tibble.md)

Other campaign:
[`initialise_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_campaign_tibble.md)

## Examples

``` r
example_campaign_tibble()
#> # A tibble: 1 × 8
#>   CAMPAIGN_NAME_SHORT CAMPAIGN_NAME        CAMPAIGN_START_DATE CAMPAIGN_END_DATE
#>   <chr>               <chr>                <date>              <date>           
#> 1 TestCamp2023        Test Campaign 2023:… 2023-01-15          2023-06-30       
#> # ℹ 4 more variables: ORGANISATION <chr>, ENTERED_BY <chr>,
#> #   ENTERED_DATE <date>, CAMPAIGN_COMMENT <chr>
```
