# Generate compact Sample ID (`SiteCode-ParamAbbrev-CompartmentAbbrev-Date-R-SubsampleAbbrev`) for SAMPLE_ID in Samples table

Generates a standardised sample identifier by combining the site code,
abbreviated parameter name, abbreviated environmental sub-compartment,
sampling date, and subsample label. The function is fully vectorised and
can handle multiple samples simultaneously.

## Usage

``` r
generate_sample_id_with_components(
  site_code,
  parameter_name,
  environ_compartment,
  environ_compartment_sub,
  date,
  subsample = 1
)
```

## Arguments

- site_code:

  Character vector. The site code (e.g. `"SITE-001"`).

- parameter_name:

  Character vector. The parameter name. Will be abbreviated to the first
  8 alphanumeric characters.

- environ_compartment:

  Character vector. The environmental compartment (e.g. `"Aquatic"`).
  Not used in the ID directly but retained as a parameter for future use
  and documentation purposes.

- environ_compartment_sub:

  Character vector. The environmental sub-compartment (e.g.
  `"Aquatic Sediment"`). Will be abbreviated to the first 12
  alphanumeric characters.

- date:

  Character or Date vector. The sampling date (e.g. `"2023-03-15"`).
  Used as-is in the ID.

- subsample:

  Character or numeric vector. The subsample label. Will be abbreviated
  to the first 3 words in title case. Defaults to `1`.

## Value

Character vector of sample IDs with format:
`SiteCode-ParamAbbrev-CompartmentAbbrev-Date-R-SubsampleAbbrev`

## See also

Other generate_id:
[`abbreviate_string()`](https://NIVANorge.github.io/eDataDRF/reference/abbreviate_string.md),
[`generate_protocol_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_protocol_id.md),
[`generate_reference_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_reference_id.md),
[`protocol_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_id_regex.md),
[`sample_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/sample_id_regex.md)

Other sample:
[`example_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_samples_tibble.md),
[`initialise_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_samples_tibble.md),
[`sample_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/sample_id_regex.md)

## Examples

``` r
# Single sample
generate_sample_id_with_components(
  site_code = "SITE-001",
  parameter_name = "Copper",
  environ_compartment = "Aquatic",
  environ_compartment_sub = "Aquatic Sediment",
  date = "2023-03-15",
  subsample = "1"
)
#> SITE-001-Copper-AquaticSedim-2023-03-15-R-1

# Vectorised use
generate_sample_id_with_components(
  site_code = c("SITE-001", "SITE-002"),
  parameter_name = c("Copper", "Lead"),
  environ_compartment = c("Aquatic", "Aquatic"),
  environ_compartment_sub = c("Aquatic Sediment", "Aquatic Sediment"),
  date = c("2023-03-15", "2023-04-20"),
  subsample = "1"
)
#> SITE-001-Copper-AquaticSedim-2023-03-15-R-1
#> SITE-002-Lead-AquaticSedim-2023-04-20-R-1
```
