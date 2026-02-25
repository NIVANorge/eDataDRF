# Compartments data

## Introduction

**Compartments data** is intended to collect data on the environmental
compartment or matrix sampled. The precise differences between site
type, environmental compartment, sampling matrix/medium and biota tissue
is a matter of professional judgement and domain background, but in this
format, we elect to classify sampled compartment separately. This
represents firstly the broad sphere sampled (biosphere, atmosphere,
hydrosphere, geosphere), and then subcategories. By their nature these
subcategories are extremely diverse, as the factors of heterogenisation
of the different spheres are themselves diverse. However, the broad
categories are intuitive and immediately recognisable. Additionally, we
capture information relevant to biota samples on whether the inside,
outside or surface of a biota was sampled. In future, this information
may be moved to the [Biota data
table](https://NIVANorge.github.io/eDataDRF/articles/biota_data.md).

The compartments data table is used to generate relevant combinations of
samples in the [Samples data
table](https://NIVANorge.github.io/eDataDRF/articles/samples_data.md).
It is thus not part of the final data product, but should be included in
exports in order to maximise reproducibility.

``` r
library(eDataDRF)
```

``` r
initialise_compartments_tibble()
#> # A tibble: 0 × 3
#> # ℹ 3 variables: ENVIRON_COMPARTMENT <chr>, ENVIRON_COMPARTMENT_SUB <chr>,
#> #   MEASURED_CATEGORY <chr>
```

## Variables

### Environmental Compartment - String, controlled, mandatory

`ENVIRON_COMPARTMENT`

Identifies which of the earth’s spheres the sample originated from:
aquatic (hydrosphere), air (atmospheric), terrestrial (geosphere), or
biota (biosphere). Although largely comprehensive, it’s possible that
some samples may not fit well into this category.

#### Controlled Vocabulary

``` r
environ_compartments_vocabulary()
#> [1] "Aquatic"      "Atmospheric"  "Terrestrial"  "Biota"        "Not relevant"
#> [6] "Not reported" "Other"
```

### Environmental Sub-Compartment - String, controlled, mandatory

`ENVIRON_COMPARTMENT_SUB`

Environmental compartments have been sub-divided into a series of
subcompartments. No taxonomy or ontology was consulted in creation of
this controlled vocabulary, although soil subcompartments were based on
the [World Reference Base for Soil
Resources](https://isric.org/explore/wrb).

#### Controlled Vocabulary

``` r
environ_compartments_sub_vocabulary()
#> $Aquatic
#>                    Freshwater             Marine/Salt Water 
#>                  "Freshwater"           "Marine/Salt Water" 
#>   Brackish/Transitional Water                   Groundwater 
#> "Brackish/Transitional Water"                 "Groundwater" 
#>                    Wastewater          Liquid Growth Medium 
#>                  "Wastewater"        "Liquid Growth Medium" 
#>                     Rainwater                    Stormwater 
#>                   "Rainwater"                  "Stormwater" 
#>                      Leachate              Aquatic Sediment 
#>                    "Leachate"            "Aquatic Sediment" 
#>                     Porewater                        Sludge 
#>                   "Porewater"                      "Sludge" 
#>                      Snow/Ice 
#>                    "Snow/Ice" 
#> 
#> $Atmospheric
#>    Indoor Air   Outdoor Air 
#>  "Indoor Air" "Outdoor Air" 
#> 
#> $Terrestrial
#>     Terrestrial Biological Residue              Soil H Horizon (Peat) 
#>   "Terrestrial Biological Residue"            "Soil H Horizon (Peat)" 
#>           Soil O Horizon (Organic)           Soil A Horizon (Topsoil) 
#>         "Soil O Horizon (Organic)"         "Soil A Horizon (Topsoil)" 
#>           Soil E Horizon (Mineral)           Soil S Horizon (Mineral) 
#>         "Soil E Horizon (Mineral)"         "Soil S Horizon (Mineral)" 
#>   Soil C Horizon (Parent Material)           Soil R Horizon (Bedrock) 
#> "Soil C Horizon (Parent Material)"         "Soil R Horizon (Bedrock)" 
#> 
#> $Biota
#>   Biota, Terrestrial       Biota, Aquatic   Biota, Atmospheric 
#> "Biota, Terrestrial"     "Biota, Aquatic" "Biota, Atmospheric" 
#>         Biota, Other 
#>       "Biota, Other"
```

### Measured Category - String, controlled, mandatory

`MEASURED_CATEGORY`

#### Controlled Vocabulary

``` r
measured_categories_vocabulary()
#>               External               Internal                Surface 
#>       "External Media" "Internal to Organism"  "Surface of Organism"
```
