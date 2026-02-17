# Initialise compartments tibble

Creates an empty tibble with the standardised column structure for
environmental compartment data.

## Usage

``` r
initialise_compartments_tibble()
```

## Value

A tibble with 0 rows and standardised compartment columns

## Details

Compartments define the environmental matrix and measurement context for
sampling activities. The compartments table is not a direct output of
the eData format but is used to construct the samples table. The tibble
includes the following columns:

ENVIRON_COMPARTMENT: Broad environmental compartment (Aquatic,
Atmospheric, Terrestrial, Biota)

ENVIRON_COMPARTMENT_SUB: Specific sub-category within the compartment

MEASURED_CATEGORY: Measurement context (External Media, Internal to
Organism, Surface of Organism)

## See also

Other initialise_tibble:
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`initialise_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_campaign_tibble.md),
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`initialise_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_references_tibble.md),
[`initialise_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_samples_tibble.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md)

Other compartment:
[`environ_compartments_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/environ_compartments_sub_vocabulary.md),
[`environ_compartments_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/environ_compartments_vocabulary.md),
[`measured_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_categories_vocabulary.md)
