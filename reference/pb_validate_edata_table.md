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

In agent mode, the agent object can be used to:

- Extract validation results with `get_sundered_data()`

- Generate reports with `get_agent_report()`

- Check pass/fail status

In pipeline mode, failed rows are automatically removed from the data.
