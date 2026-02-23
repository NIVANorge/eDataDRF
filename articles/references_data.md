# references_data

## Introduction

``` r
library(eDataDRF)
```

``` r
initialise_references_tibble()
#> # A tibble: 0 × 18
#> # ℹ 18 variables: REFERENCE_ID <chr>, REFERENCE_TYPE <chr>, DATA_SOURCE <chr>,
#> #   AUTHOR <chr>, TITLE <chr>, YEAR <int>, ACCESS_DATE <date>,
#> #   PERIODICAL_JOURNAL <chr>, VOLUME <int>, ISSUE <int>, PUBLISHER <chr>,
#> #   INSTITUTION <chr>, DOI <chr>, URL <chr>, ISBN_ISSN <chr>, EDITION <chr>,
#> #   DOCUMENT_NUMBER <chr>, REF_COMMENT <chr>

reference_character_limits()
#> $DOCUMENT_NUMBER
#> [1] 200
#> 
#> $DOI
#> [1] 200
#> 
#> $EDITION
#> [1] 200
#> 
#> $INSTITUTION
#> [1] 200
#> 
#> $ISBN_ISSN
#> [1] 200
#> 
#> $PERIODICAL_JOURNAL
#> [1] 200
#> 
#> $PUBLISHER
#> [1] 200
#> 
#> $REF_COMMENT
#> [1] 1000
#> 
#> $URL
#> [1] 200
```

### Variables

## Reference ID - String, free, mandatory

`REFERENCE_ID`

## Reference Type - String, free, mandatory

`REFERENCE_TYPE`

## Data Source - String, free, mandatory

`DATA_SOURCE`

## Author - String, free, mandatory

`AUTHOR`

## Title - String, free, mandatory

`TITLE`

## Year - Numeric, free, mandatory

`YEAR`

## Access Date - Date, free, mandatory

`ACCESS_DATE`

## Periodical Journal - String, free, mandatory

`PERIODICAL_JOURNAL`

## Volume - Numeric, free, mandatory

`VOLUME`

## Issue - Numeric, free, mandatory

`ISSUE`

## Publisher - String, free, mandatory

`PUBLISHER`

## Institution - String, free, mandatory

`INSTITUTION`

## DOI - String, free, mandatory

`DOI`

## URL - String, free, mandatory

`URL`

## ISBN ISSN - String, free, mandatory

`ISBN_ISSN`

## Edition - String, free, mandatory

`EDITION`

## Document Number - String, free, mandatory

`DOCUMENT_NUMBER`

## Ref Comment - String, free, optional

`REF_COMMENT`
