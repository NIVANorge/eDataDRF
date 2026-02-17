# Environmental compartment sub-categories controlled vocabulary

Returns controlled vocabulary mapping for environmental sub-compartments
organized by main compartment.

## Usage

``` r
environ_compartments_sub_vocabulary()
```

## Value

A named list of character vectors with sub-compartment options for each
main compartment

## Details

Provides a hierarchical structure of environmental sub-compartments
grouped by their main compartment type. The list includes:

Aquatic: Freshwater, Marine/Salt Water, Brackish/Transitional Water,
Groundwater, Wastewater, Liquid Growth Medium, Rainwater, Stormwater,
Leachate, Aquatic Sediment, Porewater, Sludge, Snow/Ice

Atmospheric: Indoor Air, Outdoor Air

Terrestrial: Terrestrial Biological Residue, Soil H Horizon (Peat), Soil
O Horizon (Organic), Soil A Horizon (Topsoil), Soil E Horizon (Mineral),
Soil S Horizon (Mineral), Soil C Horizon (Parent Material), Soil R
Horizon (Bedrock)

Biota: Biota, Terrestrial, Biota, Aquatic, Biota, Atmospheric, Biota,
Other

## See also

Other compartment:
[`environ_compartments_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/environ_compartments_vocabulary.md),
[`initialise_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_compartments_tibble.md),
[`measured_categories_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_categories_vocabulary.md)
