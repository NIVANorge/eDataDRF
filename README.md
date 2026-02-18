# eData Data Reporting Format

The eData Data Reporting Format is a format for the standardisation of data on pollutant occurence in the environment. By converting this data to a single, consistent format, it makes it easier to validate, compare, analyse, and reuse, in line with the [FAIR principles](https://www.go-fair.org/fair-principles/)

These data are typically published as concentrations (in water) or mass ratios (in soil, sludge and biota). Fully interpreting these measurements requires considerable metadata, relating to the time, place, conditions, methodology, and context of sampling. However, no single standard exists for these metadata, and study authors and sampling teams tend to use a variety of inconsistent definitions, units, and schema depending on their scientific domain and the study's individual needs. 

This is not, in itself a problem. However, as environmental risk assessment becomes more data-based and larger scale, the need to use and re-use large quantities of data increases. When these datasets are consistent, validated, and interoperable, much time can be saved. When they are not, researchers much go through the tedious process of understanding, validating and remapping by hand; an often non-reproducible process. Thus a harmonised format - and associated validation and formatting functions - can represent a significant timesaver for anyone in such as position. 

This format is a (first) attempt to address this issue. Rather than attempt a perfect format that covers all relevant domains, we have elected to focus on pollutants in water, aquatic biota, and similar compartments (sludge, aquatic sediment, etc.). This has been designed to follow a database-like structure, with the expectation that the format will be developed into a full database schema in the future. 

## Tables

Tables are created as `tibble::tibble()` calls with empty variables of specific types (e.g. `character(0)` for strings). These support easier validation (see [Validation](validation.html)) and the extensive Tidyverse family of functions.

Tables are listed below:


```{r}
# Create the data frame ----
schema_data <- tribble(
  ~`Table Name`,    ~Purpose,                                                                                              ~Comments,
  "Campaign",       "Records data about sampling campaign and organisation collecting data.",                             "",
  "Reference",      "Records conventional publication metadata, where available",                                         "",
  "Sites",          "Records site coordinates, land use, country/ocean",                                                  "",
  "Parameters",     "Records data on stressors (chemical, radiation, etc.), quality measurements",                        "",
  "Compartments",   "Records information on the compartment/matrix sampled",                                              "",
  "Samples",        "Recorded which combinations of dates, sites, parameters and compartments were sampled",              "Not used in final analysis, but exists as an intermediate table used to create measurements",
  "Biota",          "Where relevant, records biota species, tissue, life stage, and gender",                              "Optional",
  "Methods",        "Records type and descriptions of methods used for sampling, extraction, fractionation and analysis", "",
  "Measurements",   "Records measured values, units, uncertainty, sample size, and methods associated with a given sample", "",
  "CREED (quality)", "Records assessment purpose statement, relevant data summarised from above tables, relevance/reliability scores, and final assessment of data quality.", ""
)

# Create gt table ----
schema_table <- schema_data |>
  gt() |>
  # Left-align all columns
  cols_align(
    align = "left",
    columns = everything()
  ) 

schema_table
```

: Table of tables in the eData format, their purpose, and comments.

```{mermaid}
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

: A basic diagram of the relationships between different tables. Rendering may be broken...?


- Caveats
- Links
- Vignettes