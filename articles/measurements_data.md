# Measurements Table

## Introduction

The **Measurements data table** represents the core data table of the
eData format. This table records actual measured parameter values
(including uncertainty), and references most other tables using foreign
keys.

This table is built from the [Samples data
table](https://NIVANorge.github.io/eDataDRF/articles/samples_data.md)
and optionally the [Biota data
table](https://NIVANorge.github.io/eDataDRF/articles/biota_data.md) if
present. Both tables are bound together (that is, the rows of one are
added below the other) and then extended with additional columns. The
inclusion of columns in this table and their order is somewhat a

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

## Variables

### Site Code

`SITE_CODE` - *string, free, mandatory*

[Site
Code](https://NIVANorge.github.io/eDataDRF/articles/sites_data.html#site-code)
is a foreign key that references the [Sites data
table](https://NIVANorge.github.io/eDataDRF/articles/sites_data.md).
During Samples table creation the user selects relevant sites using
their code and name.

### Parameter Name

`PARAMETER_NAME` - *string, free, mandatory*

[Parameter
name](https://NIVANorge.github.io/eDataDRF/articles/parameters_data.html#parameter-name)
is a foreign key that references the [Parameter data
table](https://NIVANorge.github.io/eDataDRF/articles/parameters_data.md).
During Samples table creation the user selects relevant parameters using
their name and type.

### Sampling Date

`SAMPLING_DATE` - *string, free, mandatory*

Transcribed from [Sampling
Date](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#sampling-date)
in the Samples data.

### Environmental Sub-Compartment

`ENVIRON_COMPARTMENT_SUB` - *string, controlled, mandatory*

Transcribed from [Environmental
Sub-Compartment](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#environmental-sub-compartment)
in the Samples data table.

### Subsample

`SUBSAMPLE` - *string, free, mandatory*

Transcribed from
[Subsample](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#subsample)
in the Samples data table.

### Measured Flag

`MEASURED_FLAG` - *string, controlled, mandatory*

A flag to indicate if the data source reported a measured value (blank)
or that it was below the [limit of detection](#lod-value) or [limit of
quantification](#loq-value). In the latter cases, [Measured
value](#measured-value) becomes optional, but it is mandatory to
complete at least one of LOQ/LOD.

#### Controlled Vocabulary

``` r
measured_flag_vocabulary()
#> [1] ""      "< LOQ" "< LOD"
```

### Measured Value

`MEASURED_VALUE` - *numeric, free, conditionally mandatory*

The numeric measured value of the parameter, if available.

### Uncertainty Type

`UNCERTAINTY_TYPE` - *string, controlled, mandatory*

Many [Measured values](#measured-value) are reported as aggregated
statistics with uncertainty bounds (mean, mode, etc; 95% CI, SD, SE,
range, etc.). Uncertainty Type provides a non-exhaustive classification
system for these.

Where the data source reports uncertaintly, the
[Upper](#uncertainty-upper-bound) and [Lower](#uncertainty-lower-bound)
should also be reported.

#### Controlled Vocabulary

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

### Uncertainty Upper Bound

`UNCERTAINTY_UPPER` - *numeric, free, conditionally mandatory*

The upper bound of any [reported uncertainty](#uncertainty-type).

### Uncertainty Lower Bound

`UNCERTAINTY_LOWER` - *numeric, free, conditionally mandatory*

The lower bound of any [reported uncertainty](#uncertainty-type).

### Measured Unit

`MEASURED_UNIT` - *string, controlled, conditionally mandatory*

The unit of measurement associated with the data. A non-exhaustive list
of options with conversion factors is provided as part of the format.
Mandatory when a [Measured value](#measured-value) is provided.

#### Controlled Vocabulary

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

### Measured N

`MEASURED_N` - *numeric, free, mandatory*

The sample size of a biota population and/or number of replicates the
[Measured value](#measured-value) represents.

### LOQ Value

`LOQ_VALUE` - *numeric, free, conditionally mandatory*

Limit of Quantification of the method, if reported.

If no [Measured value](#measured-value) is reported, at least one of an
LOQ and an LOD should be reported with value and unit; implicitly the
stressor occurrence was below the method’s ability to quantify. If a
Measured value, LOQ and/or LOD are reported, please include as many as
possible in the extracted data.

### LOQ Unit

`LOQ_UNIT` - *string, controlled, conditionally mandatory*

Unit associated with [LOQ Value](#loq-value)

If no [Measured value](#measured-value) is reported, at least one of an
LOQ and an LOD should be reported with value and unit.

Uses the [Measured Unit](#measured-unit) vocabulary.

### LOD Value

`LOD_VALUE` - *numeric, free, conditionally mandatory*

Limit of Detection of the method, if reported.

If no [Measured value](#measured-value) is reported, at least one of an
LOQ and an LOD should be reported with value and unit; implicitly the
stressor occurrence was below the method’s ability to detect. If a
Measured value, LOQ and/or LOD are reported, please include as many as
possible in the extracted data.

### LOD Unit

`LOD_UNIT` - *string, controlled, conditionally mandatory*

Unit associated with [LOD Value](#lod-value)

If no [Measured value](#measured-value) is reported, at least one of an
LOQ and an LOD should be reported with value and unit.

Uses the [Measured Unit](#measured-unit) vocabulary.

### Sampling Protocol

`SAMPLING_PROTOCOL` - *string, controlled, mandatory*

The ID of the sampling protocol used to generate the measured sample.
Foreign key referencing [protocol
ID](https://NIVANorge.github.io/eDataDRF/articles/methods_data.html#protocol-id).
Limited to sampling protocols.

### Extraction Protocol

`EXTRACTION_PROTOCOL` - *string, controlled, mandatory*

The ID of the extraction protocol used to generate the measured sample.
Foreign key referencing [protocol
ID](https://NIVANorge.github.io/eDataDRF/articles/methods_data.html#protocol-id).
Limited to extraction protocols.

### Fractionation Protocol

`FRACTIONATION_PROTOCOL` - *string, controlled, mandatory*

The ID of the fractionation protocol used to generate the measured
sample. Foreign key referencing [protocol
ID](https://NIVANorge.github.io/eDataDRF/articles/methods_data.html#protocol-id).
Limited to fractionation protocols.

### Analytical Protocol

`ANALYTICAL_PROTOCOL` - *string, controlled, mandatory*

The ID of the analytical protocol used to generate the measured sample.
Foreign key referencing [protocol
ID](https://NIVANorge.github.io/eDataDRF/articles/methods_data.html#protocol-id).
Limited to analytical protocols.

### Reference ID

`REFERENCE_ID` - *string, free, mandatory*

Identifier for data source, foreign key referencing [reference
id](https://NIVANorge.github.io/eDataDRF/articles/references_data.html#reference-id).

### Sample ID

`SAMPLE_ID` - *string, free, mandatory*

### Campaign Name Short

`CAMPAIGN_NAME_SHORT` - *string, free, mandatory*

Identifier for campaign, foreign key referencing [Short campaign
name](https://NIVANorge.github.io/eDataDRF/articles/campaign_data.html#campaign-name-short).

### Environmental Compartment

`ENVIRON_COMPARTMENT` - *string, controlled, mandatory*

Transcribed from [Environmental
Compartment](https://NIVANorge.github.io/eDataDRF/articles/samples_data.html#environmental-compartment)
in the Samples data.

### Parameter Type

`PARAMETER_TYPE` - *string, controlled, mandatory*

Transcribed from [Parameter
Type](https://NIVANorge.github.io/eDataDRF/articles/parameters_data.html#parameter-type)
in the Parameters data table..

### Measured Type

`MEASURED_TYPE` - *string, controlled, mandatory*

The type of measurement taken of the sample. Typically concentration,
but other options are provided.

#### Controlled Vocabulary

``` r
measured_types_vocabulary()
#>  [1] "Concentration"        "Dose rate"            "Dose"                
#>  [4] "Physical parameter"   "Amount"               "Volume"              
#>  [7] "Fraction of total"    "Percent"              "Irradiance"          
#> [10] "Response"             "Ecological Indicator" "Not relevant"        
#> [13] "Other"
```

### Measurement Comment

`MEASUREMENT_COMMENT` - *string, free, optional*

Space for the recording of any additional notes or comments about the
sample or measurement deemed relevant.
