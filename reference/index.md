# Package index

## Initialise tibbles

Create empty versions of the format’s tables as R tibble objects

- [`initialise_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_campaign_tibble.md)
  : Initialise an 8x0 tibble for storing organisational and date
  metadata
- [`initialise_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_references_tibble.md)
  : Initialise an 18x0 tibble for storing metadata on scientific
  literature
- [`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md)
  : Initialise an 13x0 tibble for storing geographical metadata
- [`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md)
  : Initialise an 10x0 tibble for storing metadata on sampled
  parameters: stressors, quality, etc.
- [`initialise_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_compartments_tibble.md)
  : Initialise an 3x0 tibble for storing metadata on sampled
  environmental compartment
- [`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md)
  : Initialise an 5x0 tibble for storing metadata on scientific/sampling
  methods and protocols
- [`initialise_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_samples_tibble.md)
  : Initialise an 11x0 tibble for storing combinations of sites, dates,
  parameters, and compartments sampled
- [`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md)
  : Initialise an 14x0 tibble for storing biota metadata
- [`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md)
  : Initialise an 26x0 tibble for storing measurement data
- [`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md)
  : Initialise an 6x0 tibble for storing CREED assessment data
- [`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md)
  : Initialise an 5x0 tibble for storing a data source's overall CREED
  score

## Controlled vocabulary

Vectors (and sometimes tibbles) of controlled vocabulary

- [`CREED_choices_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/CREED_choices_vocabulary.md)
  : Controlled vocabulary for CREED scores, CREED table

- [`altitude_units_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/altitude_units_vocabulary.md)
  :

  Controlled vocabulary for the `ALTITUDE_UNIT` column, Sites table

- [`analytical_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/analytical_protocols_vocabulary.md)
  :

  Controlled vocabulary for `PROTOCOL_TYPE` and `PROTOCOL_NAME` columns
  (analytical), Methods table

- [`areas_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/areas_vocabulary.md)
  : Ocean controlled vocabulary (wrapper for ocean_vocabulary())

- [`coordinate_systems_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/coordinate_systems_vocabulary.md)
  :

  Controlled vocabulary for the `SITE_COORDINATE_SYSTEM` column, Sites
  table

- [`countries_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/countries_vocabulary.md)
  :

  Controlled vocabulary for the `COUNTRY_ISO` column, Sites table

- [`data_source_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/data_source_vocabulary.md)
  : Controlled vocabulary for the DATA_SOURCE column, References table

- [`environ_compartments_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/environ_compartments_sub_vocabulary.md)
  :

  Controlled vocabulary for the `ENVIRON_COMPARTMENT` and
  `ENVIRON_COMPARTMENT_SUB` columns, Compartments table

- [`environ_compartments_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/environ_compartments_vocabulary.md)
  :

  Controlled vocabulary for the `ENVIRON_COMPARTMENT` column,
  Compartments table

- [`extraction_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/extraction_protocols_vocabulary.md)
  :

  Controlled vocabulary for `PROTOCOL_TYPE` and `PROTOCOL_NAME` columns
  (extraction), Methods table

- [`fractionation_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/fractionation_protocols_vocabulary.md)
  :

  Controlled vocabulary for `PROTOCOL_TYPE` and `PROTOCOL_NAME` columns
  (fractionation), Methods table

- [`gender_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/gender_vocabulary.md)
  :

  Controlled vocabulary for the `SAMPLE_SPECIES_GENDER` column, Biota
  table

- [`geographic_features_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/geographic_features_sub_vocabulary.md)
  :

  Controlled vocabulary for the `SITE_GEOGRAPHIC_FEATURE_SUB` column,
  Sites table

- [`geographic_features_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/geographic_features_vocabulary.md)
  :

  Controlled vocabulary for the `SITE_GEOGRAPHIC_FEATURE` column, Sites
  table

- [`lifestage_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/lifestage_vocabulary.md)
  :

  Controlled vocabulary for the `SAMPLE_SPECIES_LIFESTAGE` column, Biota
  table

- [`measured_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_categories_vocabulary.md)
  :

  Controlled vocabulary for the `MEASURED_CATEGORY` column, Compartments
  table

- [`measured_flag_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_flag_vocabulary.md)
  :

  Controlled vocabulary for `MEASURED_FLAG`, Measurements table

- [`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md)
  :

  Controlled vocabulary for the `MEASURED_TYPE` column, Parameters table

- [`ocean_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/ocean_vocabulary.md)
  :

  Controlled vocabulary for the `OCEAN_IHO` column, Sites table

- [`parameter_types_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_sub_vocabulary.md)
  :

  Controlled vocabulary for the `PARAMETER_TYPES_SUB` column, Parameters
  table

- [`parameter_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_vocabulary.md)
  :

  Controlled vocabulary for the `PARAMETER_TYPES` column, Parameters
  table

- [`parameter_unit_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_unit_vocabulary.md)
  :

  Controlled vocabulary for `MEASURED_UNIT`, `LOQ_UNIT`, and `LOD_UNIT`,
  with conversion factors and base units

- [`parameters_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameters_vocabulary.md)
  :

  Data for `PARAMETER_NAME`, `PARAMETER_TYPE`, etc. in the Parameters
  table

- [`protocol_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_categories_vocabulary.md)
  :

  Controlled vocabulary for `PROTOCOL_CATEGORY` column, Methods table

- [`protocol_options_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_options_vocabulary.md)
  :

  Controlled vocabulary for `PROTOCOL_TYPE` and `PROTOCOL_NAME` columns
  (all), Methods table

- [`reference_type_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/reference_type_vocabulary.md)
  :

  Controlled vocabulary for the `REFERENCE_TYPE` column, References
  table

- [`sampling_protocols_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/sampling_protocols_vocabulary.md)
  :

  Controlled vocabulary for `PROTOCOL_TYPE` and `PROTOCOL_NAME` columns
  (sampling), Methods table

- [`species_groups_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_groups_vocabulary.md)
  :

  Controlled vocabulary for the `SPECIES_GROUP` column, Biota table

- [`species_names_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_names_vocabulary.md)
  :

  Controlled vocabulary for the `SPECIES_NAME` column, Biota table

- [`tissue_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/tissue_types_vocabulary.md)
  :

  Controlled vocabulary for the `SAMPLE_TISSUE` column, Biota table

- [`uncertainty_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/uncertainty_types_vocabulary.md)
  :

  Controlled vocabulary for the `UNCERTAINTY_TYPE` column, Measurements
  table

## Generate IDs

Generate ID strings based on abbreviated titles, plus regex to check

- [`abbreviate_string()`](https://NIVANorge.github.io/eDataDRF/reference/abbreviate_string.md)
  : Generic function to abbreviate string to first n words with case
  formatting

- [`generate_reference_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_reference_id.md)
  :

  Generate compact reference ID (YYYYLNameFirstThreeWords) for
  `REFERENCE_ID` in References table

- [`generate_protocol_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_protocol_id.md)
  :

  Generate a semi-unique string ID for a protocol (`PROTOCOL_ID`) based
  on its type, name, the campaign name, and a sequence number; used as a
  key between Methods and Measurements table.

- [`generate_sample_id_with_components()`](https://NIVANorge.github.io/eDataDRF/reference/generate_sample_id_with_components.md)
  :

  Generate compact Sample ID
  (`SiteCode-ParamAbbrev-CompartmentAbbrev-Date-R-SubsampleAbbrev`) for
  `SAMPLE_ID` in Samples table

- [`sample_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/sample_id_regex.md)
  :

  Regular expression to check
  [`generate_sample_id_with_components()`](https://NIVANorge.github.io/eDataDRF/reference/generate_sample_id_with_components.md)
  protocol IDs for Samples table

- [`protocol_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_id_regex.md)
  :

  Regular expression to check
  [`generate_protocol_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_protocol_id.md)
  protocol IDs for Methods table

## Export

Export tables as zipped CSV files

- [`get_dataset_display_name()`](https://NIVANorge.github.io/eDataDRF/reference/get_dataset_display_name.md)
  : Get Dataset Display Name
- [`export_campaign_zip()`](https://NIVANorge.github.io/eDataDRF/reference/export_campaign_zip.md)
  : Export Multiple Datasets as ZIP of CSV Files

## Example data

Functions to generate example data

- [`example_CREED_relevance_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_relevance_tibble.md)
  : Create Example CREED Relevance Tibble
- [`example_CREED_reliability_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_reliability_tibble.md)
  : Create Example CREED Reliability Tibble
- [`example_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_CREED_scores_tibble.md)
  : Create Example CREED Scores Tibble
- [`example_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_biota_tibble.md)
  : Create Example Biota Tibble
- [`example_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_campaign_tibble.md)
  : Create Example Campaign Tibble
- [`example_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_compartments_tibble.md)
  : Create Example Compartments Tibble
- [`example_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_measurements_tibble.md)
  : Create Example Measurements Tibble
- [`example_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_methods_tibble.md)
  : Create Example Methods Tibble
- [`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md)
  : Create Example Parameters Tibble
- [`example_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_references_tibble.md)
  : Create Example References Tibble
- [`example_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_samples_tibble.md)
  : Create Example Samples Tibble
- [`example_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_sites_tibble.md)
  : Create Example Sites Tibble
- [`CREED_tibble_to_mock_input()`](https://NIVANorge.github.io/eDataDRF/reference/creed_tibble_to_mock_input.md)
  : Convert CREED Tibble to Mock Input List

## Validation

Functions using {pointblank} to validate data

- [`pb_validate_CREED_data_relevance()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_CREED_data_relevance.md)
  : Run pointblank validation on a CREED Relevance data table
- [`pb_validate_CREED_data_reliability()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_CREED_data_reliability.md)
  : Run pointblank validation on a CREED Reliability data table
- [`pb_validate_all_edata_tables()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_all_edata_tables.md)
  : Validate all eData tables at once
- [`pb_validate_biota()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_biota.md)
  : Run pointblank validation on a Biota table
- [`pb_validate_campaign()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_campaign.md)
  : Run pointblank validation on a Campaign table
- [`pb_validate_CREED_scores()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_creed_scores.md)
  : Run pointblank validation on a CREED Scores table
- [`pb_validate_edata_table()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_edata_table.md)
  : Generic pointblank validation helper for eData tables
- [`pb_validate_measurements()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_measurements.md)
  : Run pointblank validation on a Measurements table
- [`pb_validate_methods()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_methods.md)
  : Run pointblank validation on a Methods table
- [`pb_validate_parameters()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_parameters.md)
  : Run pointblank validation on a Parameters table
- [`pb_validate_reference()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_reference.md)
  : Run pointblank validation on a Reference table
- [`pb_validate_samples()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_samples.md)
  : Run pointblank validation on a Samples table
- [`pb_validate_sites()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_sites.md)
  : Run pointblank validation on a Sites table
