# Create Example CREED Reliability Tibble

Creates a 19-row CREED reliability tibble (RB1-RB19) with realistic test
data including scores, extracted data, and limitations. Inherits column
structure from
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md).

## Usage

``` r
example_CREED_reliability_tibble()
```

## Value

A tibble with 19 rows of dummy CREED reliability data

## See also

Other example_tibble:
[`example_CREED_relevance_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_relevance_tibble.md),
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
[`CREED_tibble_to_mock_input()`](https://NIVANorge.github.io/eDataDRF/reference/creed_tibble_to_mock_input.md),
[`example_CREED_relevance_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_relevance_tibble.md),
[`example_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_scores_tibble.md),
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md)

## Examples

``` r
example_CREED_reliability_tibble()
#> # A tibble: 19 × 6
#>    criterion_id criterion_title         required_recommended relevant_data score
#>    <chr>        <chr>                   <chr>                <chr>         <int>
#>  1 RB1          Sample Medium/Matrix    Required             "1 compartme…     1
#>  2 RB2          Collection Method/Samp… Recommended          "1 protocol:…     1
#>  3 RB3          Sample Handling         Recommended          "Samples sto…     1
#>  4 RB4          Site Location           Required             "2 sites. Co…     1
#>  5 RB5          Date and Time           Required             "2023-03-15 …     1
#>  6 RB6          Analyte(s) Measured     Required             "1 protocol:…     1
#>  7 RB7          Limit of Detection and… Required             "LOD: 0.1-0.…     1
#>  8 RB8          Accreditation/Quality … Required             "Relevant da…     4
#>  9 RB9          Method                  Required             "4 protocols…     1
#> 10 RB10         Lab Blank Contamination Recommended          "Method blan…     2
#> 11 RB11         Recovery/Accuracy       Recommended          "CRM MESS-3 …     1
#> 12 RB12         Reproducibility/Precis… Recommended          "Triplicate …     1
#> 13 RB13         Field QC                Recommended          "1 protocol:…     4
#> 14 RB14         Calculations            Recommended          "Uncertainty…     1
#> 15 RB15         Significant Figures     Recommended          "Measured pa…     1
#> 16 RB16         Outliers                Recommended          "Relevant da…     1
#> 17 RB17         Censored Data           Required             "Relevant da…     1
#> 18 RB18         Summary Statistics Pro… Recommended          "Uncertainty…     1
#> 19 RB19         Supporting Data Quality Recommended          "Relevant da…     1
#> # ℹ 1 more variable: limitations <chr>
```
