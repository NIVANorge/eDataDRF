# Methods data

## Introduction

Methodology can significantly affect measured values, and this
information is vital to understanding the overall environmental context.
In the **Methods data** table, we classify methodology into four
categories:

1.  Sampling protocol: how were physical samples or information
    collected from the environment?
2.  Extraction protocol: how was a substance of interest (analyte)
    extracted from its matrix?
3.  Fractionation protocol: what fraction of the analyte was analysed?
    how was this fraction obtained?
4.  Analytical protocol: what analytical techniques were used to
    determine the quantity of analyte in the sample?

These methodologies are structured for the collection of data on
chemicals stressors, which reflects the dominant use case of the format
so far. Extension to cover a greater range of non-chemical stressors is
planned for future versions.

Currently no external ontology or taxonomy is used for methodology. The
[Chemical Methods Ontology](https://github.com/rsc-ontology/rsc-cmo)
(CMO) may be appropriate, and we will continue to review its progress to
determine the appropriate form of any harmonisation.

The Methods table is a metadata table that is transformed before being
linked to the [Measurements
table](https://NIVANorge.github.io/eDataDRF/articles/measurements_data.md).
Because it is assumed that each measurement will typically have a
sampling, extraction, fractionation, and analytical protocol associated
with it, the measurements table has a foreign key for each type of
methdology that references the relevant [Protocol
ID](#protocol-id---string-free-mandatory).

``` r
library(eDataDRF)
```

``` r
initialise_methods_tibble()
#> # A tibble: 0 × 5
#> # ℹ 5 variables: PROTOCOL_ID <chr>, CAMPAIGN_NAME <chr>,
#> #   PROTOCOL_CATEGORY <chr>, PROTOCOL_NAME <chr>, PROTOCOL_COMMENT <chr>
```

## Variables

### Protocol ID - String, free, mandatory

`PROTOCOL_ID`

A short, terse identifier for the protocol. This is used as a primary
key for Methods data and a foreign key in the Sampling Protocol,
Extraction Protocol, Fractionation Protocol, and Analytical Protocol
columns. [Measurements
data](https://NIVANorge.github.io/eDataDRF/articles/measurements_data.md).

Protocol IDs are automatically generated based on the protocol type,
short name, campaign name, and, in cases where more than one of a type
of technique is used per campaign, sequence number. This is
theoretically vulnerable to colisions, and a hashed or serial key would
be safer, but this is not anticipated to be a problem at the current
scale of use at the format. Additionally, it is far easier to read and
intepret for humans.

``` r
generate_protocol_id(
  protocol_type = "Analytical Protocol",
  protocol_name = "ICP-MS",
  sequence_number = 1,
  campaign_name = "Test_Campaign"
)
#> [1] "A01_ICPMS_TestCampai"
```

### Campaign Name - String, free, mandatory

`CAMPAIGN_NAME`

A short, terse identifier for the campaign. Foreign key referenced from
[Campaign
data](https://NIVANorge.github.io/eDataDRF/articles/campaign_data.md),
used to generate [Protocol ID](#protocol-id---string-free-mandatory).

### Protocol Category - String, controlled vocabulary, mandatory

`PROTOCOL_CATEGORY`

The category of protocol/method (Sampling, Extraction, Fractionation,
Analytical).

``` r
protocol_categories_vocabulary()
#> [1] "Sampling Protocol"      "Fractionation Protocol" "Extraction Protocol"   
#> [4] "Analytical Protocol"
```

### Protocol Name - String, controlled vocabulary, mandatory

`PROTOCOL_NAME`

The consensus name (short and long) of a protocol or method used in
sampling. Options are currently based on the aquatic ecotoxicology
domain, but will be extended and harmonised with relevant ontologies and
taxonomies as practical.

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

# call all of the above functions bound into a single table
# protocol_options_vocabulary()
```

### Protocol Comment - String, free, optional

`PROTOCOL_COMMENT`

Space for the recording of any additional notes or comments about the
method deemed relevant. As information on the specific equipment or more
detailed protocols may also be useful, users are encouraged to copy
relevant text verbatim from the source.
