# biota_data

## Introduction

Data on sampled biota, if relevant.

- Link to ecotox db
- Plan to use EoL or wikispecies in future
- [Test link to samples
  data](https://NIVANorge.github.io/eDataDRF/articles/samples_data.md)

``` r
library(eDataDRF)
```

``` r
initialise_biota_tibble()
#> # A tibble: 0 × 14
#> # ℹ 14 variables: SAMPLE_ID <chr>, SITE_CODE <chr>, PARAMETER_NAME <chr>,
#> #   ENVIRON_COMPARTMENT <chr>, ENVIRON_COMPARTMENT_SUB <chr>,
#> #   MEASURED_CATEGORY <chr>, SAMPLING_DATE <chr>, SUBSAMPLE <chr>,
#> #   SPECIES_GROUP <chr>, SAMPLE_SPECIES <chr>, SAMPLE_TISSUE <chr>,
#> #   SAMPLE_SPECIES_LIFESTAGE <chr>, SAMPLE_SPECIES_GENDER <chr>,
#> #   BIOTA_COMMENT <chr>
```

### Variables

## Sample ID - String, free, mandatory

`SAMPLE_ID`

## Site Code - String, free, mandatory

`SITE_CODE`

## Parameter Name - String, free, mandatory

`PARAMETER_NAME`

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

## Species Group - String, controlled, mandatory

`SPECIES_GROUP`

``` r
species_groups_vocabulary()
#>  [1] "All"             "Algae"           "Amphibians"      "Bacteria"       
#>  [5] "Birds"           "Crustaceans"     "Ecosystem"       "Fish"           
#>  [9] "Fungi"           "Insects/Spiders" "Invertebrates"   "Mammals"        
#> [13] "Molluscs"        "Moss/Hornworts"  "Plants"          "Reptiles"       
#> [17] "Worms"           "Other"
```

### Controlled Vocabulary

## Sample Species - String, controlled, mandatory

`SAMPLE_SPECIES`

``` r
species_names_vocabulary()
#> # A tibble: 29,562 × 4
#>    SPECIES_COMMON_NAME SPECIES_NAME          SPECIES_KINGDOM SPECIES_GROUP
#>    <chr>               <chr>                 <chr>           <chr>        
#>  1 Fathead Minnow      Pimephales promelas   Animalia        Fish         
#>  2 Bluegill            Lepomis macrochirus   Animalia        Fish         
#>  3 Brook Trout         Salvelinus fontinalis Animalia        Fish         
#>  4 Rainbow Trout       Oncorhynchus mykiss   Animalia        Fish         
#>  5 Water Flea          Daphnia magna         Animalia        Crustaceans  
#>  6 Scud                Gammarus lacustris    Animalia        Crustaceans  
#>  7 Scud                Gammarus fasciatus    Animalia        Crustaceans  
#>  8 Water Flea          Daphnia pulex         Animalia        Crustaceans  
#>  9 Diatom              Nitzschia linearis    Chromista       Algae        
#> 10 Green Crab          Carcinus maenas       Animalia        Crustaceans  
#> # ℹ 29,552 more rows
```

### Controlled Vocabulary

## Sample Tissue - String, controlled, mandatory

`SAMPLE_TISSUE`

``` r
tissue_types_vocabulary()
#>  [1] "Not reported"       "Not relevant"       "Whole body"        
#>  [4] "Total soft tissues" "Muscle"             "Liver"             
#>  [7] "Kidney"             "Fat/Adipose"        "Skin"              
#> [10] "Bone"               "Pyloric caeca"      "Body wall"         
#> [13] "Brain"              "Heart"              "Lung"              
#> [16] "Gill"               "Gonad"              "Shell"             
#> [19] "Carapace"           "Digestive Gland"    "Mantle"            
#> [22] "Blood"              "Egg"                "Larva"             
#> [25] "Leaf"               "Root"               "Stem"              
#> [28] "Fruit"              "Seed"               "Other"
```

### Controlled Vocabulary

## Sample Species Lifestage - String, controlled, mandatory

`SAMPLE_SPECIES_LIFESTAGE`

``` r
lifestage_vocabulary()
#>  [1] "Not reported" "Not relevant" "Adult"        "Juvenile"     "Larva"       
#>  [6] "Embryo"       "Egg"          "Seedling"     "Mature"       "Young"       
#> [11] "Mixed"        "Other"
```

### Controlled Vocabulary

## Sample Species Gender - String, controlled, mandatory

`SAMPLE_SPECIES_GENDER`

``` r
gender_vocabulary()
#> [1] "Not reported"  "Not relevant"  "Male"          "Female"       
#> [5] "Mixed"         "Hermaphrodite" "Other"
```

### Controlled Vocabulary

## Biota Comment - String, free, optional

`BIOTA_COMMENT`
