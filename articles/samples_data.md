# Samples data

## Introduction

*Samples data* records relevant combinations of sampling variables. Most
sampling campaigns are asymmetric - that is, not every possible
combination of sites, date, parameter, and compartment will be sampled.
When resources are limited, it makes sense to look for things in places
where they are most likely to be found; a campaign will probably not
look for hydrophobic stressors in water and hydrophilic stressors in
fatty tissue. Depending on the stressors of interest, it may also be the
case that not all sites, dates, etc. reported in a source are relevant
to the extraction. In any case, capturing all relevant sample
combinations is often more challenging than previous modules. However,
it is an important step to prevent the Measurements data table being
filled with invalid combinations that were never actually sampled.

The Samples data table references Sites data (via Site code), Parameter
data (via Parameter name) and Compartments data (via Environmental
compartment, Environmental sub-compartment, and Measured category).
These three foreign keys are combined with relevant Sampling dates
(entered manually), and potentially, Subsamples, to generate a full
listing of all relevant samples. In particular, the Subsample variable
allows the recording of cases where the same sampling may have been
repeated (replicates), or a single sample may be split for analysis
(sediment cores, biota tissue, etc.).

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

## Variables

### Site Code

`SITE_CODE` - *string, free, mandatory*

[Site
Code](https://NIVANorge.github.io/eDataDRF/articles/sites_data.html#site-code)
is a foreign key that references the [Sites data
table](https://NIVANorge.github.io/eDataDRF/articles/sites_data.md).
During Samples table creation the user selects relevant sites using
their code and name.

### Site Name

`SITE_NAME` - *string, free, mandatory*

[Site
Name](https://NIVANorge.github.io/eDataDRF/articles/sites_data.html#site-name)
is included alongside Site code to improve the readability of the
Samples table. However, it is not used as a foreign key.

### Parameter Name

`PARAMETER_NAME` - *string, controlled, mandatory*

[Parameter
name](https://NIVANorge.github.io/eDataDRF/articles/parameters_data.html#parameter-name)
is a foreign key that references the [Parameter data
table](https://NIVANorge.github.io/eDataDRF/articles/parameter_data.md).
During Samples table creation the user selects relevant parameters using
their name and type.

### Parameter Type

`PARAMETER_TYPE` - *string, controlled, mandatory*

[Parameter
type](https://NIVANorge.github.io/eDataDRF/articles/parameters_data.html#parameter-type)
is included alongside Site code to improve the readability of the
Samples table. However, it is not used as a foreign key.

### Environmental Compartment

`ENVIRON_COMPARTMENT` - *string, controlled, mandatory*

Combinations of [Environmental
Compartment](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.html#environmental-compartment),
[Environmental
Sub-Compartment](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.html#environmental-sub-compartment),
and [Measured
Category](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.html#measured-category)
are used as a composite foreign key that references the [Compartments
data
table](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.md).

### Environmental Sub-Compartment

`ENVIRON_COMPARTMENT_SUB` - *string, controlled, mandatory*

Combinations of [Environmental
Compartment](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.html#environmental-compartment),
[Environmental
Sub-Compartment](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.html#environmental-sub-compartment),
and [Measured
Category](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.html#measured-category)
are used as a composite foreign key that references the [Compartments
data
table](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.md).

### Measured Category

`MEASURED_CATEGORY` - *string, controlled, mandatory*

Combinations of [Environmental
Compartment](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.html#environmental-compartment),
[Environmental
Sub-Compartment](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.html#environmental-sub-compartment),
and [Measured
Category](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.html#measured-category)
are used as a composite foreign key that references the [Compartments
data
table](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.md).

### Sampling Date

`SAMPLING_DATE` - *date (ISO), free, mandatory*

The date a sample was taken. This should be reported to the highest
degree of date precision possible (time is not needed). However, if day
or month is not avaiable, it can be reported as the first day of a
reported month or year. In this case, please note this in the
[Measurement comment](#todo:%20add%20link) section.

### Subsample

`SUBSAMPLE` - *string, free, mandatory*

Where a single sampling event is subsampled, use this variable to note
it. In the eData GUI, the user is asked to enter a comma-separated
string of subsample names (e.g. `"core 1cm, core 2cm, core 3cm"`); this
is then used to split the relevant sample into three subsamples with
different variable names. If the format is being used manually, please
split rows manually. Any relevant identifier can be used to identify
different subsamples, but a short, descriptive value is preferred.

### Subsample ID

`SUBSAMPLE_ID` - *string, free, mandatory*

A Subsample ID is generated for each subsample based on its identifying
characteristics.

Actually, no it isn’t. Not used.

### Sample ID

`SAMPLE_ID` - *string, free, mandatory*

Actually this includes subsample;

e.g.:`DummyCampaign1997_SITE_001-Tim-Notreported-2023-02-12-R-1`
