# compartments_data

## Introduction

``` r
library(eDataDRF)
```

``` r
initialise_compartments_tibble()
#> # A tibble: 0 × 3
#> # ℹ 3 variables: ENVIRON_COMPARTMENT <chr>, ENVIRON_COMPARTMENT_SUB <chr>,
#> #   MEASURED_CATEGORY <chr>
```

### Variables

## Environ Compartment - String, controlled, mandatory

`ENVIRON_COMPARTMENT`

``` r
environ_compartments_vocabulary()
#> [1] "Aquatic"      "Atmospheric"  "Terrestrial"  "Biota"        "Not relevant"
#> [6] "Not reported" "Other"
```

### Controlled Vocabulary

## Environ Compartment Sub - String, controlled, mandatory

`ENVIRON_COMPARTMENT_SUB`

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

### Controlled Vocabulary

## Measured Category - String, controlled, mandatory

`MEASURED_CATEGORY`

``` r
measured_categories_vocabulary()
#>               External               Internal                Surface 
#>       "External Media" "Internal to Organism"  "Surface of Organism"
```

### Controlled Vocabulary
