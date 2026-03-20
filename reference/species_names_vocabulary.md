# Controlled vocabulary for the SPECIES_NAME column, Biota table

Returns species information from EPA ECOTOX database.

## Usage

``` r
species_names_vocabulary()
```

## Value

A data frame of species information

## Details

Provides comprehensive species data including common names, scientific
names, kingdom, and species group classifications. Data is read from
ecotox_2025_06_12_species.parquet and species group classifications.
Data is read from ecotox_2025_06_12_species.parquet. Additional entries
for "Other" and "Ecosystem" are included. Data retrieved from
<https://cfpub.epa.gov/ecotox/>, 2025.06.12.

Data source: extdata/ecotox_2025_06_12_species.parquet

## See also

Other biota:
[`example_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_biota_tibble.md),
[`gender_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/gender_vocabulary.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`lifestage_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/lifestage_vocabulary.md),
[`species_groups_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_groups_vocabulary.md),
[`tissue_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/tissue_types_vocabulary.md)

## Examples

``` r
head(species_names_vocabulary(), 5)
#> # A tibble: 5 × 4
#>   SPECIES_COMMON_NAME SPECIES_NAME          SPECIES_KINGDOM SPECIES_GROUP
#>   <chr>               <chr>                 <chr>           <chr>        
#> 1 Fathead Minnow      Pimephales promelas   Animalia        Fish         
#> 2 Bluegill            Lepomis macrochirus   Animalia        Fish         
#> 3 Brook Trout         Salvelinus fontinalis Animalia        Fish         
#> 4 Rainbow Trout       Oncorhynchus mykiss   Animalia        Fish         
#> 5 Water Flea          Daphnia magna         Animalia        Crustaceans  
```
