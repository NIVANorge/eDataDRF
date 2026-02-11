# Methods table

``` r
library(eDataDRF)

initialise_methods_tibble()
#> # A tibble: 0 × 5
#> # ℹ 5 variables: PROTOCOL_ID <chr>, CAMPAIGN_NAME <chr>,
#> #   PROTOCOL_CATEGORY <chr>, PROTOCOL_NAME <chr>, PROTOCOL_COMMENT <chr>
```

Really we should be using the Chemical Methods ontology here, but
implementing it now will require a fair amount of structural redesign,
so for now it’s firmly in the todo category.

The Methods table is a metadata table that is transformed before being
linked to the \[Measurements table\] {Measurements table}.
