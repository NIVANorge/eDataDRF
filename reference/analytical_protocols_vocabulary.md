# Analytical protocols controlled vocabulary

Returns analytical protocol options with short and long names.

## Usage

``` r
analytical_protocols_vocabulary()
```

## Value

A tibble with Protocol_Type, Short_Name, and Long_Name columns

## Details

Provides standardised analytical method classifications as a tibble with
three columns:

Protocol_Type: Always "Analytical Protocol"

Short_Name: Abbreviated protocol name (e.g., "GC-MS", "LC-MS/MS",
"ICP-MS")

Long_Name: Full descriptive name (e.g., "Gas chromatography mass
spectrometry", "Liquid chromatography tandem mass spectrometry",
"Inductively coupled plasma mass spectrometry")

Available protocols include: Not relevant, Not reported, GC-MS, LC-MS,
LC-MS/MS, GC-MS/MS, UPLC, ICP-MS, ICP-OES, AAS, XRF, Ion chromatography,
Spectrophotometry, Fluorescence, Other

## See also

Other method:
[`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md),
[`extraction_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/extraction_protocols_vocabulary.md),
[`fractionation_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/fractionation_protocols_vocabulary.md),
[`generate_protocol_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_protocol_id.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`protocol_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_categories_vocabulary.md),
[`protocol_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_id_regex.md),
[`protocol_options_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_options_vocabulary.md),
[`sampling_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/sampling_protocols_vocabulary.md)

## Examples

``` r
head(analytical_protocols_vocabulary(), 5)
#> # A tibble: 5 × 3
#>   Protocol_Type       Short_Name   Long_Name                                    
#>   <chr>               <chr>        <chr>                                        
#> 1 Analytical Protocol Not relevant Not relevant                                 
#> 2 Analytical Protocol Not reported Not reported                                 
#> 3 Analytical Protocol GC-MS        Gas chromatography mass spectrometry         
#> 4 Analytical Protocol LC-MS        Liquid chromatography mass spectrometry      
#> 5 Analytical Protocol LC-MS/MS     Liquid chromatography tandem mass spectromet…
```
