# Create Example CREED Relevance Tibble

Creates an 11-row CREED relevance tibble (RV1-RV11) with realistic test
data including scores, extracted data, and limitations. Inherits column
structure from
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md).

## Usage

``` r
example_CREED_relevance_tibble()
```

## Value

A tibble with 11 rows of dummy CREED relevance data

## See also

Other example_tibble:
[`example_CREED_reliability_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_reliability_tibble.md),
[`example_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_scores_tibble.md),
[`example_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_biota_tibble.md),
[`example_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_campaign_tibble.md),
[`example_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_compartments_tibble.md),
[`example_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_measurements_tibble.md),
[`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md),
[`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md),
[`example_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_references_tibble.md),
[`example_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_samples_tibble.md),
[`example_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_sites_tibble.md)

Other CREED:
[`CREED_choices_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/CREED_choices_vocabulary.md),
[`creed_tibble_to_mock_input()`](https://NIVANorge.github.io/eDataDRF/reference/creed_tibble_to_mock_input.md),
[`example_CREED_reliability_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_reliability_tibble.md),
[`example_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_scores_tibble.md),
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md)

## Examples

``` r
example_CREED_relevance_tibble()
#> # A tibble: 11 × 6
#>    criterion_id criterion_title         required_recommended relevant_data score
#>    <chr>        <chr>                   <chr>                <chr>         <int>
#>  1 RV1          Sample Medium/Matrix    Required             "1 compartme…     1
#>  2 RV2          Collection Method/Samp… Recommended          "1 protocol:…     1
#>  3 RV3          Study Area              Required             "2 sites. Co…     2
#>  4 RV4          Site Type               Recommended          "2 sites. Di…     2
#>  5 RV5          Sampling Timespan       Required             "2023-03-15 …     1
#>  6 RV6          Sampling Frequency      Required             "2023-03-15 …     2
#>  7 RV7          Temporal Conditions     Recommended          "Relevant da…     4
#>  8 RV8          Analyte                 Required             "1 protocol:…     1
#>  9 RV9          Sensitivity/LOD/LOQ     Required             "1 protocol:…     1
#> 10 RV10         Summary Statistics Type Recommended          "Uncertainty…     2
#> 11 RV11         Supporting Parameters   Recommended          "1 protocol:…     1
#> # ℹ 1 more variable: limitations <chr>
```
