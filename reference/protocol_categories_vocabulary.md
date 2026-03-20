# Controlled vocabulary for `PROTOCOL_CATEGORY` column, Methods table

Returns controlled vocabulary options for protocol type classifications.

## Usage

``` r
protocol_categories_vocabulary()
```

## Value

A character vector of protocol category options

## Details

Provides the four main protocol category classifications used in the
methods table. Options include:

Sampling Protocol

Fractionation Protocol

Extraction Protocol

Analytical Protocol

## See also

Other method:
[`analytical_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/analytical_protocols_vocabulary.md),
[`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md),
[`extraction_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/extraction_protocols_vocabulary.md),
[`fractionation_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/fractionation_protocols_vocabulary.md),
[`generate_protocol_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_protocol_id.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`protocol_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_id_regex.md),
[`protocol_options_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_options_vocabulary.md),
[`sampling_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/sampling_protocols_vocabulary.md)

## Examples

``` r
protocol_categories_vocabulary()
#> [1] "Sampling Protocol"      "Fractionation Protocol" "Extraction Protocol"   
#> [4] "Analytical Protocol"   
```
