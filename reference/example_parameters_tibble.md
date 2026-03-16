# Create Example Parameters Tibble

Creates a 3-row parameters tibble with test data. Inherits column
structure from
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md).

## Usage

``` r
example_parameters_tibble()
```

## Value

A tibble with 3 rows of dummy parameter data

## See also

Other example_tibble:
[`example_CREED_relevance_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_relevance_tibble.md),
[`example_CREED_reliability_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_reliability_tibble.md),
[`example_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_scores_tibble.md),
[`example_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_biota_tibble.md),
[`example_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_campaign_tibble.md),
[`example_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_compartments_tibble.md),
[`example_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_measurements_tibble.md),
[`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md),
[`example_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_references_tibble.md),
[`example_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_samples_tibble.md),
[`example_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_sites_tibble.md)

Other parameter:
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`parameter_types_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_sub_vocabulary.md),
[`parameter_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_vocabulary.md),
[`parameters_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameters_vocabulary.md)

## Examples

``` r
example_parameters_tibble()
#> # A tibble: 3 × 10
#>   PARAMETER_TYPE PARAMETER_TYPE_SUB          MEASURED_TYPE PARAMETER_NAME
#>   <chr>          <chr>                       <chr>         <chr>         
#> 1 Stressor       Homogeneous metal compounds Concentration Copper        
#> 2 Stressor       Homogeneous metal compounds Concentration Lead          
#> 3 Stressor       Homogeneous metal compounds Concentration Zinc          
#> # ℹ 6 more variables: PARAMETER_NAME_SUB <chr>, INCHIKEY_SD <chr>,
#> #   PUBCHEM_CID <int>, CAS_RN <chr>, ENTERED_BY <chr>, PARAMETER_COMMENT <chr>
```
