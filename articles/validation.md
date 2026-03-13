# eData validation

``` r
library(eDataDRF)
library(pointblank)
library(gt)
```

The [pointblank](https://rstudio.github.io/pointblank/) package for R
provides robust, efficient validation features for data, allowing us to
quickly check that our data conforms to the expected format. Although
used of controlled vocabulary and the eData app allow us to constrain
user-entered data, it is more practical to add an additional level of
validation. This programmatic validation layer can be re-used wherever
needed; this is particularly valuable when data may need to be
transformed as part of the analysis pathway.

Below we demonstrate the use of the validation functions for each table
type. Note: The Styling of included tables is currently rather broken,
making them difficult to interpret. I will fix this when possible, but
as it’s not a functional issue I haven’t prioritised it.

Todo:

- Add and harmonise example data
- Test example data runs without error
- Test validation functions against example data
- One-line explanation of agent vs pipeline mode

## Campaign data validation

Typically when campaign data are generated/extracted for a data object
the resulting table will only have one row. However, in downstream
operations across multiple data objects, each campaign must have a
unique identifier; this is checked as part of the validation below.

``` r
example_campaign_tibble() |>
  pb_validate_campaign()
```

[TABLE]

## References data validation

``` r
example_references_tibble() |>
  pb_validate_reference()
```

[TABLE]

## Sites data validation

``` r
example_sites_tibble() |>
  pb_validate_sites()
```

[TABLE]

## Parameters data validation

``` r
example_parameters_tibble() |>
  pb_validate_parameters()
```

[TABLE]

## Compartments data validation

## TODO: Might as well add this one

``` r
# example_compartments_tibble() |>
#   pb_validate_compartments()
```

## Samples data validation

``` r
example_samples_tibble() |>
  pb_validate_samples()
```

[TABLE]

## Biota data validation

``` r
example_biota_tibble() |>
  pb_validate_biota()
```

[TABLE]

## Methods data validation

``` r
example_methods_tibble() |>
  pb_validate_methods()
```

[TABLE]

## Measurements data validation

``` r
example_measurements_tibble() |>
  pb_validate_measurements()
```

[TABLE]

## CREED data validation

## TODO: Again, might as well

``` r
# example_CREED_data_tibble() |>
#   pb_validate_CREED_data()
```

## CREED scores data validation

``` r
# example_CREED_scores_tibble() |>
#   pb_validate_CREED_scores()
```
