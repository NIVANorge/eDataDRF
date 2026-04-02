# CREED data

## Introduction

[Criteria for Reporting and Evaluating Exposure Datasets
(CREED)](https://www.setac.org/resource/creed-for-use-in-environmental-assessments-a-timely-development-update.html)
is a framework for evaluating the relevance and reliability of a
reference object for a given exposure assessment question across a
series of questions. Users set criteria for it to be relevant to their
question, and use a pre-defined set of reliability criteria.

The object is evaluated based on its data availability, precision,
choice of methods, and a final score is calculated for both its
relevance and reliability based on its useability at “Gold” and “Silver”
levels of quality. This table collects the relevant data from non-CREED
tables selected by the user or an automated data population process, the
user-appraised scores, and any limitations the user chooses to comments
on. In the data export process, the below functions are used to create
two .CSV files: one for reliability and one for relevance. Scores are
used to calculate a [CREED
score](https://NIVANorge.github.io/eDataDRF/articles/CREED_scores_data.md);
the highest value for each Gold and Silver Reliability and Relevance
score (0-4) is used to generate the overall score per category.

For example, if a data source scored `1`, `2`, `2` for Silver/Required
Reliability and `4`, `2` and `1` for Gold/Recommended Reliability, the
final score would be 2 for Silver/Required Reliability and 4 for
Gold/Recommended Reliability, which would translate into Silver
Reliability “Reliable with Restrictions” and Gold Reliability “Not
usable”.

This table is not intended to be used as a final data product, but is
included in the format because it provides traceability on how the CREED
score was calculated. Because a large part of the evaluation logic is
included in the [eData app](https://github.com/NIVANorge/STOPeData),
this table is currently just a container with little relevant
information. It is planned to migrate this logic to the eDataDRF in
future.

``` r
library(eDataDRF)
```

``` r
initialise_CREED_data_tibble()
#> # A tibble: 0 × 6
#> # ℹ 6 variables: criterion_id <chr>, criterion_title <chr>,
#> #   required_recommended <chr>, relevant_data <chr>, score <chr>,
#> #   limitations <chr>
```

## Variables

### Criterion ID

`criterion_id` - *string, free, mandatory*

A alphanumeric serial identifier for CREED’s relevance (`RV1` - `RV11`)
and reliability (`RB1` - `RB19`) criteria.

### Criterion Title

`criterion_title` - *string, free, mandatory*

A short, descriptive title for the domain of the criterion, e.g. “Sample
Medium/Matrix”.

### Required or Recommended

`required_recommended` - *string, free, mandatory*

Whether the criterion is required (in which case it will be used to
calculate a silver score), or recommended (gold score).

### Relevant Data

`relevant_data` - *string, free, mandatory*

Any relevant data provided by the auto-population process or the user.
For example:

    1 compartment: Aquatic (Freshwater)

    3 protocols:
    Sampling Protocol - Point
    Extraction Protocol - Not reported
    Fractionation Protocol - Not reported

### Score

`score` - *string, free, mandatory*

An assessment score based on the extent to which the data object
fulfills each criterion. Criterion scores are stored as a named vector
of numbers. A lower score (1) is better, a higher score (4) is worse.
Note that there are five possible responses but only four numerical
scores - both Not Applicable and Fully Met are considered a full pass
(1).

``` r
CREED_choices_vocabulary()
#>      Not Met    Fully Met   Partly Met Not Reported Not Relevant 
#>            4            1            2            3            1
```

### Limitations

`limitations` - *string, free, mandatory*

Any limitations, caveats, or other relevant comments identified by the
user conducting the assessment.

## Example CREED Assessments

Example CREED relevance and reliability assessments of example data are
provided below, for reference.

### CREED Relevance

``` r
example_CREED_relevance_tibble() |>
  dplyr::mutate(relevant_data = stringr::str_replace_all(relevant_data, "\n", "<br>")) |>
  gt::gt() |>
  gt::fmt_markdown(columns = relevant_data)
```

[TABLE]

### CREED Reliability

``` r
example_CREED_reliability_tibble() |>
  dplyr::mutate(relevant_data = stringr::str_replace_all(relevant_data, "\n", "<br>")) |>
  gt::gt() |>
  gt::fmt_markdown(columns = relevant_data)
```

[TABLE]

## CREED Bibliography

Adam Peters, Michael Beking, Leonard Oste, Mick Hamer, Jeanne Vuaille,
Andrew J. Harford, Thomas Backhaus, Stephen Lofts, Claus Svendsen,
Charles Peck, Assessing the relevance of environmental exposure data
sets, *Integrated Environmental Assessment and Management*, Volume 20,
Issue 4, 1 July 2024, Pages 1004–1018,
<https://doi.org/10.1002/ieam.4881>

Graham Merrington, Lisa H. Nowell, Charles Peck, An introduction to
Criteria for Reporting and Evaluating Exposure Datasets (CREED) for use
in environmental assessments, *Integrated Environmental Assessment and
Management*, Volume 20, Issue 4, 1 July 2024, Pages 975–980,
<https://doi.org/10.1002/ieam.4899>

Carolina Di Paolo, Irene Bramke, Jenny Stauber, Caroline Whalley, Ryan
Otter, Yves Verhaegen, Lisa H. Nowell, Adam C. Ryan, Implementation of
the CREED approach for environmental assessments, *Integrated
Environmental Assessment and Management*, Volume 20, Issue 4, 1 July
2024, Pages 1019–1034, <https://doi.org/10.1002/ieam.4909>

Michelle L. Hladik, Arjen Markus, Dennis Helsel, Lisa H. Nowell, Stefano
Polesello, Heinz Rüdel, Drew Szabo, Iain Wilson, Evaluating the
reliability of environmental concentration data to characterize exposure
in environmental risk assessments, *Integrated Environmental Assessment
and Management*, Volume 20, Issue 4, 1 July 2024, Pages 981–1003,
<https://doi.org/10.1002/ieam.4893>
