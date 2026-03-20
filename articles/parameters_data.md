# Parameters data

## Introduction

**Parameters data** collects information on stressors, quality
parameters, and any other scalar properties measured in the context of
adverse environmental effect.

``` r
library(eDataDRF)
```

``` r
initialise_parameters_tibble()
#> # A tibble: 0 × 10
#> # ℹ 10 variables: PARAMETER_TYPE <chr>, PARAMETER_TYPE_SUB <chr>,
#> #   MEASURED_TYPE <chr>, PARAMETER_NAME <chr>, PARAMETER_NAME_SUB <chr>,
#> #   INCHIKEY_SD <chr>, PUBCHEM_CID <int>, CAS_RN <chr>, ENTERED_BY <chr>,
#> #   PARAMETER_COMMENT <chr>
```

It is expected that most relevant studies will be collecting data on
chemical pollutants in the environment. Non-chemicals are accommodated
by the format, but they cannot necessarily be as well-characterised as
chemicals, where we are able to take advantage of the high-quality
infrastructure developed by chemists.

## Variables

### Parameter Type

`PARAMETER_TYPE` - *string, controlled, mandatory*

Parameter type is divided into five classifications and two missing data
values. This classification requires a degree of subjective judgement.
What makes a chemical a stressor versus a quality parameter is not
always clear. However, we anticipate that in most cases this will be
uncontroversial. Where this is not the case stressors can still be
identified by name/id.

#### Controlled Vocabulary

``` r
parameter_types_vocabulary()
#> [1] "Not relevant"         "Stressor"             "Quality parameter"   
#> [4] "Normalisation"        "Background"           "Ecological Indicator"
#> [7] "Other"
```

`"Not relevant"` - Use when a type is not applicable to the measured
scalar.

`"Stressor"` - Chemical, physical or biological agent causing stress.

`"Quality parameter"` - Water/environmental quality parameter.

`"Normalisation"` - Parameter used for normalising other measurements.

`"Background"` - Natural background level of a parameter.

`"Ecological Indicator"` - Parameter is an indicator or metric of
ecological concern.

`"Other"` - Parameter belongs to another category. Please note in
comments field.

### Parameter Sub-type

`PARAMETER_TYPE_SUB` - *string, controlled, mandatory*

Parameter Sub-type is a further subdivision of [Parameter
Type](#parameter-type). The majority of subtypes are chemical
classifications from the
[ChemOnt/ClassyFire](https://pmc.ncbi.nlm.nih.gov/articles/PMC5096306/)
chemical taxonomy; other subtypes are intended for use with quality
parameters, stressors measured as mixtures, or other cases where
additional details are needed. Existing parameters in the format are
already assigned a subtype, new parameters should be assigned to a
relevant subtype.

#### Controlled Vocabulary

``` r
parameter_types_sub_vocabulary()
#>  [1] "Not relevant"                             
#>  [2] "Not reported"                             
#>  [3] "Other"                                    
#>  [4] "Acetylides"                               
#>  [5] "Alkaloids and derivatives"                
#>  [6] "Allenes"                                  
#>  [7] "Benzenoids"                               
#>  [8] "Carbon"                                   
#>  [9] "Conductivity"                             
#> [10] "Dissolved oxygen"                         
#> [11] "Homogeneous metal compounds"              
#> [12] "Homogeneous non-metal compounds"          
#> [13] "Hydrocarbon derivatives"                  
#> [14] "Hydrocarbons"                             
#> [15] "Inorganic salts"                          
#> [16] "Lignans, neolignans and related compounds"
#> [17] "Lipids and lipid-like molecules"          
#> [18] "Miscellaneous inorganic compounds"        
#> [19] "Mixed metal/non-metal compounds"          
#> [20] "Mixture"                                  
#> [21] "Nucleosides, nucleotides, and analogues"  
#> [22] "Nutrient"                                 
#> [23] "Organic 1,3-dipolar compounds"            
#> [24] "Organic acids and derivatives"            
#> [25] "Organic nitrogen compounds"               
#> [26] "Organic oxygen compounds"                 
#> [27] "Organic Polymers"                         
#> [28] "Organic salts"                            
#> [29] "Organohalogen compounds"                  
#> [30] "Organoheterocyclic compounds"             
#> [31] "Organometallic compounds"                 
#> [32] "Organophosphorus compounds"               
#> [33] "Organosulfur compounds"                   
#> [34] "pH"                                       
#> [35] "Phenylpropanoids and polyketides"         
#> [36] "Salinity"                                 
#> [37] "Temperature"                              
#> [38] "Total organic carbon"                     
#> [39] "Turbidity"
```

### Parameter Name

`PARAMETER_NAME` - *string, controlled, mandatory*

Parameter name records the reported name of a measured parameter. In the
majority of cases this will be a short-form conventional chemical name;
these are, as above taken from
[ChemOnt/ClassyFire](https://pmc.ncbi.nlm.nih.gov/articles/PMC5096306/).
To maximise standardisation we recommend use of the existing available
names rather than entering new ones; this may require some manual
validation of CAS codes, InChIKeys, etc.

Parameter name is currently used as the primary key for the Parameters
data table and a foreign key in the Samples and Measurements tables.

#### Controlled Vocabulary

``` r
parameters_vocabulary() |> dplyr::slice_head(n = 20)
#> # A tibble: 20 × 9
#>    PARAMETER_TYPE    PARAMETER_NAME      PARAMETER_TYPE_SUB MEASURED_TYPE CAS_RN
#>    <chr>             <chr>               <chr>              <chr>         <chr> 
#>  1 Quality parameter pH                  pH                 Physical par… <NA>  
#>  2 Quality parameter Dissolved oxygen    Dissolved oxygen   Concentration 7782-…
#>  3 Quality parameter Temperature         Temperature        Physical par… <NA>  
#>  4 Quality parameter Conductivity        Conductivity       Physical par… <NA>  
#>  5 Quality parameter Salinity            Salinity           Physical par… <NA>  
#>  6 Quality parameter Turbidity           Turbidity          Physical par… <NA>  
#>  7 Quality parameter Total organic carb… Total organic car… Concentration <NA>  
#>  8 Quality parameter Alkalinity          Other              Concentration <NA>  
#>  9 Quality parameter Hardness            Other              Concentration <NA>  
#> 10 Quality parameter Chlorophyll a       Other              Concentration 479-6…
#> 11 Quality parameter Total suspended so… Other              Concentration <NA>  
#> 12 Quality parameter Biochemical oxygen… Other              Concentration <NA>  
#> 13 Quality parameter Chemical oxygen de… Other              Concentration <NA>  
#> 14 Quality parameter Nitrate             Nutrient           Concentration 14797…
#> 15 Quality parameter Nitrite             Nutrient           Concentration 14797…
#> 16 Quality parameter Ammonia             Nutrient           Concentration 7664-…
#> 17 Quality parameter Total nitrogen      Nutrient           Concentration <NA>  
#> 18 Quality parameter Phosphate           Nutrient           Concentration 14265…
#> 19 Quality parameter Total phosphorus    Nutrient           Concentration <NA>  
#> 20 Quality parameter Redox potential     Other              Physical par… <NA>  
#> # ℹ 4 more variables: PUBCHEM_CID <int>, INCHIKEY_SD <chr>, ENTERED_BY <chr>,
#> #   PARAMETER_NAME_SUB <chr>
```

### Parameter Sub-Name

`PARAMETER_NAME_SUB` - *string, controlled, optional*

In some cases it may be necessarily to identify parameters at a finer
level of detail than is permitted by the above fields - for example,
individual wavelengths of ionising radiation. In this case the Parameter
Sub-Name field should be used; otherwise it can be left blank.

### InChIKey

`INCHIKEY_SD` - *string, free, optional*

The [IUPAC International Chemical Identifier
(InChI)](https://inchi-trust.info/wp/) is a widely used chemical
identifier based on the molecular structure of a chemical. The InChIKey
is a 27-character string of letters and seperator characters (e.g., for
ethanol: `LFQSCWFLJHTTHZ-UHFFFAOYSA-N`) and has become the a
gold-standard chemical identifier. As not all parameters are chemicals,
this field has been left as optional, but where chemicals are
quantified, it is strongly preferred that an InChIKey be made available.

### PubChem CID

`PUBCHEM_CID` - *integer, free, optional*

The PubChem database uses an internal identifier known as the [PubChem
Compound
Identifier](https://pubchem.ncbi.nlm.nih.gov/search/help_search.html).
This is an integer accession number. InChIKeys are strongly preferred
for identification, but a PubChem CID can be included if desired for
cross-referencing.

### CAS Registry Number

`CAS_RN`- *string, free, optional*

The Americal Chemical Society maintains an extensive registry of
chemicals. [CAS Registry
Numbers](https://www.cas.org/cas-data/cas-registry) are widely used to
identify individual chemicals. In some cases, a single substance may
have more than one CAS, and not all substances will have a CAS assigned.
InChIKeys are strongly preferred for identification, but a CAS RN can be
included if desired for cross-referencing.

### Entered By

`ENTERED_BY` - *string, free, mandatory*

The name or email address of the user entering data. As many parameters
are included as part of the format, this will only be needed if a new
parameter is added.

### Parameter Comment

`PARAMETER_COMMENT` - *string, free, optional*

Space for the recording of any additional notes or comments about the
parameter deemed relevant.
