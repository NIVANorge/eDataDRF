# Species names controlled vocabulary

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
ecotox_2025_06_12_species.parquet and includes the following columns:

SPECIES_COMMON_NAME: Common or vernacular name

SPECIES_NAME: Scientific (Latin) name

SPECIES_KINGDOM: Taxonomic kingdom (not used in the format)

SPECIES_GROUP: Broad taxonomic grouping

Additional entries for "Other" and "Ecosystem" are included.

Data source: extdata/ecotox_2025_06_12_species.parquet

## See also

Other biota:
[`gender_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/gender_vocabulary.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`lifestage_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/lifestage_vocabulary.md),
[`species_groups_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/species_groups_vocabulary.md),
[`tissue_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/tissue_types_vocabulary.md)
