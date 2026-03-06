# Validate all eData tables at once

Validate all eData tables at once

## Usage

``` r
pb_validate_all_edata_tables(
  campaign,
  reference,
  parameters,
  sites,
  samples = NULL,
  biota = NULL,
  measurements,
  methods = NULL,
  creed_scores = NULL,
  actions = action_levels(),
  agent = TRUE,
  northern_hemisphere = FALSE
)
```

## Arguments

- campaign:

  Campaign table

- reference:

  Reference table

- parameters:

  Parameters table

- sites:

  Sites table

- samples:

  Samples table (optional)

- biota:

  Biota table (optional)

- measurements:

  Measurements table

- methods:

  Methods table (optional)

- creed_scores:

  CREED Scores table (optional)

- actions:

  Action levels for pointblank agents (only used when agent = TRUE)

- agent:

  Logical. If TRUE (default), returns a list of pointblank agent
  objects. If FALSE, returns a list of validated data frames with
  failures removed.

- northern_hemisphere:

  Logical. If TRUE, check that site coordinates are in northern
  hemisphere.

## Value

If agent = TRUE, a named list of pointblank agent objects. If agent =
FALSE, a named list of validated data frames.
