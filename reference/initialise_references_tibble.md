# Initialise references tibble

Creates an empty tibble with the standardised column structure for
reference data.

## Usage

``` r
initialise_references_tibble()
```

## Value

A tibble with 0 rows and standardised reference columns

## Details

References provide bibliographic information for data sources including
journals, reports, datasets, and other published materials. The tibble
includes the following columns:

REFERENCE_ID: Unique identifier for the reference (Primary Key)

REFERENCE_TYPE: Type of publication (Journal Article, Report, Dataset,
etc.)

DATA_SOURCE: Whether reference is source of data (Primary,
Secondary/Review, Other)

AUTHOR: Author(s) of the reference

TITLE: Title of the publication or document

YEAR: Publication year

ACCESS_DATE: Date when the reference was accessed or retrieved

PERIODICAL_JOURNAL: Name of the journal or periodical

VOLUME: Volume number of the journal

ISSUE: Issue number of the journal

PUBLISHER: Publisher of the document

INSTITUTION: Institution associated with the publication

DOI: Digital Object Identifier

URL: Web address for online access

ISBN_ISSN: ISBN or ISSN identifier

EDITION: Edition of the publication

DOCUMENT_NUMBER: Document or report number

REF_COMMENT: Additional notes about the reference

See
[`vignette("references_data")`](https://NIVANorge.github.io/eDataDRF/articles/references_data.md)
for more information.

## See also

Other initialise_tibble:
[`initialise_CREED_data_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_data_tibble.md),
[`initialise_CREED_scores_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_CREED_scores_tibble.md),
[`initialise_biota_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_biota_tibble.md),
[`initialise_campaign_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_campaign_tibble.md),
[`initialise_compartments_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_compartments_tibble.md),
[`initialise_measurements_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_measurements_tibble.md),
[`initialise_methods_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_methods_tibble.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`initialise_samples_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_samples_tibble.md),
[`initialise_sites_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_sites_tibble.md)

Other reference:
[`example_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_references_tibble.md),
[`generate_reference_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_reference_id.md),
[`reference_character_limits()`](https://NIVANorge.github.io/eDataDRF/reference/reference_character_limits.md)
