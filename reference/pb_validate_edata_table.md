# Run pointblank validation on an eData table

Applies pointblank validation rules to check data quality and schema
compliance for eData format tables. Can operate in two modes:

- Agent mode (agent = TRUE): Creates an agent for reporting and
  interrogation

- Pipeline mode (agent = FALSE): Returns validated data directly for use
  in pipelines

## Usage

``` r
pb_validate_edata_table(
  data,
  table_name,
  validation_steps,
  agent = TRUE,
  actions = action_levels()
)
```

## Arguments

- data:

  Data frame to validate

- table_name:

  Name of the table being validated (for reporting)

- validation_steps:

  Function that takes a data frame or agent and returns it with
  validation steps added. Should be a function like:
  `function(x) { x |> col_vals_not_null(...) |> ... }`

- agent:

  Logical. If TRUE (default), returns a pointblank agent object. If
  FALSE, returns the validated data with validation failures removed.

- actions:

  Action levels for pointblank agent (only used when agent = TRUE)

## Value

If agent = TRUE, a pointblank agent object containing validation
results. If agent = FALSE, the input data with validation failures
removed.

## Details

Uses
[`pointblank::create_agent()`](https://rstudio.github.io/pointblank/reference/create_agent.html)
to build a validation agent in agent mode, or applies steps directly to
the data in pipeline mode. See also
`vignette("validation", package = "pointblank")` for an overview of the
pointblank validation workflow.

In agent mode, the agent object can be used to:

- Extract validation results with `get_sundered_data()`

- Generate reports with `get_agent_report()`

- Check pass/fail status

In pipeline mode, failed rows are automatically removed from the data.

## See also

Other validation:
[`pb_validate_CREED_data_relevance()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_CREED_data_relevance.md),
[`pb_validate_CREED_data_reliability()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_CREED_data_reliability.md),
[`pb_validate_CREED_scores()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_creed_scores.md),
[`pb_validate_all_edata_tables()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_all_edata_tables.md),
[`pb_validate_biota()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_biota.md),
[`pb_validate_campaign()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_campaign.md),
[`pb_validate_measurements()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_measurements.md),
[`pb_validate_methods()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_methods.md),
[`pb_validate_parameters()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_parameters.md),
[`pb_validate_reference()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_reference.md),
[`pb_validate_samples()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_samples.md),
[`pb_validate_sites()`](https://NIVANorge.github.io/eDataDRF/reference/pb_validate_sites.md)

## Examples

``` r
if (FALSE) { # \dontrun{
my_steps <- function(x) {
  x |> col_vals_not_null(columns = id)
}
pb_validate_edata_table(
  data       = my_data,
  table_name = "MyTable",
  validation_steps = my_steps
)
} # }
```
