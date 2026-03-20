# Generate a semi-unique string ID for a protocol (`PROTOCOL_ID`) based on its type, name, the campaign name, and a sequence number; used as a key between Methods and Measurements table.

Generates a standardised protocol identifier based on protocol type,
name, sequence number, and campaign. The function is fully vectorised
and can handle multiple protocols simultaneously.

## Usage

``` r
generate_protocol_id(
  protocol_type,
  protocol_name,
  sequence_number = 1,
  campaign_name = ""
)
```

## Arguments

- protocol_type:

  Character vector. The category of protocol (e.g., "Sampling Protocol",
  "Analytical Protocol"). Must match one of the predefined categories or
  will default to "X".

- protocol_name:

  Character vector. The specific name/method within the protocol
  category. Will be abbreviated and cleaned for ID generation.

- sequence_number:

  Numeric vector. Sequential number for protocols within the same
  category. Defaults to 1. Will be zero-padded to 2 digits.

- campaign_name:

  Character vector. Name of the campaign/study. Will be abbreviated to
  first 10 alphanumeric characters. Defaults to "".

## Value

Character vector of protocol IDs with format:
`TypeCodeSequenceNumber_AbbreviatedName_CampaignAbbrev`

Where:

- TypeCode: S (Sampling), F (Fractionation), E (Extraction), A
  (Analytical), X (Unknown)

- SequenceNumber: Zero-padded 2-digit number

- AbbreviatedName: Up to 15 alphanumeric characters (optional)

- CampaignAbbrev: Up to 10 alphanumeric characters (optional)

## Details

Edge cases:

- NULL or empty values result in appropriate defaults

- Invalid protocol types default to "X"

- Names are cleaned of special characters and spaces

- Empty components are omitted from the final ID

## See also

Other generate_id:
[`abbreviate_string()`](https://NIVANorge.github.io/eDataDRF/reference/abbreviate_string.md),
[`generate_reference_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_reference_id.md),
[`generate_sample_id_with_components()`](https://NIVANorge.github.io/eDataDRF/reference/generate_sample_id_with_components.md),
[`protocol_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_id_regex.md),
[`sample_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/sample_id_regex.md)

Other method:
[`analytical_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/analytical_protocols_vocabulary.md),
[`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md),
[`extraction_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/extraction_protocols_vocabulary.md),
[`fractionation_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/fractionation_protocols_vocabulary.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`protocol_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_categories_vocabulary.md),
[`protocol_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_id_regex.md),
[`protocol_options_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_options_vocabulary.md),
[`sampling_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/sampling_protocols_vocabulary.md)

## Examples

``` r
# Single protocol
generate_protocol_id("Sampling Protocol", "Water Sample", 1, "MyStudy")
#> [1] "S01_WaterSample_MyStudy"
# Returns: "S01_WaterSample_MyStudy"

# Multiple protocols (vectorised)
types <- c("Sampling Protocol", "Analytical Protocol")
names <- c("Water Sample", "LC-MS Analysis")
sequences <- c(1, 2)
generate_protocol_id(types, names, sequences, "Study2024")
#> [1] "S01_WaterSample_Study2024"  "A02_LCMSAnalysis_Study2024"
# Returns: c("S01_WaterSample_Study2024", "A02_LCMSAnalysis_Study2024")
```
