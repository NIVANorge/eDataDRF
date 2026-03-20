# Convert CREED Tibble to Mock Input List

Converts a CREED data tibble (from
[`example_CREED_reliability_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_reliability_tibble.md)
or
[`example_CREED_relevance_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_relevance_tibble.md))
into a mock Shiny input list object suitable for testing
`collect_CREED_data()`.

## Usage

``` r
CREED_tibble_to_mock_input(creed_tibble)
```

## Arguments

- creed_tibble:

  A tibble with columns: `criterion_id`, `relevant_data`, `score`,
  `limitations`.

## Value

A named list with entries for each criterion's score, relevant data, and
limitations (or justification for RB8), suitable for use as a mock Shiny
`input` object.

## Details

Score values are converted from numeric to text:

- 1 = "Fully Met" (or "Not Relevant")

- 2 = "Partly Met"

- 3 = "Not Reported"

- 4 = "Not Met"

## See also

Other CREED:
[`CREED_choices_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/CREED_choices_vocabulary.md),
[`example_CREED_relevance_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_relevance_tibble.md),
[`example_CREED_reliability_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_reliability_tibble.md),
[`example_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_scores_tibble.md),
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md)

## Examples

``` r
CREED_tibble_to_mock_input(example_CREED_reliability_tibble())
#> $RB1_score
#>           1 
#> "Fully Met" 
#> 
#> $RB1_relevant_data
#> [1] "1 compartment: Aquatic Sediment\n2 samples. Grain size: <63um sieved fraction."
#> 
#> $RB1_limitations
#> [1] ""
#> 
#> $RB2_score
#>           1 
#> "Fully Met" 
#> 
#> $RB2_relevant_data
#> [1] "1 protocol:\nSampling Protocol - Grab: (Surface sediments collected using Van Veen grab sampler)"
#> 
#> $RB2_limitations
#> [1] ""
#> 
#> $RB3_score
#>           1 
#> "Fully Met" 
#> 
#> $RB3_relevant_data
#> [1] "Samples stored frozen at -20 degrees C until analysis. Dried at 60 degrees C before digestion."
#> 
#> $RB3_limitations
#> [1] ""
#> 
#> $RB4_score
#>           1 
#> "Fully Met" 
#> 
#> $RB4_relevant_data
#> [1] "2 sites. Countries (1): Norway. Areas (1): Oslofjord. Lowest coordinate precision: 4"
#> 
#> $RB4_limitations
#> [1] ""
#> 
#> $RB5_score
#>           1 
#> "Fully Met" 
#> 
#> $RB5_relevant_data
#> [1] "2023-03-15 to 2023-04-20 (n=2)"
#> 
#> $RB5_limitations
#> [1] ""
#> 
#> $RB6_score
#>           1 
#> "Fully Met" 
#> 
#> $RB6_relevant_data
#> [1] "1 protocol:\nAnalytical Protocol - ICP-MS: (Inductively coupled plasma mass spectrometry)"
#> 
#> $RB6_limitations
#> [1] ""
#> 
#> $RB7_score
#>           1 
#> "Fully Met" 
#> 
#> $RB7_relevant_data
#> [1] "LOD: 0.1-0.3 mg/kg; LOQ: 0.5-1.0 mg/kg"
#> 
#> $RB7_limitations
#> [1] ""
#> 
#> $RB8_score
#>         4 
#> "Not Met" 
#> 
#> $RB8_relevant_data
#> [1] "Relevant data not collected by app. Please complete manually."
#> 
#> $RB8_justification
#> [1] "Laboratory accreditation status not reported in source."
#> 
#> $RB9_score
#>           1 
#> "Fully Met" 
#> 
#> $RB9_relevant_data
#> [1] "4 protocols:\nSampling Protocol - Grab\nExtraction Protocol - Acid digestion: (HNO3/HCl microwave-assisted)\nFractionation Protocol - Total\nAnalytical Protocol - ICP-MS"
#> 
#> $RB9_limitations
#> [1] ""
#> 
#> $RB10_score
#>            2 
#> "Partly Met" 
#> 
#> $RB10_relevant_data
#> [1] "Method blanks analysed with each batch."
#> 
#> $RB10_limitations
#> [1] "Blank values not explicitly reported."
#> 
#> $RB11_score
#>           1 
#> "Fully Met" 
#> 
#> $RB11_relevant_data
#> [1] "CRM MESS-3 analysed. Recovery: 95-102%."
#> 
#> $RB11_limitations
#> [1] ""
#> 
#> $RB12_score
#>           1 
#> "Fully Met" 
#> 
#> $RB12_relevant_data
#> [1] "Triplicate analyses performed. RSD <10%."
#> 
#> $RB12_limitations
#> [1] ""
#> 
#> $RB13_score
#>         4 
#> "Not Met" 
#> 
#> $RB13_relevant_data
#> [1] "1 protocol:\nSampling Protocol - Grab"
#> 
#> $RB13_limitations
#> [1] "No evidence of field blanks or duplicates."
#> 
#> $RB14_score
#>           1 
#> "Fully Met" 
#> 
#> $RB14_relevant_data
#> [1] "Uncertainty types: Standard Deviation"
#> 
#> $RB14_limitations
#> [1] "Not relevant - no normalisation applied."
#> 
#> $RB15_score
#>           1 
#> "Fully Met" 
#> 
#> $RB15_relevant_data
#> [1] "Measured parameter values reported to 3 significant figures"
#> 
#> $RB15_limitations
#> [1] ""
#> 
#> $RB16_score
#>           1 
#> "Fully Met" 
#> 
#> $RB16_relevant_data
#> [1] "Relevant data not collected by app. Please complete manually."
#> 
#> $RB16_limitations
#> [1] "No outliers reported or removed."
#> 
#> $RB17_score
#>           1 
#> "Fully Met" 
#> 
#> $RB17_relevant_data
#> [1] "Relevant data not collected by app. Please complete manually."
#> 
#> $RB17_limitations
#> [1] "One value reported as <LOQ with LOQ provided."
#> 
#> $RB18_score
#>           1 
#> "Fully Met" 
#> 
#> $RB18_relevant_data
#> [1] "Uncertainty types: Standard Deviation"
#> 
#> $RB18_limitations
#> [1] ""
#> 
#> $RB19_score
#>           1 
#> "Fully Met" 
#> 
#> $RB19_relevant_data
#> [1] "Relevant data not collected by app. Please complete manually."
#> 
#> $RB19_limitations
#> [1] "No supporting parameters required."
#> 
```
