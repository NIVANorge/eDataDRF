# Parameter units and conversion factors vocabulary

Returns unit definitions and SI conversion factors for environmental
measurements.

## Usage

``` r
parameter_unit_vocabulary(select_column = NULL)
```

## Arguments

- select_column:

  Optional column name to extract: "MEASURED_UNIT", "BASE_SI_UNIT",
  "CONVERSION_FACTOR", or "UNIT_COMMENTS"

## Value

A dataframe (if select_column is NULL) or a character vector (if column
specified)

## Details

Reads unit conversion data from unit_conversion_factors.csv containing
standardised units for ecotoxicological and environmental measurements.
The complete dataset includes columns:

MEASURED_UNIT: Unit as recorded in measurements

BASE_SI_UNIT: Corresponding SI base unit

CONVERSION_FACTOR: Numeric factor to convert to SI units

UNIT_COMMENTS: Additional notes about unit usage or conversion

Data source: extdata/unit_conversion_factors.csv

## See also

Other measurement:
[`example_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_measurements_tibble.md),
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`measured_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_categories_vocabulary.md),
[`measured_flag_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_flag_vocabulary.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`uncertainty_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/uncertainty_types_vocabulary.md)

## Examples

``` r
head(parameter_unit_vocabulary(), 5)
#> # A tibble: 5 × 4
#>   MEASURED_UNIT BASE_SI_UNIT CONVERSION_FACTOR UNIT_COMMENTS      
#>   <chr>         <chr>        <chr>             <chr>              
#> 1 mg/L          kg/m³        1e-3              mass concentration 
#> 2 μg/L          kg/m³        1e-6              mass concentration 
#> 3 ng/L          kg/m³        1e-9              mass concentration 
#> 4 pg/L          kg/m³        1e-12             mass concentration 
#> 5 mol/L         mol/m³       1000              molar concentration
parameter_unit_vocabulary(select_column = "MEASURED_UNIT") |> head(5)
#> [1] "mg/L"  "μg/L"  "ng/L"  "pg/L"  "mol/L"
```
