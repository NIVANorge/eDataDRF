# Initialise samples tibble

Creates an empty tibble with the standardised column structure for
sample data.

## Usage

``` r
initialise_samples_tibble()
```

## Value

A tibble with 0 rows and standardised sample columns

## Details

Samples represent individual collections from sites with temporal,
spatial, and methodological information linking sites, parameters, and
compartments. The tibble includes the following columns:

SITE_CODE: Code identifying the sampling location

SITE_NAME: Descriptive name of the sampling site

PARAMETER_NAME: Name of the measured parameter

PARAMETER_TYPE: Classification of the parameter

ENVIRON_COMPARTMENT: Environmental compartment defined as one of the
earth's spheres (aquatic, atmospheric, etc.)

ENVIRON_COMPARTMENT_SUB: Sub-divisions of environmental compartments
into water body types, soil profile, etc.

MEASURED_CATEGORY: Measurement context category

SAMPLING_DATE: Date of sample collection

SUBSAMPLE: Subsample or replicate identifier

SUBSAMPLE_ID: Unique identifier for the subsample

SAMPLE_ID: Unique identifier for the sample (Key)

## See also

Other initialise_tibble:
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`initialise_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_campaign_tibble.md),
[`initialise_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_compartments_tibble.md),
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`initialise_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_references_tibble.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md)
