# campaign_data

## Introduction

**Campaign data** is intended to track social and institutional factors
behind a sample that are not otherwise captured by citations/references.
It’s a mess, and includes a bunch of fields that it probably shouldn’t.

``` r
library(eDataDRF)
```

``` r
initialise_campaign_tibble()
#> # A tibble: 0 × 8
#> # ℹ 8 variables: CAMPAIGN_NAME_SHORT <chr>, CAMPAIGN_NAME <chr>,
#> #   CAMPAIGN_START_DATE <date>, CAMPAIGN_END_DATE <date>, ORGANISATION <chr>,
#> #   ENTERED_BY <chr>, ENTERED_DATE <date>, CAMPAIGN_COMMENT <chr>
```

### Variables

## Campaign Name Short - String, free, mandatory

`CAMPAIGN_NAME_SHORT`

## Campaign Name - String, free, mandatory

`CAMPAIGN_NAME`

## Campaign Start Date - Date, free, mandatory

`CAMPAIGN_START_DATE`

## Campaign End Date - Date, free, optional

`CAMPAIGN_END_DATE`

## Organisation - String, free, mandatory

`ORGANISATION`

## Entered By - String, free, mandatory

`ENTERED_BY`

## Entered Date - Date, free, mandatory

`ENTERED_DATE`

## Campaign Comment - String, free, optional

`CAMPAIGN_COMMENT`
