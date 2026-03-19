# Readme


<link href="README_files/libs/htmltools-fill-0.5.9/fill.css" rel="stylesheet" />
<script src="README_files/libs/htmlwidgets-1.6.4/htmlwidgets.js"></script>
<script src="README_files/libs/d3-3.3.8/d3.min.js"></script>
<script src="README_files/libs/dagre-0.4.0/dagre-d3.min.js"></script>
<link href="README_files/libs/mermaid-0.3.0/dist/mermaid.css" rel="stylesheet" />
<script src="README_files/libs/mermaid-0.3.0/dist/mermaid.slim.min.js"></script>
<link href="README_files/libs/DiagrammeR-styles-0.2/styles.css" rel="stylesheet" />
<script src="README_files/libs/chromatography-0.1/chromatography.js"></script>
<script src="README_files/libs/DiagrammeR-binding-1.0.11/DiagrammeR.js"></script>

# eData Data Reporting Format

The eData Data Reporting Format is a format for the reporting of
chemical occurence/exposure data in the natural environment. It provides
tables, vocabulary, and validation functions for structuring chemical
occurence data, as well as spatial, social, biological, geographical,
and other metadata.

# Installation

To install this package, you will need the `{devtools}` package:

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
campaign_table
#> # A tibble: 0 × 8
#> # ℹ 8 variables: CAMPAIGN_NAME_SHORT <chr>, CAMPAIGN_NAME <chr>,
#> #   CAMPAIGN_START_DATE <date>, CAMPAIGN_END_DATE <date>, ORGANISATION <chr>,
#> #   ENTERED_BY <chr>, ENTERED_DATE <date>, CAMPAIGN_COMMENT <chr>
biota_table <- initialise_biota_tibble()
biota_table
#> # A tibble: 0 × 14
#> # ℹ 14 variables: SAMPLE_ID <chr>, SITE_CODE <chr>, PARAMETER_NAME <chr>,
#> #   ENVIRON_COMPARTMENT <chr>, ENVIRON_COMPARTMENT_SUB <chr>,
#> #   MEASURED_CATEGORY <chr>, SAMPLING_DATE <chr>, SUBSAMPLE <chr>,
#> #   SPECIES_GROUP <chr>, SAMPLE_SPECIES <chr>, SAMPLE_TISSUE <chr>,
#> #   SAMPLE_SPECIES_LIFESTAGE <chr>, SAMPLE_SPECIES_GENDER <chr>,
#> #   BIOTA_COMMENT <chr>
```

## Tables

Tables are created as `tibble::tibble()` calls with empty variables of
specific types (e.g. `character(0)` for strings). These support easier
validation (see
[Validation](https://NIVANorge.github.io/eDataDRF/articles/validation.html))
and the extensive Tidyverse family of functions.

Tables are listed below:

| Table Name | Purpose | Comments |
|----|----|----|
| [Campaign](https://NIVANorge.github.io/eDataDRF/articles/campaign_data.html) | Records data about sampling campaign and organisation collecting data. |  |
| [Reference](https://NIVANorge.github.io/eDataDRF/articles/references_data.html) | Records conventional publication metadata, where available |  |
| [Sites](https://NIVANorge.github.io/eDataDRF/articles/sites_data.html) | Records site coordinates, land use, country/ocean |  |
| [Parameters](https://NIVANorge.github.io/eDataDRF/articles/parameters_data.html) | Records data on stressors (chemical, radiation, etc.), quality measurements |  |
| [Compartments](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.html) | Records information on the compartment/matrix sampled |  |
| [Samples](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html) | Records which combinations of dates, sites, parameters and compartments were sampled | Not used in final analysis, but exists as an intermediate table used to create measurements |
| [Biota](https://NIVANorge.github.io/eDataDRF/articles/biota_data.html) | Where relevant, records biota species, tissue, life stage, and gender | Optional |
| [Methods](https://NIVANorge.github.io/eDataDRF/articles/methods_data.html) | Records type and descriptions of methods used for sampling, extraction, fractionation and analysis |  |
| [Measurements](https://NIVANorge.github.io/eDataDRF/articles/measurements_data.html) | Records measured values, units, uncertainty, sample size, and methods associated with a given sample |  |
| [CREED (quality)](https://NIVANorge.github.io/eDataDRF/articles/CREED_data.html) | Records CREED assessment criteria, relevant data, criteria scores, and limitations | Optional |
| [CREED Scores](https://NIVANorge.github.io/eDataDRF/articles/CREED_scores_data.html) | Records CREED usability scores calculated from CREED data above | Optional |

And displayed as an entity-relation diagram.

<div class="DiagrammeR html-widget html-fill-item" id="htmlwidget-e3efe65af1f2e6beeb85" style="width:672px;height:480px;"></div>
<script type="application/json" data-for="htmlwidget-e3efe65af1f2e6beeb85">{"x":{"diagram":"\nerDiagram\n    Campaign ||--o{ Measurements : 'Belongs'\n    Campaign ||--o{ References : 'Belongs'\n    Campaign ||--o{ Sites : 'Belongs'\n    Campaign ||--o{ Methods : 'Belongs'\n    Campaign ||--o{ CREED : 'Assesses'\n    \n    References ||--o{ Measurements : 'Cites'\n    Sites ||--o{ Measurements : 'Locates'\n    Parameters ||--o{ Measurements : 'Quantifies'\n    Methods ||--o{ Measurements : 'Means'\n    \n    Measurements {\n    }\n    \n    Campaign {\n    }\n    \n    References {\n    }\n    \n    Sites {\n    }\n    \n    Parameters {\n    }\n    \n    Methods {\n    }\n    \n    CREED {\n    }"},"evals":[],"jsHooks":[]}</script>

## Vocabulary

Likewise, controlled vocabulary is available as functions that return
vectors, lists, or tables. In some cases, helper functions are available
that wrap multiple invididual functions.

Where external data sources are used to generate a vocabulary, functions
may wrap (processed) data from other R packages or load raw data from
external sources. Vocabulary functions are documented in the [Reference
section](reference/index.html#controlled-vocabulary) and linked to in
the relevant table files in

``` r
# returns a named vector
measured_categories_vocabulary() 
#>               External               Internal                Surface 
#>       "External Media" "Internal to Organism"  "Surface of Organism"

# returns a nested list
environ_compartments_sub_vocabulary()[1] 
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

# returns a tibble
extraction_protocols_vocabulary()[1:5, 3] 
#> # A tibble: 5 × 1
#>   Long_Name                 
#>   <chr>                     
#> 1 Not relevant              
#> 2 Not reported              
#> 3 No extraction             
#> 4 Methanol extraction       
#> 5 Dichloromethane extraction

# calls bind_rows() on four *_protocol_vocabulary() functions to return a tibble
protocol_options_vocabulary()[1:5, 3] 
#> # A tibble: 5 × 1
#>   Long_Name         
#>   <chr>             
#> 1 Not relevant      
#> 2 Not reported      
#> 3 Point sampling    
#> 4 Composite sampling
#> 5 Trawl sampling

# calls crsuggest::crs_sf, returns 4 rows (or more when common_only = FALSE)
coordinate_systems_vocabulary(common_only = TRUE) 
#> [1] "Not relevant"          "Not reported"          "Other"                
#> [4] "WGS 84"                "ETRS89"                "WGS 84 / UTM zone 32N"
#> [7] "WGS 84 / UTM zone 33N" "WGS 84 / UTM zone 34N" "WGS 84 / UTM zone 35N"

# loads an RDS of IHO ocean definitions from /extdata/, returns a vector
ocean_vocabulary()[1:20] 
#>  [1] "Not relevant"       "Not reported"       "Other"             
#>  [4] "Torres Strait"      "Tasman Sea"         "Solomon Sea"       
#>  [7] "Ross Sea"           "Coral Sea"          "Bismarck Sea"      
#> [10] "Bellingshausen Sea" "Bass Strait"        "Amundsen Sea"      
#> [13] "Timor Sea"          "Sunda Strait"       "Sumba Strait"      
#> [16] "Sulu Sea"           "Sulawesi Sea"       "South China Sea"   
#> [19] "Singapore Strait"   "Seram Sea"
```

# Is something missing?

We intend to update this format regularly as new resources become
available and to address emerging needs. If you have a suggestion or
comments, please get in touch via the Issues tab or, if you’re more
technically minding, making a Pull Request with proposed changes for
review.
