# Run pointblank validation on a Sites table

Applies pointblank validation rules to check data quality and schema
compliance for an eData Sites table. Checks that site codes and names
are non-null and unique, geographic feature and country fields are
within their controlled vocabularies, coordinates are within valid
ranges, and required metadata fields are present.

## Usage

``` r
pb_validate_sites(
  data,
  actions = action_levels(),
  agent = TRUE,
  northern_hemisphere = FALSE
)
```

## Arguments

- data:

  Data frame containing Sites table data to validate

- actions:

  Action levels for pointblank agent (only used when agent = TRUE)

- agent:

  Logical. If TRUE (default), returns a pointblank agent object. If
  FALSE, returns the validated data with validation failures removed.

- northern_hemisphere:

  Logical. If TRUE, constrains latitude validation to northern
  hemisphere (0-90). Default is FALSE (allows -90 to 90).

## Value

If agent = TRUE, a pointblank agent object containing validation
results. If agent = FALSE, the input data with validation failures
removed.

## See also

[`pb_validate_edata_table()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_edata_table.md)
for the underlying validation framework,
[`pb_validate_all_edata_tables()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_all_edata_tables.md)
to validate all tables at once.
