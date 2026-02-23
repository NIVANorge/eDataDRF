# samples_data

## Introduction

``` r
library(eDataDRF)
```

``` r
initialise_samples_tibble()
#> # A tibble: 0 × 11
#> # ℹ 11 variables: SITE_CODE <chr>, SITE_NAME <chr>, PARAMETER_NAME <chr>,
#> #   PARAMETER_TYPE <chr>, ENVIRON_COMPARTMENT <chr>,
#> #   ENVIRON_COMPARTMENT_SUB <chr>, MEASURED_CATEGORY <chr>,
#> #   SAMPLING_DATE <chr>, SUBSAMPLE <chr>, SUBSAMPLE_ID <chr>, SAMPLE_ID <chr>
```

### Variables

## Site Code - String, free, mandatory

`SITE_CODE`

## Site Name - String, free, mandatory

`SITE_NAME`

## Parameter Name - String, free, mandatory

`PARAMETER_NAME`

## Parameter Type - String, controlled, mandatory

`PARAMETER_TYPE`

``` r
parameter_types_vocabulary()
#> [1] "Not relevant"         "Stressor"             "Quality parameter"   
#> [4] "Normalisation"        "Background"           "Ecological Indicator"
#> [7] "Other"
```

### Controlled Vocabulary

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

## Sampling Date - String, free, mandatory

`SAMPLING_DATE`

## Subsample - String, free, mandatory

`SUBSAMPLE`

## Subsample ID - String, free, mandatory

`SUBSAMPLE_ID`

## Sample ID - String, free, mandatory

`SAMPLE_ID`
