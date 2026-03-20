# Controlled vocabulary for `PROTOCOL_TYPE` and `PROTOCOL_NAME` columns (sampling), Methods table

Returns sampling protocol options with short and long names.

## Usage

``` r
sampling_protocols_vocabulary()
```

## Value

A tibble with `Protocol_Type`, `Short_Name`, and `Long_Name` columns

## Details

Provides standardised sampling method classifications as a tibble with
three columns:

Protocol_Type: Always "Sampling Protocol"

Short_Name: Abbreviated protocol name (e.g., "Point", "Composite",
"Trawl")

Long_Name: Full descriptive name (e.g., "Point sampling", "Composite
sampling", "Trawl sampling")

Available protocols include: Not relevant, Not reported, Point,
Composite, Trawl, Grab, Core, Seine net, Electrofishing, Plankton net,
Bailer, Peristaltic pump, Active air, Passive air, SPMD, SPE, LVSPE,
DGT, Caged organisms, Blood sample, Biopsy, Other

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
[`protocol_options_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_options_vocabulary.md)

## Examples

``` r
head(sampling_protocols_vocabulary(), 5)
#> # A tibble: 5 × 3
#>   Protocol_Type     Short_Name   Long_Name         
#>   <chr>             <chr>        <chr>             
#> 1 Sampling Protocol Not relevant Not relevant      
#> 2 Sampling Protocol Not reported Not reported      
#> 3 Sampling Protocol Point        Point sampling    
#> 4 Sampling Protocol Composite    Composite sampling
#> 5 Sampling Protocol Trawl        Trawl sampling    
```
