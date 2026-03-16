# Run pointblank validation on a Reference table

Applies pointblank validation rules to check data quality and schema
compliance for an eData Reference table. Checks that reference IDs match
the expected format, controlled vocabulary fields are valid, required
fields are non-null, publication year and access date fall within valid
ranges, and conditionally mandatory fields are present based on
reference type.

## Usage

``` r
pb_validate_reference(data, actions = action_levels(), agent = TRUE)
```

## Arguments

- data:

  Data frame containing Reference table data to validate

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
