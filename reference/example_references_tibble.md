# Create Example References Tibble

Creates a 1-row references tibble with test data. Inherits column
structure from
[`initialise_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_references_tibble.md).
`REFERENCE_ID` is automatically generated using
[`generate_reference_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_reference_id.md).

## Usage

``` r
example_references_tibble()
```

## Value

A tibble with 1 row of dummy reference data

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
[`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md),
[`example_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_samples_tibble.md),
[`example_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_sites_tibble.md)

Other reference:
[`generate_reference_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_reference_id.md),
[`initialise_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_references_tibble.md)

## Examples

``` r
example_references_tibble()
#> # A tibble: 1 × 18
#>   REFERENCE_ID         REFERENCE_TYPE DATA_SOURCE AUTHOR TITLE  YEAR ACCESS_DATE
#>   <chr>                <chr>          <chr>       <chr>  <chr> <int> <date>     
#> 1 2023SmithHeavyMetal… Journal Artic… Primary     Smith… Heav…  2023 2026-03-31 
#> # ℹ 11 more variables: PERIODICAL_JOURNAL <chr>, VOLUME <int>, ISSUE <int>,
#> #   PUBLISHER <chr>, INSTITUTION <chr>, DOI <chr>, URL <chr>, ISBN_ISSN <chr>,
#> #   EDITION <chr>, DOCUMENT_NUMBER <chr>, REF_COMMENT <chr>
```
