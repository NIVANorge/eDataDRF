# Initialise a table to store formatted environmental compartment data

Creates an empty tibble with the standardised column structure for
environmental compartment data. Compartments define the environmental
matrix and measurement context for sampling activities. One immediate
child: create_compartment_combination() in mod_compartments_fct.R

## Usage

``` r
initialise_compartments_tibble()
```

## Value

A tibble with 0 rows and standardised compartment columns
