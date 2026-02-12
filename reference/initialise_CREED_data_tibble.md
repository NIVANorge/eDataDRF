# Initialise CREED criteria data tibble

Creates an empty tibble with the standardised column structure for
detailed CREED criterion assessment data.

## Usage

``` r
initialise_CREED_data_tibble()
```

## Value

A tibble with 0 rows and standardised CREED criterion columns

## Details

CREED criteria data stores individual criterion scores, relevant data,
and limitations for both reliability and relevance assessments. This
structure is used internally by assessment modules and is not part of
the externally-available table structure. The tibble includes the
following columns:

criterion_id: Unique identifier for the CREED criterion

criterion_title: Descriptive title of the criterion

required_recommended: Whether the criterion is required or recommended

relevant_data: Data or information relevant to assessing the criterion

score: Assessment score for the criterion

limitations: Identified limitations or concerns for the criterion

## See also

Other initialise_tibble:
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md),
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
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md)
