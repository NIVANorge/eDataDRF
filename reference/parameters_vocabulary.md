# Data for PARAMETER_NAME, PARAMETER_TYPE, etc. in the Parameters table

Returns comprehensive parameter data combining quality and chemical
parameters.

## Usage

``` r
parameters_vocabulary()
```

## Value

A data frame combining quality and chemical parameter options

## Details

Combines quality parameters with chemical parameters from the
[ClassyFire](http://classyfire.wishartlab.com) chemical taxonomy
(Djoumbou Feunang et al. 2016,
[doi:10.1186/s13321-016-0174-y](https://doi.org/10.1186/s13321-016-0174-y)
, reused non-commercially). Quality parameters are read from
quality_parameters.parquet and chemical parameters from
ClassyFire_Taxonomy_2025_02.parquet. The resulting dataset includes
columns for parameter classification, chemical identifiers (InChIKey,
PubChem CID, CAS RN), and measurement types.

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

## Examples

``` r
head(parameters_vocabulary(), 5)
#> # A tibble: 5 × 9
#>   PARAMETER_TYPE    PARAMETER_NAME   PARAMETER_TYPE_SUB MEASURED_TYPE     CAS_RN
#>   <chr>             <chr>            <chr>              <chr>             <chr> 
#> 1 Quality parameter pH               pH                 Physical paramet… NA    
#> 2 Quality parameter Dissolved oxygen Dissolved oxygen   Concentration     7782-…
#> 3 Quality parameter Temperature      Temperature        Physical paramet… NA    
#> 4 Quality parameter Conductivity     Conductivity       Physical paramet… NA    
#> 5 Quality parameter Salinity         Salinity           Physical paramet… NA    
#> # ℹ 4 more variables: PUBCHEM_CID <int>, INCHIKEY_SD <chr>, ENTERED_BY <chr>,
#> #   PARAMETER_NAME_SUB <chr>
```
