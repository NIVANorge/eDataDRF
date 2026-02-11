# Get Dataset Display Name

Converts internal dataset names to user-friendly display names.

## Usage

``` r
get_dataset_display_name(dataset_name)
```

## Arguments

- dataset_name:

  Character. Internal dataset name (e.g., "edata_sites")

## Value

Character. User-friendly display name (e.g., "Sites"). If the dataset
name is not recognized, returns the input name unchanged.

## Examples

``` r
get_dataset_display_name("edata_sites")
#> [1] "Sites"
get_dataset_display_name("edata_measurements")
#> [1] "Measurements"
```
