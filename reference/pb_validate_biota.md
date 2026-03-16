# Run pointblank validation on a Biota table

Applies pointblank validation rules to check data quality and schema
compliance for an eData Biota table. Checks that core identifier and
biota-specific fields are non-null, environmental compartments indicate
biota, and that species group, tissue, lifestage, and gender values are
within their controlled vocabularies.

## Usage

``` r
pb_validate_biota(data, actions = action_levels(), agent = TRUE)
```

## Arguments

- data:

  Data frame containing Biota table data to validate

- actions:

  Action levels for pointblank agent (only used when agent = TRUE)

- agent:

  Logical. If TRUE (default), returns a pointblank agent object. If
  FALSE, returns the validated data with validation failures removed.

## Value

If agent = TRUE, a pointblank agent object containing validation
results. If agent = FALSE, the input data with validation failures
removed.

## See also

[`pb_validate_edata_table()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_edata_table.md)
for the underlying validation framework,
[`pb_validate_all_edata_tables()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_all_edata_tables.md)
to validate all tables at once.
