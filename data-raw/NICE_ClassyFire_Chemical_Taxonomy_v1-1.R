## code to prepare `NICE_ClassyFire_Chemical_Taxonomy_v1-1.parquet` dataset
##
## Source
## The National Toxicology Program's NICE (NTP Integrated Chemical Environment)
## "Chemical Taxonomies" dataset, v1.1, from the Chemical/Chemical Properties
## section of https://ice.ntp.niehs.nih.gov/DATASETDESCRIPTION
## (ICE v4.1.1, Feb. 2025; downloaded 2026-10-30). The file is a structure-based,
## automated ClassyFire/ChemOnt taxonomy (Djoumbou Feunang et al. 2016,
## doi:10.1186/s13321-016-0174-y), computed for all chemicals in DSSTox
## (Date_Extracted Oct/Dec 2024).
##
## Place the downloaded file at data-raw/ChemicalTaxonomies_v1.1.txt (it is
## 445 MB, so is git-ignored and not shipped with the package).
##
## Processing
## The full file (1,125,205 substances) is far too big to distribute, so it is
## filtered to substances (matched by CAS RN) that are in either:
##   - the EPA ECOTOX database (inst/extdata/ecotox_2025_06_12_chemicals.parquet), or
##   - the Vannmiljø database (Miljødirektoratet public API, GetParameters)
## and reduced to the columns used by `parameters_vocabulary()`.
##
## Output: inst/extdata/NICE_ClassyFire_Chemical_Taxonomy_v1-1.parquet

library(tidyverse)
library(data.table)
library(arrow)
library(httr2)

raw_path <- "data-raw/ChemicalTaxonomies_v1.1.txt"
out_path <- "inst/extdata/NICE_ClassyFire_Chemical_Taxonomy_v1-1.parquet"

# Exploration ----

# Inspect the first few lines
readLines(raw_path, n = 5)

# tab-separated
classyfire_data_full <- data.table::fread(raw_path)

glimpse(classyfire_data_full)
# Rows: 1,125,205
# Columns: 24

# Does it contain Meclizine? (because the parameter_vocabulary we used previously doesn't)
classyfire_data_full |>
  dplyr::filter(
    InChiKey == "OCJYIGYOJCODJL-UHFFFAOYSA-N" |
      CASRN == "569-65-3" |
      Chemical_Name == "Meclizine"
  )

# Yes, it does. So presumably the reason that our vocabulary doesn't contain Meclizine is that it wasn't
# in the ecotox dataset we used for shortlisting
ecotox_shortlist <- read_parquet(
  "inst/extdata/ecotox_2025_06_12_chemicals.parquet"
)
glimpse(ecotox_shortlist)

ecotox_shortlist |>
  dplyr::filter(
    CAS_RN == "569-65-3" |
      PARAMETER_NAME == "Meclizine"
  )

# There are 1,125,205 rows of chemicals in the full dataset. Saved as parquet with just a few
# columns it would be ~60 MB, which is too big to distribute as part of the package. But the
# ecotox_shortlist is, while thematically relevant, clearly too small - if we assume that
# Vannmiljø is a more-or-less representative source of chemical monitoring. So, add everything
# in Vannmiljø, by CAS, to the shortlist.

# Vannmiljø substances ----

# from https://vannmiljoapi.miljodirektoratet.no/swagger/ui/index#!/Public/Public_GetParameters
# curl -X GET --header 'Accept: text/json' 'https://vannmiljoapi.miljodirektoratet.no/api/Public/GetParameters'
# this is public, so we don't need an API key
req_vm <- request(
  "https://vannmiljoapi.miljodirektoratet.no"
) |>
  req_url_path("/api/Public/GetParameters") |>
  req_headers(Accept = "text/json")
resp <- req_vm |> req_perform()
resp

# for whatever reason, this expects to get "application/json", but
# if we suppress the check it parses fine
parameters_vm <- resp |>
  resp_body_json(check_type = FALSE) |>
  bind_rows() # convert to tibble
nrow(parameters_vm) # 3186 substances at time of writing (2026-10-30)

# Filter ----

substance_shortlist <- c(ecotox_shortlist$CAS_RN, parameters_vm$CASnr) |>
  unique() |>
  na.omit()

classyfire_ecotox_plus_vm <- classyfire_data_full |>
  as_tibble() |>
  filter(CASRN %in% substance_shortlist) |>
  # a CAS can appear more than once in the full file (1 case at time of writing)
  distinct(CASRN, .keep_all = TRUE)
nrow(classyfire_ecotox_plus_vm)

# does it now contain Meclizine?
classyfire_ecotox_plus_vm |>
  filter(if_any(everything(), ~ str_detect(.x, "[mM]eclizine")))
# outstanding

# Format for parameters_vocabulary() ----

# PARAMETER_TYPE_SUB is the ClassyFire Superclass (27 values, suitable for a drop-down).
# Finer levels (Class, Subclass, ...) are deliberately not included.
classyfire_vocabulary <- classyfire_ecotox_plus_vm |>
  transmute(
    PARAMETER_NAME = Chemical_Name,
    CAS_RN = CASRN,
    INCHIKEY_SD = InChiKey,
    PARAMETER_TYPE = "Stressor",
    PARAMETER_TYPE_SUB = Superclass
  ) |>
  arrange(PARAMETER_NAME)

write_parquet(classyfire_vocabulary, out_path)
file.size(out_path) / 1024^2
# <1 MB
