# Data for `PARAMETER_NAME`, `PARAMETER_TYPE`, etc. in the Parameters table

Returns comprehensive parameter data combining quality and chemical
parameters.

## Usage

``` r
parameters_vocabulary()
```

## Value

A data frame combining quality and chemical parameter options

## Details

Combines quality parameters with chemical parameters taken from the
National Toxicology Program's NICE (NTP Integrated Chemical Environment)
"Chemical Taxonomies" dataset (v1.1, ICE v4.1.1, Feb. 2025; [ICE dataset
descriptions](https://ice.ntp.niehs.nih.gov/DATASETDESCRIPTION?section=Chemical%20Chemical%20Proper)).
This dataset assigns every substance in DSSTox a structure-based,
automated [ChemOnt/ClassyFire](http://classyfire.wishartlab.com)
classification (Djoumbou Feunang et al. 2016,
[doi:10.1186/s13321-016-0174-y](https://doi.org/10.1186/s13321-016-0174-y)
).

The full NICE dataset (\>1 million substances) is too large to
distribute, so it was filtered by CAS RN to all substances in the EPA
ECOTOX database plus all substances in the Vannmiljo database.
`PARAMETER_TYPE_SUB` is the ClassyFire Superclass. The preparation
script is `data-raw/NICE_ClassyFire_Chemical_Taxonomy_v1-1.R`.

Quality parameters are read from quality_parameters.parquet and chemical
parameters from NICE_ClassyFire_Chemical_Taxonomy_v1-1.parquet. The
resulting dataset includes columns for parameter classification,
chemical identifiers (InChIKey, CAS RN), and measurement types.

Note: Quality parameters have not yet been comprehensively validated as
we are not aware of any taxonomy to validate them against.

Data sources:

extdata/quality_parameters.parquet

extdata/NICE_ClassyFire_Chemical_Taxonomy_v1-1.parquet

## See also

Other parameter:
[`example_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_parameters_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`parameter_types_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_sub_vocabulary.md),
[`parameter_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_vocabulary.md)

## Examples

``` r
head(parameters_vocabulary(), 10)
#> # A tibble: 10 × 9
#>    PARAMETER_TYPE    PARAMETER_NAME      PARAMETER_TYPE_SUB MEASURED_TYPE CAS_RN
#>    <chr>             <chr>               <chr>              <chr>         <chr> 
#>  1 Quality parameter pH                  pH                 Physical par… NA    
#>  2 Quality parameter Dissolved oxygen    Dissolved oxygen   Concentration 7782-…
#>  3 Quality parameter Temperature         Temperature        Physical par… NA    
#>  4 Quality parameter Conductivity        Conductivity       Physical par… NA    
#>  5 Quality parameter Salinity            Salinity           Physical par… NA    
#>  6 Quality parameter Turbidity           Turbidity          Physical par… NA    
#>  7 Quality parameter Total organic carb… Total organic car… Concentration NA    
#>  8 Quality parameter Alkalinity          Other              Concentration NA    
#>  9 Quality parameter Hardness            Other              Concentration NA    
#> 10 Quality parameter Chlorophyll a       Other              Concentration 479-6…
#> # ℹ 4 more variables: PUBCHEM_CID <int>, INCHIKEY_SD <chr>, ENTERED_BY <chr>,
#> #   PARAMETER_NAME_SUB <chr>
```
