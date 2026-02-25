# Parameters data

## Introduction

The parameters table collects information on stressors, quality
parameters, and any other scalar properties measured in the context of
adverse environmental effect.

``` r
library(eDataDRF)
```

``` r
initialise_parameters_tibble()
#> # A tibble: 0 × 10
#> # ℹ 10 variables: PARAMETER_TYPE <chr>, PARAMETER_TYPE_SUB <chr>,
#> #   MEASURED_TYPE <chr>, PARAMETER_NAME <chr>, PARAMETER_NAME_SUB <chr>,
#> #   INCHIKEY_SD <chr>, PUBCHEM_CID <int>, CAS_RN <chr>, ENTERED_BY <chr>,
#> #   PARAMETER_COMMENT <chr>
```

It is expected that most relevant studies will be collecting data on
chemical pollutants in the environment. Non-chemicals are accomodated by
the format, but they cannot necessarily be as well-characterised as
chemicals, where we are able to take advantage of the high-quality
infrastructure developed by chemists.

## Variables

### Parameter Type - String, controlled, mandatory

`PARAMETER_TYPE`

Parameter type is divided into five classifications and two missing data
values. This classification requires a degree of subjective judgement.
What makes a chemical a stressor versus a quality parameter is not
always clear. However, we anticipate that in most cases this will be
uncontroversial. Where this is not the case stressors can still be
identified by name/id.

#### Controlled Vocabulary

``` r
parameter_types_vocabulary()
#> [1] "Not relevant"         "Stressor"             "Quality parameter"   
#> [4] "Normalisation"        "Background"           "Ecological Indicator"
#> [7] "Other"
```

`"Not relevant"` - Use when a type is not applicable to the measured
scalar. `"Stressor"` - hemical, physical or biological agent causing
stress. `"Quality parameter"` - Standard water/environmental quality
parameter `"Normalisation"` - Parameter used for normalising other
measurements  
`"Background"` - “Natural background level of a parameter”  
`"Ecological Indicator"` - Parameter is an indicator or metric of
ecological concern. `"Other"` - Parameter belongs to another category.
Please note in comments field.

### Parameter Sub-type - String, controlled, mandatory

`PARAMETER_TYPE_SUB`

Parameter Sub-type is a further subdivision of \[Parameter Type\]. The
majority of subtypes are chemical classifications from the
[ChemOnt/ClassyFire](https://pmc.ncbi.nlm.nih.gov/articles/PMC5096306/)
chemical taxonomy; other subtypes are intended for use with quality
parameters, stressors measured as mixtures, or other cases where
additional details are needed.

#### Controlled Vocabulary

``` r
parameter_types_sub_vocabulary()
#>  [1] "Acetylides"                               
#>  [2] "Alkaloids and derivatives"                
#>  [3] "Allenes"                                  
#>  [4] "Benzenoids"                               
#>  [5] "Carbon"                                   
#>  [6] "Conductivity"                             
#>  [7] "Dissolved oxygen"                         
#>  [8] "Homogeneous metal compounds"              
#>  [9] "Homogeneous non-metal compounds"          
#> [10] "Hydrocarbon derivatives"                  
#> [11] "Hydrocarbons"                             
#> [12] "Inorganic salts"                          
#> [13] "Lignans, neolignans and related compounds"
#> [14] "Lipids and lipid-like molecules"          
#> [15] "Miscellaneous inorganic compounds"        
#> [16] "Mixed metal/non-metal compounds"          
#> [17] "Nucleosides, nucleotides, and analogues"  
#> [18] "Nutrient"                                 
#> [19] "Organic 1,3-dipolar compounds"            
#> [20] "Organic Polymers"                         
#> [21] "Organic acids and derivatives"            
#> [22] "Organic nitrogen compounds"               
#> [23] "Organic oxygen compounds"                 
#> [24] "Organic salts"                            
#> [25] "Organohalogen compounds"                  
#> [26] "Organoheterocyclic compounds"             
#> [27] "Organometallic compounds"                 
#> [28] "Organophosphorus compounds"               
#> [29] "Organosulfur compounds"                   
#> [30] "Other"                                    
#> [31] "Phenylpropanoids and polyketides"         
#> [32] "Salinity"                                 
#> [33] "Temperature"                              
#> [34] "Total organic carbon"                     
#> [35] "Turbidity"                                
#> [36] "pH"                                       
#> [37] "Mixture"                                  
#> [38] "Not reported"
```

### Parameter Name, controlled, mandatory

`PARAMETER_NAME`

Parameter name records the reported name of a measured parameter. In the
majority of cases

#### Controlled Vocabulary

``` r
# TODO: Fix me, pleassse
dummy_parameters_vocabulary() |> dplyr::slice_head(n = 10)
#> # A tibble: 10 × 9
#>    PARAMETER_TYPE    PARAMETER_NAME      PARAMETER_TYPE_SUB MEASURED_TYPE CAS_RN
#>    <chr>             <chr>               <chr>              <chr>         <chr> 
#>  1 Quality parameter pH                  pH                 Physical par… <NA>  
#>  2 Quality parameter Dissolved oxygen    Dissolved oxygen   Concentration 7782-…
#>  3 Quality parameter Temperature         Temperature        Physical par… <NA>  
#>  4 Quality parameter Conductivity        Conductivity       Physical par… <NA>  
#>  5 Quality parameter Salinity            Salinity           Physical par… <NA>  
#>  6 Quality parameter Turbidity           Turbidity          Physical par… <NA>  
#>  7 Quality parameter Total organic carb… Total organic car… Concentration <NA>  
#>  8 Quality parameter Alkalinity          Other              Concentration <NA>  
#>  9 Quality parameter Hardness            Other              Concentration <NA>  
#> 10 Quality parameter Chlorophyll a       Other              Concentration 479-6…
#> # ℹ 4 more variables: PUBCHEM_CID <int>, INCHIKEY_SD <chr>, ENTERED_BY <chr>,
#> #   PARAMETER_NAME_SUB <chr>
```

- Typically the common short form name of a parameter, but…
- We use whatever ClassyFire gives us, I think
- Currently used as a primary key - this will be replaced with a better
  system once we get it working

### Parameter Sub-Name

`PARAMETER_NAME_SUB`
