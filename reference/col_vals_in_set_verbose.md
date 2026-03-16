# Wrapper for col_vals_in_set with enhanced error reporting

Validates that column values belong to an allowed set, and additionally
emits a warning listing any values not found in the set. Useful for
diagnosing failures during interactive validation workflows.

## Usage

``` r
col_vals_in_set_verbose(x, columns, set, actions, value_name = NULL)
```

## Arguments

- x:

  A data frame or pointblank agent to validate

- columns:

  Column(s) to validate, supplied using tidy-select syntax

- set:

  Character vector of valid values

- actions:

  Action levels for pointblank

- value_name:

  Optional descriptive name for the values being validated, used in the
  warning message (e.g., `"Reference IDs"`). Defaults to the column name
  if not supplied.

## Value

The input `x` with the validation step applied. Any values not in `set`
are reported via a warning before validation runs.

## See also

[`pointblank::col_vals_in_set()`](https://rstudio.github.io/pointblank/reference/col_vals_in_set.html)
