# Initialise parameters tibble

Creates an empty tibble with the standardised column structure for
parameter data.

## Usage

``` r
initialise_parameters_tibble()
```

## Value

A tibble with 0 rows and standardised parameter columns

## Details

Parameters define chemical substances, physical properties, or
biological markers being measured, including classification and chemical
identifiers. The tibble includes the following columns:

PARAMETER_TYPE: Broad classification (Stressor, Quality parameter,
Normalisation, etc.)

PARAMETER_TYPE_SUB: Sub-classification providing more specific
categorisation

MEASURED_TYPE: Type of measurement (Concentration, Dose, Physical
parameter, etc.)

PARAMETER_NAME: Standardised name of the parameter (Primary Key)

PARAMETER_NAME_SUB: Additional specification or variant of the parameter
name

INCHIKEY_SD: InChIKey identifier for chemical substances

PUBCHEM_CID: PubChem Compound Identifier

CAS_RN: Chemical Abstracts Service Registry Number

ENTERED_BY: Person or entity who entered the parameter

PARAMETER_COMMENT: Additional notes about the parameter

## See also

Other initialise_tibble:
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`initialise_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_campaign_tibble.md),
[`initialise_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_compartments_tibble.md),
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`initialise_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_references_tibble.md),
[`initialise_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_samples_tibble.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md)

Other parameter:
[`dummy_parameters_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/dummy_parameters_vocabulary.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`parameter_types_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_sub_vocabulary.md),
[`parameter_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_vocabulary.md)
