# Reference data

## Introduction

For academic publications, standard citation formats are generally
sufficient. The eData format is based on a subset of the
[BibTeX](https://www.bibtex.org/Format/) format, reduced to the most
relevant types (hournal article, book, report, dataset) and fields. In
other cases, [Campaign
data](https://NIVANorge.github.io/eDataDRF/articles/campaign_data.md)
may be more relevant; in this case, much of the references data can be
left blank.

``` r
library(eDataDRF)
```

``` r
initialise_references_tibble()
#> # A tibble: 0 × 18
#> # ℹ 18 variables: REFERENCE_ID <chr>, REFERENCE_TYPE <chr>, DATA_SOURCE <chr>,
#> #   AUTHOR <chr>, TITLE <chr>, YEAR <int>, ACCESS_DATE <date>,
#> #   PERIODICAL_JOURNAL <chr>, VOLUME <int>, ISSUE <int>, PUBLISHER <chr>,
#> #   INSTITUTION <chr>, DOI <chr>, URL <chr>, ISBN_ISSN <chr>, EDITION <chr>,
#> #   DOCUMENT_NUMBER <chr>, REF_COMMENT <chr>

reference_character_limits()
#> $DOCUMENT_NUMBER
#> [1] 200
#> 
#> $DOI
#> [1] 200
#> 
#> $EDITION
#> [1] 200
#> 
#> $INSTITUTION
#> [1] 200
#> 
#> $ISBN_ISSN
#> [1] 200
#> 
#> $PERIODICAL_JOURNAL
#> [1] 200
#> 
#> $PUBLISHER
#> [1] 200
#> 
#> $REF_COMMENT
#> [1] 1000
#> 
#> $URL
#> [1] 200
```

### Variables

## Reference ID - String, auto-generated, mandatory

`REFERENCE_ID`

The reference’s primary key, automatically generated from YEAR, AUTHOR,
and TITLE using
[`generate_reference_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_reference_id.md),
as follows:

``` r
# eDataDRF::generate_reference_id(
#   date = 2018, # i.e. publication date
#   author = "Last1, First1; Last2, First2", # Take last name of first author
#   title = "A study of recent developments in the field" # Extract first three words, convert to PascalCase
# )
```

Reference ID is also a foreign key in [Measurement
data](https://NIVANorge.github.io/eDataDRF/articles/measurements_data.md).

## Reference Type - String, controlled, mandatory

`REFERENCE_TYPE`

## Author - String, free, mandatory

`AUTHOR`

The full authors list from the referenced object, formatted as
`Lastname1, Firstname1; Lastname2, Firstname2; etc.`.

## Title - String, free, mandatory

`TITLE`

The title of the publication or document.

## Year - Integer, free, mandatory

`YEAR`

The year of publication or the most recent update to the referenced
object.

## Access Date - Date (ISO), free, mandatory

`ACCESS_DATE`

The ISO date when the referenced object was accessed.

## Journal Name - String, free, conditional on reference type

`PERIODICAL_JOURNAL`

The name of the journal or periodical a journal article was published
in. Conditionally mandatory if [Reference
Type](#reference-type---string-controlled-mandatory) is
`Journal Article`.

## Volume - Numeric, free, optional

`VOLUME`

The volume of a named journal an article was published in. Optional.

## Issue - Numeric, free, optional

`ISSUE`

The issue of a named journal an article was published in. Optional.

## Publisher - String, free, conditional on reference type

`PUBLISHER`

The publisher of a reference object. Conditionally mandatory if
[Reference Type](#reference-type---string-controlled-mandatory) is
`Book` or `Report`.

## Institution - String, free, conditional on reference type

`INSTITUTION`

The primary instition responsible for a referenced object. Conditionally
mandatory if [Reference
Type](#reference-type---string-controlled-mandatory) is `Report`.

## DOI - String, free, optional

`DOI`

If available, the Digital Object Identifier associated with a reference
object. Optional, but the preferred identifier when avaiable.

See the website of the [doi Foundation](https://www.doi.org/) for more
information.

## URL - String, free, optional

`URL`

A Uniform Resource Locator (URL, i.e. web address) linking to the
referenced object, if available. Optional.

## ISBN ISSN - String, free, optional

`ISBN_ISSN`

An International Standard Book Number (ISBN, 10 or 13 digits) or
International Standard Serial Number (ISSN, 8 digits) associated with a
book or periodical. Optional.

## Edition - String, free, optional

`EDITION`

The edition of a referenced object, if relevant. Optional.

## Document Number - String, free, optional

`DOCUMENT_NUMBER`

A document or report number, typically available for reports and other
official documents. Optional.

## Reference Comment - String, free, optional

`REF_COMMENT`

Space for the recording of any additional notes or comments about the
reference deemed relevant.
