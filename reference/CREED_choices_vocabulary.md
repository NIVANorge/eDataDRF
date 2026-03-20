# Controlled vocabulary for CREED scores, CREED table

Returns standardised scoring options for CREED data quality assessment.

## Usage

``` r
CREED_choices_vocabulary()
```

## Value

Named character vector with CREED scoring choices and their numeric
values

## Details

Provides the four-level scoring system used in CREED (Criteria for
Reporting and Evaluating Ecotoxicity Data) assessments. Options include:

`Not Met`: Score value `4`

`"Fully Met"`: Score value `1`

`"Partly Met"`: Score value `2`

`"Not Reported"`: Score value `3`

`"Not Relevant"`: Score value `1`

## See also

Other CREED:
[`CREED_tibble_to_mock_input()`](https://NIVANorge.github.io/eDataDRF/reference/creed_tibble_to_mock_input.md),
[`example_CREED_relevance_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_relevance_tibble.md),
[`example_CREED_reliability_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_reliability_tibble.md),
[`example_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_scores_tibble.md),
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md)

## Examples

``` r
CREED_choices_vocabulary()
#>      Not Met    Fully Met   Partly Met Not Reported Not Relevant 
#>            4            1            2            3            1 
```
