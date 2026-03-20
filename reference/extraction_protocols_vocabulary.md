# Controlled vocabulary for `PROTOCOL_TYPE` and `PROTOCOL_NAME` columns (extraction), Methods table

Returns extraction protocol options with short and long names.

## Usage

``` r
extraction_protocols_vocabulary()
```

## Value

A tibble with `Protocol_Type`, `Short_Name`, and `Long_Name` columns

## Details

Provides standardised extraction method classifications as a tibble with
three columns:

`Protocol_Type`: Always "Extraction Protocol"

`Short_Name`: Abbreviated protocol name (e.g., "Methanol", "SPE Isolute
Env+", "QuEChERS")

`Long_Name`: Full descriptive name (e.g., "Methanol extraction", "Solid
phase extraction with Isolute Env+ cartridge", "Quick easy cheap
effective rugged safe extraction")

Available protocols include: Not relevant, Not reported, None, Methanol,
Dichloromethane, SPE Isolute Env+, Membrane filtration 0.45um, Membrane
filtration 0.2um, Membrane filtration, Filtration, Microwave-assisted
acid digestion, Acid digestion, Pressurised liquid, Ultrasonic, Soxhlet,
QuEChERS, Accelerated solvent, Sequential extraction, Other

## See also

Other method:
[`analytical_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/analytical_protocols_vocabulary.md),
[`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md),
[`fractionation_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/fractionation_protocols_vocabulary.md),
[`generate_protocol_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_protocol_id.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`protocol_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_categories_vocabulary.md),
[`protocol_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_id_regex.md),
[`protocol_options_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_options_vocabulary.md),
[`sampling_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/sampling_protocols_vocabulary.md)

## Examples

``` r
head(extraction_protocols_vocabulary(), 5)
#> # A tibble: 5 × 3
#>   Protocol_Type       Short_Name      Long_Name                 
#>   <chr>               <chr>           <chr>                     
#> 1 Extraction Protocol Not relevant    Not relevant              
#> 2 Extraction Protocol Not reported    Not reported              
#> 3 Extraction Protocol None            No extraction             
#> 4 Extraction Protocol Methanol        Methanol extraction       
#> 5 Extraction Protocol Dichloromethane Dichloromethane extraction
```
