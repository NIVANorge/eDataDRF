# Extraction protocols controlled vocabulary

Returns extraction protocol options with short and long names.

## Usage

``` r
extraction_protocols_vocabulary()
```

## Value

A tibble with Protocol_Type, Short_Name, and Long_Name columns

## Details

Provides standardised extraction method classifications as a tibble with
three columns:

Protocol_Type: Always "Extraction Protocol"

Short_Name: Abbreviated protocol name (e.g., "Methanol", "SPE Isolute
Env+", "QuEChERS")

Long_Name: Full descriptive name (e.g., "Methanol extraction", "Solid
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
[`fractionation_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/fractionation_protocols_vocabulary.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`protocol_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_categories_vocabulary.md),
[`protocol_options_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_options_vocabulary.md),
[`sampling_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/sampling_protocols_vocabulary.md)
