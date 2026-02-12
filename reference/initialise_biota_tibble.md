# Initialise biota tibble

Creates an empty tibble with the standardised column structure for biota
data.

## Usage

``` r
initialise_biota_tibble()
```

## Value

A tibble with 0 rows and standardised biota columns

## Details

Biota data extends sample information with species-specific details
including taxonomic classification, tissue type, life stage, and gender
information. The tibble includes the following columns:

SAMPLE_ID: Unique identifier linking to the samples table

SITE_CODE: Code identifying the sampling location

PARAMETER_NAME: Name of the measured parameter or stressor

ENVIRON_COMPARTMENT: Broad environmental compartment category

ENVIRON_COMPARTMENT_SUB: Specific sub-category of the environmental
compartment

MEASURED_CATEGORY: Category indicating measurement context (External,
Internal, Surface)

SAMPLING_DATE: Date when the biological sample was collected

SUBSAMPLE: Identifier for subsample or replicate

SPECIES_GROUP: Taxonomic group classification (e.g., Fish, Molluscs,
Plants)

SAMPLE_SPECIES: Scientific or common name of the sampled species

SAMPLE_TISSUE: Type of biological tissue sampled

SAMPLE_SPECIES_LIFESTAGE: Life stage of the organism at sampling

SAMPLE_SPECIES_GENDER: Gender or sex of the sampled organism

BIOTA_COMMENT: Additional notes or comments about the biological sample

## See also

Other initialise_tibble:
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md),
[`initialise_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_campaign_tibble.md),
[`initialise_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_compartments_tibble.md),
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`initialise_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_references_tibble.md),
[`initialise_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_samples_tibble.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md)

Other biota:
[`gender_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/gender_vocabulary.md),
[`lifestage_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/lifestage_vocabulary.md),
[`species_groups_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_groups_vocabulary.md),
[`species_names_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_names_vocabulary.md),
[`tissue_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/tissue_types_vocabulary.md)
