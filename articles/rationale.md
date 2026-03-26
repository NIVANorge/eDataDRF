# FAQ

The eData Data Reporting Format is a format for the standardisation of
data on pollutant occurrence in the environment. By converting this data
to a single, consistent format, it makes it easier to validate, compare,
analyse, and reuse, in line with the [FAIR
principles](https://www.go-fair.org/fair-principles/).

## Why standardise?

These data are typically published as concentrations (in water) or mass
ratios (in soil, sludge and biota). Fully interpreting these
measurements requires considerable metadata, relating to the time,
place, conditions, methodology, and context of sampling. However, no
single standard exists for these metadata, and study authors and
sampling teams tend to use a variety of inconsistent definitions, units,
and schema depending on their scientific domain and the study’s
individual needs.

This is not, in itself a problem. However, as environmental risk
assessment becomes more data-based and larger scale, the need to use and
re-use large quantities of data increases. When these datasets are
consistent, validated, and interoperable, much time can be saved. When
they are not, researchers much go through the tedious process of
understanding, validating and remapping by hand; an often
non-reproducible process. Thus a harmonised format - and associated
validation and formatting functions - can represent a significant
timesaver for anyone in such a position.

## Why aquatic toxicology?

Starting with a field we know well allows us to test the effectiveness
of the underlying design philosophy and technology.

## Why an R package?

Although an R package is not a conventional form for a data structure,
as our extraction, analysis, workflow is heavily R-based it was a
pragmatic choice. By using the existing package architecture, it was
possible to integrate the format closely with downstream tools, and use
existing package dependencies and versioning to keep them updated as the
format changes. In future, we plan to extend the format to other forms.

## Who supported this work?

We gratefully acknowledge the assistance and input of Kim Leirvik, Li
Xi, Camden Karon Klefbom, Pierre Blévin, Anna Maria Hatland, Sophie
Mentzel, Viviane Giradin, and the members of the PARC Project P7.2.2
team in the creation of this format.

This work is supported by the Research Council of Norway (RCN-315969
EXPECT), EU-HEU-101057014 Project “PARC”, and NIVA’s Computational
Toxicology Program (NCTP, RCN-160016).

We gratefully thank the developers and contributors to the following
software used in this work: R v. 4.5.3 and the following R packages:
arrow v. 23.0.1.1, cpp11 v. 0.5.3, crsuggest v. 0.4, glue v. 1.8.0,
grateful v. 0.3.0, gt v. 1.3.0, ISOcodes v. 2025.5.18, knitr v. 1.51,
pointblank v. 0.12.3, quarto v. 1.5.1, rmarkdown v. 2.30, testthat v.
3.3.2, tidyselect v. 1.2.1, tidyverse v. 2.0.0, zip v. 2.3.3.

## Declaration of Generative AI Use

The Claude family of Large Language Models was used in the creation of
the package for the generation of boilerplate and some R code.
