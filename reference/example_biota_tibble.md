# Create Example Biota Tibble

Creates a 1-row biota tibble with test data. Inherits column structure
from
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md).
`SAMPLE_ID` is automatically generated using
[`generate_sample_id_with_components()`](https://NIVANorge.github.io/eDataDRF/reference/generate_sample_id_with_components.md).

## Usage

``` r
example_biota_tibble()
```

## Value

A tibble with 1 row of dummy biota data

## See also

Other example_tibble:
[`example_CREED_relevance_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_relevance_tibble.md),
[`example_CREED_reliability_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_reliability_tibble.md),
[`example_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_scores_tibble.md),
[`example_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_campaign_tibble.md),
[`example_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_compartments_tibble.md),
[`example_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_measurements_tibble.md),
[`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md),
[`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md),
[`example_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_references_tibble.md),
[`example_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_samples_tibble.md),
[`example_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_sites_tibble.md)

Other biota:
[`gender_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/gender_vocabulary.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`lifestage_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/lifestage_vocabulary.md),
[`species_groups_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_groups_vocabulary.md),
[`species_names_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_names_vocabulary.md),
[`tissue_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/tissue_types_vocabulary.md)

## Examples

``` r
example_biota_tibble()
#> # A tibble: 1 × 14
#>   SAMPLE_ID  SITE_CODE PARAMETER_NAME ENVIRON_COMPARTMENT ENVIRON_COMPARTMENT_…¹
#>   <glue>     <chr>     <chr>          <chr>               <chr>                 
#> 1 SITE-001-… SITE-001  Copper         Biota               Biota, Aquatic        
#> # ℹ abbreviated name: ¹​ENVIRON_COMPARTMENT_SUB
#> # ℹ 9 more variables: MEASURED_CATEGORY <chr>, SAMPLING_DATE <chr>,
#> #   SUBSAMPLE <chr>, SPECIES_GROUP <chr>, SAMPLE_SPECIES <chr>,
#> #   SAMPLE_TISSUE <chr>, SAMPLE_SPECIES_LIFESTAGE <chr>,
#> #   SAMPLE_SPECIES_GENDER <chr>, BIOTA_COMMENT <chr>
```
