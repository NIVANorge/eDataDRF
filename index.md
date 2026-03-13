# Readme

# eData Data Reporting Format

The eData Data Reporting Format is a format for the reporting of
chemical occurence/exposure data in the natural environment. It provides
tables, vocabulary, and validation functions for structuring chemical
occurence data, as well as spatial, social, biological, geographical,
and other metadata.

# Installation

To install this package, you will need the
[devtools](https://devtools.r-lib.org/) package:

``` r
  devtools::install_github("NIVANorge/eDataDRF")
```

## Usage

The format is structured as a series of tables that collect different
types of data. The
[Measurements](https://NIVANorge.github.io/eDataDRF/articles/measurements_data.html)
table is the central data table. It references the other tables via
foreign keys, unique identifying columns present in both tables. For
more information on each table, please see the section below or the
Articles section of the [documentation
site](https://NIVANorge.github.io/eDataDRF/articles).

``` r
library(eDataDRF)

campaign_table <- initialise_campaign_tibble()
biota_table <- initialise_biota_tibble()
```

## Tables

Tables are created as
[`tibble::tibble()`](https://tibble.tidyverse.org/reference/tibble.html)
calls with empty variables of specific types (e.g. `character(0)` for
strings). These support easier validation (see
[Validation](https://NIVANorge.github.io/eDataDRF/articles/validation.html))
and the extensive Tidyverse family of functions.

Tables are listed below:

| Table Name                                                                           | Purpose                                                                                              | Comments                                                                                    |
|--------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------|
| [Campaign](https://NIVANorge.github.io/eDataDRF/articles/campaign_data.html)         | Records data about sampling campaign and organisation collecting data.                               |                                                                                             |
| [Reference](https://NIVANorge.github.io/eDataDRF/articles/references_data.html)      | Records conventional publication metadata, where available                                           |                                                                                             |
| [Sites](https://NIVANorge.github.io/eDataDRF/articles/sites_data.html)               | Records site coordinates, land use, country/ocean                                                    |                                                                                             |
| [Parameters](https://NIVANorge.github.io/eDataDRF/articles/parameters_data.html)     | Records data on stressors (chemical, radiation, etc.), quality measurements                          |                                                                                             |
| [Compartments](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.html) | Records information on the compartment/matrix sampled                                                |                                                                                             |
| [Samples](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html)           | Records which combinations of dates, sites, parameters and compartments were sampled                 | Not used in final analysis, but exists as an intermediate table used to create measurements |
| [Biota](https://NIVANorge.github.io/eDataDRF/articles/biota_data.html)               | Where relevant, records biota species, tissue, life stage, and gender                                | Optional                                                                                    |
| [Methods](https://NIVANorge.github.io/eDataDRF/articles/methods_data.html)           | Records type and descriptions of methods used for sampling, extraction, fractionation and analysis   |                                                                                             |
| [Measurements](https://NIVANorge.github.io/eDataDRF/articles/measurements_data.html) | Records measured values, units, uncertainty, sample size, and methods associated with a given sample |                                                                                             |
| [CREED (quality)](https://NIVANorge.github.io/eDataDRF/articles/CREED_data.html)     | Records CREED assessment criteria, relevant data, criteria scores, and limitations                   |                                                                                             |
| [CREED Scores](https://NIVANorge.github.io/eDataDRF/articles/CREED_scores_data.html) | Records CREED usability scores calculated from CREED data above                                      |                                                                                             |

## Vocabulary

Likewise, controlled vocabulary is available as functions that return
vectors, lists, or tables. In some cases, helper functions are available
that wrap multiple invididual functions.

Where external data sources are used to generate a vocabulary, functions
may wrap (processed) data from other R packages or load raw data from
external sources.

``` r
measured_categories_vocabulary() # returns a named vector
#>               External               Internal                Surface 
#>       "External Media" "Internal to Organism"  "Surface of Organism"

environ_compartments_sub_vocabulary() # returns a nested list
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

extraction_protocols_vocabulary() # returns a tibble
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

protocol_options_vocabulary() # calls bind_rows() on four *_protocol_vocabulary() functions to return a tibble
#> # A tibble: 75 × 3
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
#> # ℹ 65 more rows

coordinate_systems_vocabulary(common_only = TRUE) # calls crsuggest::crs_sf, returns 4 rows (or more when common_only = FALSE)
#> [1] "Not relevant"          "Not reported"          "WGS 84"               
#> [4] "ETRS89"                "WGS 84 / UTM zone 32N" "WGS 84 / UTM zone 33N"
#> [7] "WGS 84 / UTM zone 34N" "WGS 84 / UTM zone 35N" "Other"

ocean_vocabulary()[1:20] # loads an RDS of IHO ocean definitions from /extdata/, returns a vector
#>  [1] "Not relevant"       "Not reported"       "Other"             
#>  [4] "Torres Strait"      "Tasman Sea"         "Solomon Sea"       
#>  [7] "Ross Sea"           "Coral Sea"          "Bismarck Sea"      
#> [10] "Bellingshausen Sea" "Bass Strait"        "Amundsen Sea"      
#> [13] "Timor Sea"          "Sunda Strait"       "Sumba Strait"      
#> [16] "Sulu Sea"           "Sulawesi Sea"       "South China Sea"   
#> [19] "Singapore Strait"   "Seram Sea"
```

``` mermaid
erDiagram
    Campaign ||--o{ Measurements : "Belongs"
    Campaign ||--o{ References : "Belongs"
    Campaign ||--o{ Sites : "Belongs"
    Campaign ||--o{ Methods : "Belongs"
    Campaign ||--o{ CREED : "Assesses"

    References ||--o{ Measurements : "Cites"
    Sites ||--o{ Measurements : "Locates"
    Parameters ||--o{ Measurements : "Quantifies"
    Methods ||--o{ Measurements : "Means"

    Measurements {
    }

    Campaign {
    }

    References {
    }

    Sites {
    }

    Parameters {
    }

    Methods {
    }

    CREED {
    }
```
