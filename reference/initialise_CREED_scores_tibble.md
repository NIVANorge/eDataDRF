# Initialise CREED scores tibble

Creates an empty tibble with the standardised column structure for CREED
final scores.

## Usage

``` r
initialise_CREED_scores_tibble()
```

## Value

A tibble with 0 rows and standardised CREED columns

## Details

CREED scores provide data quality assessment results for references,
evaluating both reliability and relevance at silver and gold standard
levels. The tibble includes the following columns:

REFERENCE_ID: Unique identifier linking to the references table

SILVER_RELIABILITY: Reliability score at silver standard level

SILVER_RELEVANCE: Relevance score at silver standard level

GOLD_RELIABILITY: Reliability score at gold standard level

GOLD_RELEVANCE: Relevance score at gold standard level

## See also

Other initialise_tibble:
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`initialise_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_campaign_tibble.md),
[`initialise_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_compartments_tibble.md),
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`initialise_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_references_tibble.md),
[`initialise_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_samples_tibble.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md)

Other CREED:
[`CREED_choices_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/CREED_choices_vocabulary.md),
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md)
