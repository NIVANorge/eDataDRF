# Ocean areas controlled vocabulary

Returns controlled vocabulary options for IHO ocean regions.

## Usage

``` r
areas_vocabulary()
```

## Value

A character vector of ocean area options

## Details

Provides ocean and sea names from the International Hydrographic
Organisation (IHO) regions dataset, downloaded from
https://www.marineregions.org/download_file.php?name=World_Seas_IHO_v3.zip.
The complete list is read from an internal data file (IHO_oceans.rds)
and includes options such as:

Not relevant

Not reported

Other

All IHO ocean region names (e.g., Arctic Ocean, Atlantic Ocean, Baltic
Sea, Mediterranean Sea, ...)

Data source: extdata/IHO_oceans.rds

## See also

Other site:
[`altitude_units_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/altitude_units_vocabulary.md),
[`coordinate_systems_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/coordinate_systems_vocabulary.md),
[`countries_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/countries_vocabulary.md),
[`geographic_features_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/geographic_features_sub_vocabulary.md),
[`geographic_features_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/geographic_features_vocabulary.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md)
