# Wrapper for col_vals_in_set with enhanced error reporting

Wrapper for col_vals_in_set with enhanced error reporting

## Usage

``` r
col_vals_in_set_verbose(x, columns, set, actions, value_name = NULL)
```

## Arguments

- x:

  A data table

- columns:

  Column(s) to validate

- set:

  Valid set of values

- actions:

  Action levels for pointblank

- value_name:

  Optional name to describe what the values represent (e.g., "Reference
  IDs")

## Value

The validated data table
