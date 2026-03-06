# CREED usability scores

## Introduction

The criterion scores assigned for each criterion during the [CREED
assessment](https://NIVANorge.github.io/eDataDRF/articles/CREED_data.md)
are used to calculate an overall useability score for both relevant and
reliability at the gold and silver level. Silver scores are calculated
based on the highest (worst) score for all required questions, and gold
for all recommended questions. Data source usability scores are, from
high to low:

### Usability Scores

`Gold` - `Relevant/reliable without restriction`

`Gold` - `Relevant/reliable with restriction`

`Silver` - `Relevant/reliable with restriction`

`Silver` - `Relevant/reliable without restriction`

`Gold` or `Silver` - `Not usable`

This table is automatically filled out by the [eData
app](https://github.com/NIVANorge/STOPeData) during the CREED assessment
process.

``` r
library(eDataDRF)
```

``` r
initialise_CREED_scores_tibble()
#> # A tibble: 0 × 5
#> # ℹ 5 variables: REFERENCE_ID <chr>, SILVER_RELIABILITY <chr>,
#> #   SILVER_RELEVANCE <chr>, GOLD_RELIABILITY <chr>, GOLD_RELEVANCE <chr>
```

## Variables

### Reference ID

`REFERENCE_ID` - *string, free, mandatory*

Identifier for data source, foreign key referencing [reference
id](https://NIVANorge.github.io/eDataDRF/articles/references_data.html#reference-id).

### Silver Reliability

`SILVER_RELIABILITY` - *numeric, free, mandatory*

Silver reliability score. See [Usability Scores](#usability-scores) for
valid levels.

### Silver Relevance

`SILVER_RELEVANCE` - *string, free, mandatory*

Silver relevance score. See [Usability Scores](#usability-scores) for
valid levels.

### Gold Reliability

`GOLD_RELIABILITY` - *string, free, mandatory*

Gold reliability score. See [Usability Scores](#usability-scores) for
valid levels.

### Gold Relevance

`GOLD_RELEVANCE` - *string, free, mandatory*

Gold relevance score. See [Usability Scores](#usability-scores) for
valid levels.
