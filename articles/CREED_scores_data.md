# CREED usability scores

## Introduction

[Criteria for Reporting and Evaluating Exposure Datasets
(CREED)](https://www.setac.org/resource/creed-for-use-in-environmental-assessments-a-timely-development-update.html)
is a framework for evaluating the relevance and reliability of a
reference object for a given exposure assessment question across a
series of questions. Users set criteria for it to be relevant to their
question, and use a pre-defined set of reliability criteria.

The criterion scores assigned for each criterion during the [CREED
assessment](https://NIVANorge.github.io/eDataDRF/articles/CREED_data.md)
are used to calculate an overall useability score for both Relevance and
Reliability at the gold and silver level. Silver scores are calculated
based on the highest (worst) score for all required questions, and gold
for all recommended questions. Data source usability scores are, from
high to low:

### Usability Scores

`Gold` - `Relevant/reliable without restriction`

`Gold` - `Relevant/reliable with restriction`

`Silver` - `Relevant/reliable with restriction`

`Silver` - `Relevant/reliable without restriction`

`Gold` or `Silver` - `Not usable`

This table is automatically filled out by the [eData
app](https://github.com/NIVANorge/STOPeData) during the CREED assessment
process.

``` r
library(eDataDRF)
```

``` r
initialise_CREED_scores_tibble()
#> # A tibble: 0 × 5
#> # ℹ 5 variables: REFERENCE_ID <chr>, SILVER_RELIABILITY <chr>,
#> #   SILVER_RELEVANCE <chr>, GOLD_RELIABILITY <chr>, GOLD_RELEVANCE <chr>
```

## Variables

### Reference ID

`REFERENCE_ID` - *string, free, mandatory*

Identifier for data source, foreign key referencing [reference
id](https://NIVANorge.github.io/eDataDRF/articles/references_data.html#reference-id).

### Silver Reliability

`SILVER_RELIABILITY` - *string, free, mandatory*

Silver reliability score. See [Usability Scores](#usability-scores) for
valid levels.

### Silver Relevance

`SILVER_RELEVANCE` - *string, free, mandatory*

Silver relevance score. See [Usability Scores](#usability-scores) for
valid levels.

### Gold Reliability

`GOLD_RELIABILITY` - *string, free, mandatory*

Gold reliability score. See [Usability Scores](#usability-scores) for
valid levels.

### Gold Relevance

`GOLD_RELEVANCE` - *string, free, mandatory*

Gold relevance score. See [Usability Scores](#usability-scores) for
valid levels.

## CREED Bibliography

Adam Peters, Michael Beking, Leonard Oste, Mick Hamer, Jeanne Vuaille,
Andrew J. Harford, Thomas Backhaus, Stephen Lofts, Claus Svendsen,
Charles Peck, Assessing the relevance of environmental exposure data
sets, *Integrated Environmental Assessment and Management*, Volume 20,
Issue 4, 1 July 2024, Pages 1004–1018, https://doi.org/10.1002/ieam.4881

Graham Merrington, Lisa H. Nowell, Charles Peck, An introduction to
Criteria for Reporting and Evaluating Exposure Datasets (CREED) for use
in environmental assessments, *Integrated Environmental Assessment and
Management*, Volume 20, Issue 4, 1 July 2024, Pages 975–980,
https://doi.org/10.1002/ieam.4899

Carolina Di Paolo, Irene Bramke, Jenny Stauber, Caroline Whalley, Ryan
Otter, Yves Verhaegen, Lisa H. Nowell, Adam C. Ryan, Implementation of
the CREED approach for environmental assessments, *Integrated
Environmental Assessment and Management*, Volume 20, Issue 4, 1 July
2024, Pages 1019–1034, https://doi.org/10.1002/ieam.4909

Michelle L. Hladik, Arjen Markus, Dennis Helsel, Lisa H. Nowell, Stefano
Polesello, Heinz Rüdel, Drew Szabo, Iain Wilson, Evaluating the
reliability of environmental concentration data to characterize exposure
in environmental risk assessments, *Integrated Environmental Assessment
and Management*, Volume 20, Issue 4, 1 July 2024, Pages 981–1003,
https://doi.org/10.1002/ieam.4893
