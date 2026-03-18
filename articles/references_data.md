# Reference data

## Introduction

**Reference data** captures the academic literature metadata of a data
object. The eData format is based on a subset of the
[BibTeX](https://www.bibtex.org/Format/) format, reduced to the most
relevant types (journal article, book, report, dataset) and fields. In
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
```

## Variables

### Reference ID

`REFERENCE_ID` - *string, auto-generated, mandatory*

The reference’s primary key, automatically generated from YEAR, AUTHOR,
and TITLE using
[`generate_reference_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_reference_id.md),
as follows:

``` r
generate_reference_id(
  date = 2018, # i.e. publication date
  author = "Last1, First1; Last2, First2", # Take last name of first author
  title = "A study of recent developments in the field" # Extract first three words, convert to PascalCase
)
#> [1] "2018Last1AStudyOf"
```

Reference ID is also a foreign key in [Measurement
data](https://NIVANorge.github.io/eDataDRF/articles/measurements_data.html#reference-id)
and [CREED
scores](https://NIVANorge.github.io/eDataDRF/articles/CREED_scores_data.html#reference-id).

### Reference Type

`REFERENCE_TYPE` - *string, controlled, mandatory*

The type of publication. Currently restricted to Journal Article, Book,
Report, or Dataset/Database.

### Author

`AUTHOR` - *string, free, mandatory*

The full authors list from the referenced object, formatted as
`Lastname1, Firstname1; Lastname2, Firstname2; etc.`.

### Title

`TITLE` - *string, free, mandatory*

The title of the publication or document.

### Year

`YEAR` - *integer, free, mandatory*

The year of publication or the most recent update to the referenced
object.

### Access Date

`ACCESS_DATE` - *date (ISO), free, mandatory*

The ISO date when the referenced object was accessed.

### Journal Name

`PERIODICAL_JOURNAL` - *string, free, conditional on reference type* The
name of the journal or periodical a journal article was published in.
Conditionally mandatory if [Reference Type](#reference-type) is
`Journal Article`.

### Volume

`VOLUME` - *numeric, free, optional*

The volume of a named journal an article was published in. Optional.

### Issue

`ISSUE` - *numeric, free, optional*

The issue of a named journal an article was published in. Optional.

### Publisher

`PUBLISHER` - *string, free, conditional on reference type*

The publisher of a reference object. Conditionally mandatory if
[Reference Type](#reference-type---string-controlled-mandatory) is
`Book` or `Report`.

### Institution

`INSTITUTION` - *string, free, conditional on reference type*

The primary instition responsible for a referenced object. Conditionally
mandatory if [Reference
Type](#reference-type---string-controlled-mandatory) is `Report`.

### DOI

`DOI` - *String, free, optional* If available, the Digital Object
Identifier associated with a reference object. Optional, but the
preferred identifier when avaiable.

See the website of the [doi Foundation](https://www.doi.org/) for more
information.

### URL

`URL` - *String, free, optional*

A Uniform Resource Locator (URL, i.e. web address) linking to the
referenced object, if available. Optional.

### ISBN ISSN

`ISBN_ISSN` - *String, free, optional*

An International Standard Book Number (ISBN, 10 or 13 digits) or
International Standard Serial Number (ISSN, 8 digits) associated with a
book or periodical. Optional.

### Edition

`EDITION` - *String, free, optional*

The edition of a referenced object, if relevant. Optional.

### Document Number

`DOCUMENT_NUMBER` - *String, free, optional*

A document or report number, typically available for reports and other
official documents. Optional.

### Reference Comment

`REF_COMMENT` - *String, free, optional*

Space for the recording of any additional notes or comments about the
reference deemed relevant.
