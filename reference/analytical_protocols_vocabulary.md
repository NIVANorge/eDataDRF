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
[`extraction_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/extraction_protocols_vocabulary.md),
[`fractionation_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/fractionation_protocols_vocabulary.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`protocol_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_categories_vocabulary.md),
[`protocol_options_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_options_vocabulary.md),
[`sampling_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/sampling_protocols_vocabulary.md)
