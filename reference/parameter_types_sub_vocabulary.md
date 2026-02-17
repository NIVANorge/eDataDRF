# Parameter type sub-categories controlled vocabulary

Returns controlled vocabulary options for parameter type subcategories.

## Usage

``` r
parameter_types_sub_vocabulary()
```

## Value

A character vector of parameter type subcategory options

## Details

Provides more specific classifications derived from the dummy parameters
dataset. The list is dynamically generated from unique
PARAMETER_TYPE_SUB values and includes options such as:

Mixture

Not reported

All unique sub-types from dummy_parameters_vocabulary() (e.g., Carbon,
Inorganic compounds, Organic compounds, etc.)

## See also

Other parameter:
[`dummy_parameters_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/dummy_parameters_vocabulary.md),
[`initialise_parameters_tibble()`](https://NIVANorge.github.io/eDataDRF/reference/initialise_parameters_tibble.md),
[`measured_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/measured_types_vocabulary.md),
[`parameter_types_vocabulary()`](https://NIVANorge.github.io/eDataDRF/reference/parameter_types_vocabulary.md)
