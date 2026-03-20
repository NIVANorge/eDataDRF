# Controlled vocabulary for `PROTOCOL_TYPE` and `PROTOCOL_NAME` columns (all), Methods table

Returns combined protocol options from all protocol categories.

## Usage

``` r
protocol_options_vocabulary()
```

## Value

A tibble with `Protocol_Type`, `Short_Name`, and `Long_Name` columns for
all protocols

## Details

Combines all protocol vocabularies (sampling, fractionation, extraction,
and analytical) into a single comprehensive tibble. Contains columns:

`Protocol_Type`: Category of protocol (Sampling, Fractionation,
Extraction, or Analytical Protocol)

`Short_Name`: Abbreviated protocol name

`Long_Name`: Full descriptive protocol name

This function aggregates results from sampling_protocols_vocabulary(),
fractionation_protocols_vocabulary(), extraction_protocols_vocabulary(),
and analytical_protocols_vocabulary().

## See also

Other method:
[`analytical_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/analytical_protocols_vocabulary.md),
[`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md),
[`extraction_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/extraction_protocols_vocabulary.md),
[`fractionation_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/fractionation_protocols_vocabulary.md),
[`generate_protocol_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_protocol_id.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`protocol_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_categories_vocabulary.md),
[`protocol_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_id_regex.md),
[`sampling_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/sampling_protocols_vocabulary.md)

## Examples

``` r
head(protocol_options_vocabulary(), 5)
#> # A tibble: 5 × 3
#>   Protocol_Type     Short_Name   Long_Name         
#>   <chr>             <chr>        <chr>             
#> 1 Sampling Protocol Not relevant Not relevant      
#> 2 Sampling Protocol Not reported Not reported      
#> 3 Sampling Protocol Point        Point sampling    
#> 4 Sampling Protocol Composite    Composite sampling
#> 5 Sampling Protocol Trawl        Trawl sampling    
```
