# Initialise campaign tibble

Creates an empty tibble with the standardised column structure for
campaign data.

## Usage

``` r
initialise_campaign_tibble()
```

## Value

A tibble with 0 rows and standardised campaign columns

## Details

Campaigns represent sampling projects or studies with metadata about
timing, organisation, data quality evaluation, and confidentiality. The
tibble includes the following columns:

CAMPAIGN_NAME_SHORT: Short identifier for the campaign

CAMPAIGN_NAME: Full descriptive name of the campaign

CAMPAIGN_START_DATE: Date when campaign sampling began

CAMPAIGN_END_DATE: Date when campaign sampling ended

RELIABILITY_SCORE: Quality assessment score for the campaign data

RELIABILITY_EVAL_SYS: System or framework used for reliability
evaluation

CONFIDENTIALITY_EXPIRY_DATE: Date when data confidentiality restrictions
expire

ORGANISATION: Organisation responsible for the campaign

ENTERED_BY: Person or entity who entered the data

ENTERED_DATE: Date when the data was entered into the system

CAMPAIGN_COMMENT: Additional notes or comments about the campaign

See vignette("campaign-data") for more information.

## See also

Other initialise_tibble:
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`initialise_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_compartments_tibble.md),
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`initialise_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_references_tibble.md),
[`initialise_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_samples_tibble.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md)
