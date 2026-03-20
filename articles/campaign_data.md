# Campaign data

## Introduction

**Campaign data** is intended to track social and institutional factors
behind a sample that are not otherwise captured by citations/references.
Routine environmental monitoring is frequently conducted by private and
public sector authorities, but may not have any formal academic
literature metadata (see
[References](https://NIVANorge.github.io/eDataDRF/articles/references_data.md)).

``` r
library(eDataDRF)
```

``` r
initialise_campaign_tibble()
#> # A tibble: 0 × 8
#> # ℹ 8 variables: CAMPAIGN_NAME_SHORT <chr>, CAMPAIGN_NAME <chr>,
#> #   CAMPAIGN_START_DATE <date>, CAMPAIGN_END_DATE <date>, ORGANISATION <chr>,
#> #   ENTERED_BY <chr>, ENTERED_DATE <date>, CAMPAIGN_COMMENT <chr>
```

## Variables

### Campaign Name Short

`CAMPAIGN_NAME_SHORT` - *string, free (\>= 40 characters), mandatory*

A short, terse identifier for the campaign. This is used as a primary
key for Campaign data and a foreign key in [Measurements
data](https://NIVANorge.github.io/eDataDRF/articles/measurements_data.md)
and [Methods
data](https://NIVANorge.github.io/eDataDRF/articles/methods_data.md). No
format is enforced beyond the character limit, but it is recommended to
use PascalCase to maximise character efficiency and readability.

### Campaign Name

`CAMPAIGN_NAME` - *string, free, mandatory*

A full descriptive name for the campaign.

### Campaign Start Date

`CAMPAIGN_START_DATE` - *date (ISO), free, mandatory*

The date when a sampling campaign began; the first reported sampling
date. In rare cases reference objects may not report this. In such
cases, record an approximate date and note the issue in [Campaign
Comments](#campaign-comment).

### Campaign End Date

`CAMPAIGN_END_DATE` - *date (ISO), free, optional*

If available, the last sampling date of the campaign.

### Organisation

`ORGANISATION` - *string, free, mandatory*

The primary organisation responsible for conducting the campaign. In the
case of academic publications, this is typically the lead author’s
primary employer.

### Entered By

`ENTERED_BY` - *string, free, mandatory*

The name or email address of the user entering data.

### Entered Date

`ENTERED_DATE` - *date (ISO), free, mandatory*

The date that campaign data were entered.

### Campaign Comment

`CAMPAIGN_COMMENT` - *string, free, optional*

Space for the recording of any additional notes or comments about the
campaign deemed relevant.
