# Sampled parameters controlled vocabulary

Returns comprehensive parameter data combining quality and chemical
parameters.

## Usage

``` r
parameters_vocabulary()
```

## Value

A data frame combining quality and chemical parameter options

## Details

Combines quality parameters with chemical parameters from the ClassyFire
taxonomy. Quality parameters are read from quality_parameters.parquet
and chemical parameters from ClassyFire_Taxonomy_2025_02.parquet. The
resulting dataset includes columns for parameter classification,
chemical identifiers (InChIKey, PubChem CID, CAS RN), and measurement
types.

Note: Quality parameters have not yet been comprehensively validated as
we are not aware of any taxonomy to validate them against.

Data sources:

extdata/quality_parameters.parquet

extdata/ClassyFire_Taxonomy_2025_02.parquet

## See also

Other parameter:
[`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`parameter_types_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_sub_vocabulary.md),
[`parameter_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_vocabulary.md)
