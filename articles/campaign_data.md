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

### Campaign Name Short - String, free (\>= 40 characters), mandatory

`CAMPAIGN_NAME_SHORT`

A short, terse identifier for the campaign. This is used as a primary
key for Campaign data and a foreign key in [Measurements
data](https://NIVANorge.github.io/eDataDRF/articles/measurements_data.md).
No format is enforced beyond the character limit, but it is rcommended
to use PascalCase to maximise character efficiency and readability.

### Campaign Name - String, free, mandatory

`CAMPAIGN_NAME`

Hey, this actually has a character limit. Who knew!

### Campaign Start Date - Date (ISO), free, mandatory

`CAMPAIGN_START_DATE`

The date when a sampling campaign began; the first reported sampling
date. In rare cases reference objects may not report this. In such
cases, record an approximate date and note the issue in [Campaign
Comments](#campaign-comment---string-free-optional).

### Campaign End Date - Date (ISO), free, optional

`CAMPAIGN_END_DATE`

If avaiable, the last sampling date of the campaign.

### Organisation - String, free, mandatory

`ORGANISATION`

The primary organisation responsible for conducting the campaign. In the
case of academic publications, this is typically the lead author’s
primary employer.

### Entered By - String, free, mandatory

`ENTERED_BY`

The name or email address of the user entering data.

### Entered Date - Date (ISO), free, mandatory

`ENTERED_DATE`

The date that campaign data were entered.

### Campaign Comment - String, free, optional

`CAMPAIGN_COMMENT`

Space for the recording of any additional notes or comments about the
campaign deemed relevant.
