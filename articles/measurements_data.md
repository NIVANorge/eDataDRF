# Measurements Table

## Introduction

``` r
library(eDataDRF)
```

``` r
initialise_measurements_tibble()
#> # A tibble: 0 × 27
#> # ℹ 27 variables: SITE_CODE <chr>, PARAMETER_NAME <chr>, SAMPLING_DATE <chr>,
#> #   ENVIRON_COMPARTMENT_SUB <chr>, SUBSAMPLE <chr>, MEASURED_FLAG <chr>,
#> #   MEASURED_VALUE <dbl>, UNCERTAINTY_TYPE <chr>, UNCERTAINTY_UPPER <dbl>,
#> #   UNCERTAINTY_LOWER <dbl>, MEASURED_UNIT <chr>, MEASURED_N <dbl>,
#> #   LOQ_VALUE <dbl>, LOQ_UNIT <chr>, LOD_VALUE <dbl>, LOD_UNIT <chr>,
#> #   SAMPLING_PROTOCOL <chr>, EXTRACTION_PROTOCOL <chr>,
#> #   FRACTIONATION_PROTOCOL <chr>, ANALYTICAL_PROTOCOL <chr>, …
```

### Variables

## Site Code - String, free, mandatory

`SITE_CODE`

## Parameter Name - String, free, mandatory

`PARAMETER_NAME`

## Sampling Date - String, free, mandatory

`SAMPLING_DATE`

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

## Subsample - String, free, mandatory

`SUBSAMPLE`

## Measured Flag - String, controlled, mandatory

`MEASURED_FLAG`

``` r
measured_flags_vocabulary()
#> [1] ""      "< LOQ" "< LOD"
```

### Controlled Vocabulary

## Measured Value - Numeric, free, mandatory

`MEASURED_VALUE`

## Uncertainty Type - String, controlled, mandatory

`UNCERTAINTY_TYPE`

``` r
uncertainty_types_vocabulary()
#>  [1] "Not Reported"                    "Not Relevant"                   
#>  [3] "Arithmetic Mean"                 "Geometric Mean"                 
#>  [5] "Standard Deviation"              "Standard Error"                 
#>  [7] "95% Confidence Interval"         "90% Confidence Interval"        
#>  [9] "99% Confidence Interval"         "Min-Max Range"                  
#> [11] "Interquartile Range (Q1-Q3)"     "10th-90th Percentile"           
#> [13] "5th-95th Percentile"             "Coefficient of Variation (%)"   
#> [15] "Median Absolute Deviation"       "First-Third Quartile Range"     
#> [17] "Minimum-Maximum"                 "Variance"                       
#> [19] "Standard Error of Mean"          "Relative Standard Deviation (%)"
#> [21] "95% Credible Interval"           "95% Prediction Interval"        
#> [23] "95% Tolerance Interval"          "95% Bootstrap CI"               
#> [25] "Other"
```

### Controlled Vocabulary

## Uncertainty Upper - Numeric, free, mandatory

`UNCERTAINTY_UPPER`

## Uncertainty Lower - Numeric, free, mandatory

`UNCERTAINTY_LOWER`

## Measured Unit - String, controlled, mandatory

`MEASURED_UNIT`

``` r
parameter_unit_vocabulary()
#> # A tibble: 64 × 4
#>    MEASURED_UNIT BASE_SI_UNIT CONVERSION_FACTOR UNIT_COMMENTS      
#>    <chr>         <chr>        <chr>             <chr>              
#>  1 mg/L          kg/m³        1e-3              mass concentration 
#>  2 μg/L          kg/m³        1e-6              mass concentration 
#>  3 ng/L          kg/m³        1e-9              mass concentration 
#>  4 pg/L          kg/m³        1e-12             mass concentration 
#>  5 mol/L         mol/m³       1000              molar concentration
#>  6 mmol/L        mol/m³       1                 molar concentration
#>  7 μmol/L        mol/m³       1e-3              molar concentration
#>  8 nmol/L        mol/m³       1e-6              molar concentration
#>  9 pmol/L        mol/m³       1e-9              molar concentration
#> 10 M             mol/m³       1000              molar concentration
#> # ℹ 54 more rows
```

### Controlled Vocabulary

## Measured N - Numeric, free, mandatory

`MEASURED_N`

## LOQ Value - Numeric, free, mandatory

`LOQ_VALUE`

## LOQ Unit - String, controlled, mandatory

`LOQ_UNIT`

``` r
parameter_unit_vocabulary()
#> # A tibble: 64 × 4
#>    MEASURED_UNIT BASE_SI_UNIT CONVERSION_FACTOR UNIT_COMMENTS      
#>    <chr>         <chr>        <chr>             <chr>              
#>  1 mg/L          kg/m³        1e-3              mass concentration 
#>  2 μg/L          kg/m³        1e-6              mass concentration 
#>  3 ng/L          kg/m³        1e-9              mass concentration 
#>  4 pg/L          kg/m³        1e-12             mass concentration 
#>  5 mol/L         mol/m³       1000              molar concentration
#>  6 mmol/L        mol/m³       1                 molar concentration
#>  7 μmol/L        mol/m³       1e-3              molar concentration
#>  8 nmol/L        mol/m³       1e-6              molar concentration
#>  9 pmol/L        mol/m³       1e-9              molar concentration
#> 10 M             mol/m³       1000              molar concentration
#> # ℹ 54 more rows
```

### Controlled Vocabulary

## LOD Value - Numeric, free, mandatory

`LOD_VALUE`

## LOD Unit - String, controlled, mandatory

`LOD_UNIT`

``` r
parameter_unit_vocabulary()
#> # A tibble: 64 × 4
#>    MEASURED_UNIT BASE_SI_UNIT CONVERSION_FACTOR UNIT_COMMENTS      
#>    <chr>         <chr>        <chr>             <chr>              
#>  1 mg/L          kg/m³        1e-3              mass concentration 
#>  2 μg/L          kg/m³        1e-6              mass concentration 
#>  3 ng/L          kg/m³        1e-9              mass concentration 
#>  4 pg/L          kg/m³        1e-12             mass concentration 
#>  5 mol/L         mol/m³       1000              molar concentration
#>  6 mmol/L        mol/m³       1                 molar concentration
#>  7 μmol/L        mol/m³       1e-3              molar concentration
#>  8 nmol/L        mol/m³       1e-6              molar concentration
#>  9 pmol/L        mol/m³       1e-9              molar concentration
#> 10 M             mol/m³       1000              molar concentration
#> # ℹ 54 more rows
```

### Controlled Vocabulary

## Sampling Protocol - String, controlled, mandatory

`SAMPLING_PROTOCOL`

``` r
sampling_protocols_vocabulary()
#> # A tibble: 22 × 3
#>    Protocol_Type     Short_Name     Long_Name            
#>    <chr>             <chr>          <chr>                
#>  1 Sampling Protocol Not relevant   Not relevant         
#>  2 Sampling Protocol Not reported   Not reported         
#>  3 Sampling Protocol Point          Point sampling       
#>  4 Sampling Protocol Composite      Composite sampling   
#>  5 Sampling Protocol Trawl          Trawl sampling       
#>  6 Sampling Protocol Grab           Grab sampling        
#>  7 Sampling Protocol Core           Core sampling        
#>  8 Sampling Protocol Seine net      Seine net sampling   
#>  9 Sampling Protocol Electrofishing Electrofishing       
#> 10 Sampling Protocol Plankton net   Plankton net sampling
#> # ℹ 12 more rows
```

### Controlled Vocabulary

## Extraction Protocol - String, controlled, mandatory

`EXTRACTION_PROTOCOL`

``` r
extraction_protocols_vocabulary()
#> # A tibble: 19 × 3
#>    Protocol_Type       Short_Name                        Long_Name              
#>    <chr>               <chr>                             <chr>                  
#>  1 Extraction Protocol Not relevant                      Not relevant           
#>  2 Extraction Protocol Not reported                      Not reported           
#>  3 Extraction Protocol None                              No extraction          
#>  4 Extraction Protocol Methanol                          Methanol extraction    
#>  5 Extraction Protocol Dichloromethane                   Dichloromethane extrac…
#>  6 Extraction Protocol SPE Isolute Env+                  Solid phase extraction…
#>  7 Extraction Protocol Membrane filtration 0.45um        Membrane filtration th…
#>  8 Extraction Protocol Membrane filtration 0.2um         Membrane filtration th…
#>  9 Extraction Protocol Membrane filtration               Membrane filtration    
#> 10 Extraction Protocol Filtration                        Filtration             
#> 11 Extraction Protocol Microwave-assisted acid digestion Microwave-assisted aci…
#> 12 Extraction Protocol Acid digestion                    Acid digestion         
#> 13 Extraction Protocol Pressurised liquid                Pressurised liquid ext…
#> 14 Extraction Protocol Ultrasonic                        Ultrasonic extraction  
#> 15 Extraction Protocol Soxhlet                           Soxhlet extraction     
#> 16 Extraction Protocol QuEChERS                          Quick easy cheap effec…
#> 17 Extraction Protocol Accelerated solvent               Accelerated solvent ex…
#> 18 Extraction Protocol Sequential extraction             Sequential extraction …
#> 19 Extraction Protocol Other                             Other
```

### Controlled Vocabulary

## Fractionation Protocol - String, controlled, mandatory

`FRACTIONATION_PROTOCOL`

``` r
fractionation_protocols_vocabulary()
#> # A tibble: 19 × 3
#>    Protocol_Type          Short_Name        Long_Name                           
#>    <chr>                  <chr>             <chr>                               
#>  1 Fractionation Protocol Not relevant      Not relevant                        
#>  2 Fractionation Protocol Not reported      Not reported                        
#>  3 Fractionation Protocol Total             Total fraction                      
#>  4 Fractionation Protocol Particles         Particulate fraction                
#>  5 Fractionation Protocol Colloidal         Colloidal fraction                  
#>  6 Fractionation Protocol LMM               Low molecular mass fraction         
#>  7 Fractionation Protocol Aqueous           Aqueous fraction                    
#>  8 Fractionation Protocol Filtered 0.45um   Filtered through 0.45 micrometer me…
#>  9 Fractionation Protocol Filtered 0.2um    Filtered through 0.2 micrometer mem…
#> 10 Fractionation Protocol Dissolved         Dissolved fraction                  
#> 11 Fractionation Protocol Filtered          Filtered fraction                   
#> 12 Fractionation Protocol Acid extractable  Acid extractable fraction           
#> 13 Fractionation Protocol Reducible         Reducible fraction                  
#> 14 Fractionation Protocol Oxidisable        Oxidisable fraction                 
#> 15 Fractionation Protocol Residual          Residual fraction                   
#> 16 Fractionation Protocol Bioavailable      Bioavailable fraction               
#> 17 Fractionation Protocol Free ion          Free ion activity                   
#> 18 Fractionation Protocol Size fractionated Size fractionated                   
#> 19 Fractionation Protocol Other             Other
```

### Controlled Vocabulary

## Analytical Protocol - String, controlled, mandatory

`ANALYTICAL_PROTOCOL`

``` r
analytical_protocols_vocabulary()
#> # A tibble: 15 × 3
#>    Protocol_Type       Short_Name         Long_Name                             
#>    <chr>               <chr>              <chr>                                 
#>  1 Analytical Protocol Not relevant       Not relevant                          
#>  2 Analytical Protocol Not reported       Not reported                          
#>  3 Analytical Protocol GC-MS              Gas chromatography mass spectrometry  
#>  4 Analytical Protocol LC-MS              Liquid chromatography mass spectromet…
#>  5 Analytical Protocol LC-MS/MS           Liquid chromatography tandem mass spe…
#>  6 Analytical Protocol GC-MS/MS           Gas chromatography tandem mass spectr…
#>  7 Analytical Protocol UPLC               Ultra performance liquid chromatograp…
#>  8 Analytical Protocol ICP-MS             Inductively coupled plasma mass spect…
#>  9 Analytical Protocol ICP-OES            Inductively coupled plasma optical em…
#> 10 Analytical Protocol AAS                Atomic absorption spectroscopy        
#> 11 Analytical Protocol XRF                X-ray fluorescence spectroscopy       
#> 12 Analytical Protocol Ion chromatography Ion chromatography                    
#> 13 Analytical Protocol Spectrophotometry  Spectrophotometry                     
#> 14 Analytical Protocol Fluorescence       Fluorescence spectroscopy             
#> 15 Analytical Protocol Other              Other
```

### Controlled Vocabulary

## Reference ID - String, free, mandatory

`REFERENCE_ID`

## Sample ID - String, free, mandatory

`SAMPLE_ID`

## Campaign Name Short - String, free, mandatory

`CAMPAIGN_NAME_SHORT`

## Environ Compartment - String, controlled, mandatory

`ENVIRON_COMPARTMENT`

``` r
environ_compartments_vocabulary()
#> [1] "Aquatic"      "Atmospheric"  "Terrestrial"  "Biota"        "Not relevant"
#> [6] "Not reported" "Other"
```

### Controlled Vocabulary

## Parameter Type - String, controlled, mandatory

`PARAMETER_TYPE`

``` r
parameter_types_vocabulary()
#> [1] "Not relevant"         "Stressor"             "Quality parameter"   
#> [4] "Normalisation"        "Background"           "Ecological Indicator"
#> [7] "Other"
```

### Controlled Vocabulary

## Measured Type - String, controlled, mandatory

`MEASURED_TYPE`

``` r
measured_types_vocabulary()
#>  [1] "Concentration"        "Dose rate"            "Dose"                
#>  [4] "Physical parameter"   "Amount"               "Volume"              
#>  [7] "Fraction of total"    "Percent"              "Irradiance"          
#> [10] "Response"             "Ecological Indicator" "Not relevant"        
#> [13] "Other"
```

### Controlled Vocabulary

## Measurement Comment - String, free, optional

`MEASUREMENT_COMMENT`
