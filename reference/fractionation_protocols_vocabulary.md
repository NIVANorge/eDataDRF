# Controlled vocabulary for PROTOCOL_TYPE and PROTOCOL_NAME columns (fractionation), Methods table

Returns fractionation protocol options with short and long names.

## Usage

``` r
fractionation_protocols_vocabulary()
```

## Value

A tibble with Protocol_Type, Short_Name, and Long_Name columns

## Details

Provides standardised fractionation method classifications as a tibble
with three columns:

Protocol_Type: Always "Fractionation Protocol"

Short_Name: Abbreviated protocol name (e.g., "Total", "Dissolved",
"Filtered")

Long_Name: Full descriptive name (e.g., "Total fraction", "Dissolved
fraction", "Filtered fraction")

Available protocols include: Not relevant, Not reported, Total,
Particles, Colloidal, LMM, Aqueous, Filtered 0.45um, Filtered 0.2um,
Dissolved, Filtered, Acid extractable, Reducible, Oxidisable, Residual,
Bioavailable, Free ion, Size fractionated, Other

## See also

Other method:
[`analytical_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/analytical_protocols_vocabulary.md),
[`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md),
[`extraction_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/extraction_protocols_vocabulary.md),
[`generate_protocol_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_protocol_id.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`protocol_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_categories_vocabulary.md),
[`protocol_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_id_regex.md),
[`protocol_options_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_options_vocabulary.md),
[`sampling_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/sampling_protocols_vocabulary.md)

## Examples

``` r
head(fractionation_protocols_vocabulary(), 5)
#> # A tibble: 5 × 3
#>   Protocol_Type          Short_Name   Long_Name           
#>   <chr>                  <chr>        <chr>               
#> 1 Fractionation Protocol Not relevant Not relevant        
#> 2 Fractionation Protocol Not reported Not reported        
#> 3 Fractionation Protocol Total        Total fraction      
#> 4 Fractionation Protocol Particles    Particulate fraction
#> 5 Fractionation Protocol Colloidal    Colloidal fraction  
```
