# Controlled vocabulary for the DATA_SOURCE column, References table

Returns the set of valid values for the `DATA_SOURCE` field in the
Reference table.

## Usage

``` r
data_source_vocabulary()
```

## Value

A character vector of permitted data source types.

## Details

Primary: Data object reports first-party data

Secondary/Review: Data object reports third-party data

Other: Data sourcing otherwise not relevant

## Examples

``` r
data_source_vocabulary()
#> [1] "Primary"          "Secondary/Review" "Other"           
```
