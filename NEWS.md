# eDataDRF (0.0.0.9006)

* Chemical parameters now come from the National Toxicology Program's NICE Chemical Taxonomies dataset (v1.1, ICE v4.1.1, Feb. 2025), filtered to substances in EPA ECOTOX plus Vannmiljø (15,871 substances, up from 15,130). 
* Updated Roxygen version.

# eDataDRF 0.0.0.9005

* Minor changes to vignettes and documentation

# eDataDRF 0.0.0.9004

* Includes range of `example_*_tibble()` functions to create passing environmental data
* Validation functions added for each table type: `pb_validate_*`
* Added validation, rationale vignettes
* More information on CREED
* Tests now check that example data passes validation as part of package build process

# eDataDRF 0.0.0.9000

* Initial release
* Table initialisation functions for campaign, sites, parameters, etc.
* Controlled vocabulary for environmental compartments, species, protocols
* Utility functions for ID generation and data export