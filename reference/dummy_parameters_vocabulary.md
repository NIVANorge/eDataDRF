# Dummy parameters controlled vocabulary

Returns comprehensive parameter data combining quality parameters and
chemical parameters.

## Usage

``` r
dummy_parameters_vocabulary()
```

## Value

A data frame combining quality and chemical parameter data

## Details

Combines quality parameters with chemical parameters from the ClassyFire
taxonomy. Quality parameters are read from
dummy_quality_parameters.parquet and chemical parameters from
ClassyFire_Taxonomy_2025_02.parquet. The resulting dataset includes
columns for parameter classification, chemical identifiers (InChIKey,
PubChem CID, CAS RN), and measurement types.

Note: Quality parameters are currently "dummy" data as a comprehensive
validated list has not yet been compiled.

Data sources:

extdata/dummy_quality_parameters.parquet

extdata/ClassyFire_Taxonomy_2025_02.parquet

## See also

Other parameter:
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`parameter_types_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_sub_vocabulary.md),
[`parameter_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_vocabulary.md)
