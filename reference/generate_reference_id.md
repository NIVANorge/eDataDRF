# Generate compact reference ID (YYYYLNameFirstThreeWords) for `REFERENCE_ID` in References table

Creates a compact reference identifier by combining the publication
year, first author's last name, and the first three words of the title
in PascalCase.

## Usage

``` r
generate_reference_id(date, author, title)
```

## Arguments

- date:

  Integer or character. Publication year (e.g. `2018`).

- author:

  Character. Semicolon-separated author list in "Last, First" format.
  Only the first author's last name is used (truncated to 10
  alphanumeric characters).

- title:

  Character. Publication title. The first three words are extracted and
  converted to PascalCase.

## Value

Character string with format `YearLastnameTitleWords`, e.g.
`"2018Last1AStudyOf"`.

## See also

Other generate_id:
[`abbreviate_string()`](https://NIVANorge.github.io/eDataDRF/reference/abbreviate_string.md),
[`generate_protocol_id()`](https://NIVANorge.github.io/eDataDRF/reference/generate_protocol_id.md),
[`generate_sample_id_with_components()`](https://NIVANorge.github.io/eDataDRF/reference/generate_sample_id_with_components.md),
[`protocol_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/protocol_id_regex.md),
[`sample_id_regex()`](https://NIVANorge.github.io/eDataDRF/reference/sample_id_regex.md)

Other reference:
[`example_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/example_references_tibble.md),
[`initialise_references_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_references_tibble.md)

## Examples

``` r
generate_reference_id(
  date = 2018,
  author = "Last1, First1; Last2, First2",
  title = "A study of recent developments in the field"
)
#> [1] "2018Last1AStudyOf"
# Returns: "2018Last1AStudyOf"
```
