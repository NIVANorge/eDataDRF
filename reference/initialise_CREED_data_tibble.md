# Initialise CREED Scores Tibble

Creates an empty tibble with the standardised column structure for CREED
criterion scores. Used by both reliability and relevance modules to
ensure consistent data structure. This isn't a part of the
externally-available table structure, but we want to make sure it's
harmonised locally anyway

## Usage

``` r
initialise_CREED_data_tibble()
```

## Value

A tibble with 0 rows and standardised CREED score columns
