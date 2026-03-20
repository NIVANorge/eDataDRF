# Initialise an 14x0 tibble for storing biota metadata

Initialise an 14x0 tibble for storing biota metadata

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

`SAMPLE_ID`: Unique identifier linking to the samples table (mandatory,
foreign key for measurements)

`SITE_CODE`: Code identifying the sampling location (mandatory, foreign
key for sites)

`PARAMETER_NAME`: Name of the measured parameter or stressor (mandatory,
foreign key for parameters)

`ENVIRON_COMPARTMENT`: Broad environmental compartment category
(mandatory, inherited from samples)

`ENVIRON_COMPARTMENT_SUB`: Specific sub-category of the environmental
compartment (mandatory, inherited from samples)

`MEASURED_CATEGORY`: Category indicating measurement context (mandatory,
inherited from samples)

`SAMPLING_DATE`: Date when the biological sample was collected
(mandatory, inherited from samples)

`SUBSAMPLE`: Identifier for subsample or replicate (mandatory, inherited
from samples)

`SPECIES_GROUP`: Taxonomic group classification, e.g., Fish, Molluscs,
Plants (mandatory)

`SAMPLE_SPECIES`: Scientific binomial name of the sampled species
(mandatory)

`SAMPLE_TISSUE`: Type of biological tissue sampled (mandatory)

`SAMPLE_SPECIES_LIFESTAGE`: Life stage of the organism at sampling
(mandatory)

`SAMPLE_SPECIES_GENDER`: Gender or sex of the sampled organism
(mandatory)

`BIOTA_COMMENT`: Additional notes or comments about the biological
sample (optional)

See
[`vignette("biota_data")`](https://NIVANorge.github.io/eDataDRF/articles/biota_data.md)
for more information.

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
[`example_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_biota_tibble.md),
[`gender_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/gender_vocabulary.md),
[`lifestage_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/lifestage_vocabulary.md),
[`species_groups_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_groups_vocabulary.md),
[`species_names_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_names_vocabulary.md),
[`tissue_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/tissue_types_vocabulary.md)

## Examples

``` r
initialise_biota_tibble()
#> # A tibble: 0 × 14
#> # ℹ 14 variables: SAMPLE_ID <chr>, SITE_CODE <chr>, PARAMETER_NAME <chr>,
#> #   ENVIRON_COMPARTMENT <chr>, ENVIRON_COMPARTMENT_SUB <chr>,
#> #   MEASURED_CATEGORY <chr>, SAMPLING_DATE <chr>, SUBSAMPLE <chr>,
#> #   SPECIES_GROUP <chr>, SAMPLE_SPECIES <chr>, SAMPLE_TISSUE <chr>,
#> #   SAMPLE_SPECIES_LIFESTAGE <chr>, SAMPLE_SPECIES_GENDER <chr>,
#> #   BIOTA_COMMENT <chr>
```
