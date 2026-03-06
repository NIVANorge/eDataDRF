# Generate Reference ID

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
