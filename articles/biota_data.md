# Biota data

## Introduction

Where biota are sampled, it becomes important to capture considerable
additional information. **Biota data** captures species, tissue type,
gender, lifestage, which can other factors can considerably affect
exposure to pollutants. This information is therefore important to put
their occurrence in its full context.

The Biota table is an intermediate table that extends the [Samples data
table](https://NIVANorge.github.io/eDataDRF/articles/samples_data.md)
where biota
[compartments](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.md)
are selected. Otherwise, this element of the data entry workflow is
skipped as irrelevant.

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

## Variables

### Sample ID

`SAMPLE_ID` - *String, free, mandatory*

Transcribed from [Sample
ID](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#sample-id)
in the Samples data.

### Site Code

`SITE_CODE` - *String, free, mandatory*

Transcribed from [Site
Code](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#site-code)
in the Samples data.

### Parameter Name

`PARAMETER_NAME` - *String, free, mandatory*

Transcribed from [Parameter
Name](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#parameter-name)
in the Samples data.

### Environmental Compartment

`ENVIRON_COMPARTMENT` - *String, controlled, mandatory*

Transcribed from [Environmental
Compartment](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#environmental-compartment)
in the Samples data.

### Environmental Sub-Compartment

`ENVIRON_COMPARTMENT_SUB` - *String, controlled, mandatory*

Transcribed from [Environmental
Sub-Compartment](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#environmental-sub-compartment)
in the Samples data.

### Measured Category

`MEASURED_CATEGORY` - *String, controlled, mandatory*

Transcribed from [Measured
Category](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#measured-category)
in the Samples data.

### Sampling Date

`SAMPLING_DATE` - *String, free, mandatory*

Transcribed from [Sampling
Date](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#sampling-date)
in the Samples data.

### Subsample

`SUBSAMPLE` - *String, free, mandatory*

Transcribed from
[Subsample](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#subsample)
in the Samples data.

### Species Group

`SPECIES_GROUP` - *String, controlled, mandatory*

The rough grouping of species the biota belongs to. This classification
is not strictly taxonomic but rather reflects the categories typically
used in ecotoxicology. Both species group and name (below) are taken
from the EPA’s [ECOTOX
Knowledgebase](https://www.epa.gov/comptox-tools/ecotoxicology-ecotox-knowledgebase-resource-hub)
and cover approximately 13,000 of the species most used in the field.
Where this is insufficent, a species name can be added manually.

In future, we hope to incorporate a more exhaustive species taxonomy or
resource.

#### Controlled Vocabulary

``` r
species_groups_vocabulary()
#>  [1] "All"             "Algae"           "Amphibians"      "Bacteria"       
#>  [5] "Birds"           "Crustaceans"     "Ecosystem"       "Fish"           
#>  [9] "Fungi"           "Insects/Spiders" "Invertebrates"   "Mammals"        
#> [13] "Molluscs"        "Moss/Hornworts"  "Plants"          "Reptiles"       
#> [17] "Worms"           "Other"
```

### Sample Species

`SAMPLE_SPECIES` - *String, controlled, mandatory*

The consensus binomial scientific name of the species sampled. As above,
both species group and name (below) are taken from the EPA’s [ECOTOX
Knowledgebase](https://www.epa.gov/comptox-tools/ecotoxicology-ecotox-knowledgebase-resource-hub)
and cover approximately 13,000 of the species most used in the field.
Where this is insufficent, a species name can be added manually.

#### Controlled Vocabulary

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

### Sample Tissue

`SAMPLE_TISSUE` - *String, controlled, mandatory*

The tissue type sampled from biota. The controlled vocabulary for this
variable is currently very much non-exhaustive. This will be replaced by
harmonisation with an existing tissue ontology as practical.

#### Controlled Vocabulary

``` r
tissue_types_vocabulary()
#>  [1] "Not reported"                    "Not relevant"                   
#>  [3] "Whole body"                      "Total soft tissues"             
#>  [5] "Muscle"                          "Liver"                          
#>  [7] "Kidney"                          "Fat/Adipose"                    
#>  [9] "Skin"                            "Bone"                           
#> [11] "Pyloric caeca"                   "Body wall"                      
#> [13] "Brain"                           "Heart"                          
#> [15] "Lung"                            "Gill"                           
#> [17] "Gonad"                           "Shell"                          
#> [19] "Carapace"                        "Digestive Gland"                
#> [21] "Mantle"                          "Blood"                          
#> [23] "Egg"                             "Larva"                          
#> [25] "Leaf"                            "Root"                           
#> [27] "Stem"                            "Fruit"                          
#> [29] "Seed"                            "Brown meat"                     
#> [31] "Shoot tips"                      "Disc skeleton"                  
#> [33] "Echinoid corona"                 "Bile"                           
#> [35] "Plant tissue"                    "Shoot tip"                      
#> [37] "Total soft tissues minus gonads" "Other"
```

### Sample Species Lifestage

`SAMPLE_SPECIES_LIFESTAGE` - *String, controlled, mandatory*

The lifestage of an organism at time of sampling. As above, this is
currently somewhat restrictive but will be extended and harmonised as
practical.

#### Controlled Vocabulary

``` r
lifestage_vocabulary()
#>  [1] "Not reported" "Not relevant" "Adult"        "Juvenile"     "Larva"       
#>  [6] "Embryo"       "Egg"          "Seedling"     "Mature"       "Young"       
#> [11] "Mixed"        "Other"
```

### Sample Species Gender

`SAMPLE_SPECIES_GENDER` - *String, controlled, mandatory*

The gender or sex of a sampled organism. May be harmonised as needed.

#### Controlled Vocabulary

``` r
gender_vocabulary()
#> [1] "Not reported"  "Not relevant"  "Male"          "Female"       
#> [5] "Mixed"         "Hermaphrodite" "Other"
```

### Biota Comment

`BIOTA_COMMENT` - *String, free, optional*

Space for the recording of any additional notes or comments about the
sampled organism deemed relevant.
