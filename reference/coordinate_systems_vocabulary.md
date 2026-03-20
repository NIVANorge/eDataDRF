# Controlled vocabulary for the `SITE_COORDINATE_SYSTEM` column, Sites table

Returns controlled vocabulary options for spatial coordinate reference
systems.

## Usage

``` r
coordinate_systems_vocabulary(common_only = TRUE)
```

## Arguments

- common_only:

  Return only the most common CRS options (default TRUE)

## Value

A character vector of coordinate system options

## Details

Sourced from the EPSG Dataset via the crsuggest package.

More CRS will be added as needed. In the long term, vocabulary may be
replaced entirely for better standardisation with EPSG and/or
PROJ4String.

CRS data sourced from crsuggest (Walker 2022). Using the EPSG Dataset
v10.019, a product of the International Association of Oil & Gas
Producers. Please view the terms of use at
<https://epsg.org/terms-of-use.html>.

## See also

Other site:
[`altitude_units_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/altitude_units_vocabulary.md),
[`areas_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/areas_vocabulary.md),
[`countries_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/countries_vocabulary.md),
[`example_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_sites_tibble.md),
[`geographic_features_sub_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/geographic_features_sub_vocabulary.md),
[`geographic_features_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/geographic_features_vocabulary.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md),
[`ocean_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/ocean_vocabulary.md)

## Examples

``` r
head(coordinate_systems_vocabulary(), 5)
#> [1] "Not relevant" "Not reported" "Other"        "WGS 84"       "ETRS89"      
```
