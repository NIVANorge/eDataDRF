# references_data

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
