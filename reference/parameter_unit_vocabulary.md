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
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`measured_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_categories_vocabulary.md),
[`measured_flags_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_flags_vocabulary.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`uncertainty_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/uncertainty_types_vocabulary.md)
