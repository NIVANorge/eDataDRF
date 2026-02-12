# Initialise measurements tibble

Creates an empty tibble with the standardised column structure for
measurements data.

## Usage

``` r
initialise_measurements_tibble()
```

## Value

A tibble with 0 rows and standardised measurement columns

## Details

Measurements represent quantitative observations combining sample,
compartment, and biota information with analytical results and quality
metrics. The tibble includes the following columns:

SITE_CODE: Code identifying the sampling location

PARAMETER_NAME: Name of the measured parameter (Foreign key)

SAMPLING_DATE: Date of sample collection

ENVIRON_COMPARTMENT_SUB: Specific environmental sub-compartment

SUBSAMPLE: Subsample identifier

MEASURED_FLAG: Quality flag for the measurement (e.g., \< LOQ, \< LOD)

MEASURED_VALUE: Numeric value of the measurement

UNCERTAINTY_TYPE: Type of uncertainty or variability metric

UNCERTAINTY_UPPER: Upper bound of uncertainty

UNCERTAINTY_LOWER: Lower bound of uncertainty

MEASURED_UNIT: Unit of measurement

MEASURED_N: Number of replicates or observations

LOQ_VALUE: Limit of quantification value

LOQ_UNIT: Unit for limit of quantification

LOD_VALUE: Limit of detection value

LOD_UNIT: Unit for limit of detection

SAMPLING_PROTOCOL: Protocol used for sample collection (Foreign key)

EXTRACTION_PROTOCOL: Protocol used for sample extraction (Foreign key)

FRACTIONATION_PROTOCOL: Protocol used for sample fractionation (Foreign
key)

ANALYTICAL_PROTOCOL: Protocol used for analysis (Foreign key)

REFERENCE_ID: Reference identifier for data source (Foreign key)

SAMPLE_ID: Unique sample identifier

CAMPAIGN_NAME_SHORT: Short name of the associated campaign

ENVIRON_COMPARTMENT: Broad environmental compartment

PARAMETER_TYPE: Classification of the parameter

MEASURED_TYPE: Type of measurement

MEASUREMENT_COMMENT: Additional notes about the measurement

## See also

Other initialise_tibble:
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`initialise_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_campaign_tibble.md),
[`initialise_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_compartments_tibble.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`initialise_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_references_tibble.md),
[`initialise_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_samples_tibble.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md)

Other measurement:
[`measured_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_categories_vocabulary.md),
[`measured_flags_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_flags_vocabulary.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`parameter_unit_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_unit_vocabulary.md),
[`uncertainty_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/uncertainty_types_vocabulary.md)
