# Run pointblank validation on a CREED Scores table

Applies pointblank validation rules to check data quality and schema
compliance for an eData CREED Scores table. Checks that reference IDs
match the format produced by
[`generate_reference_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_reference_id.md),
are non-null, are not the placeholder value, and that reliability and
relevance classification fields contain valid values.

## Usage

``` r
pb_validate_creed_scores(data, actions = action_levels(), agent = TRUE)
```

## Arguments

- data:

  Data frame containing CREED Scores table data to validate

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
