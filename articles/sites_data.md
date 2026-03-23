# Sites data

## Introduction

**Sites data** captures information about the coordinates, land use, and
administrative/geographical boundaries of sampling sites. In this
format, we make the distinction between the sampled site - a fixed,
physical point in space - and the
[compartment](https://NIVANorge.github.io/eDataDRF/articles/compartments_data.md) -
the type of medium sampled.

Sampling sites are often reported in a variety of more-or-less FAIR
formats, despite the availability of free, mature, well-characterised
systems for defining position in space. Extraction of such data from
reference objects may require conversion from minute-degrees to decimal
degrees, reprojection in a different Coordinate Reference System,
merging of multiple sampling sites, reporting a large, vague sampling
region as a single point, and estimating coordinates off maps. However,
for the time being, the format is kept intentionally simple. All sites
are reported as discrete points; and cases where any of the above
operations are performed should be reported in the [comments
field](#site-comment---string-free-optional).

``` r
library(eDataDRF)
```

``` r
initialise_sites_tibble()
#> # A tibble: 0 × 14
#> # ℹ 14 variables: SITE_CODE <chr>, SITE_NAME <chr>,
#> #   SITE_GEOGRAPHIC_FEATURE <chr>, SITE_GEOGRAPHIC_FEATURE_SUB <chr>,
#> #   COUNTRY_ISO <chr>, OCEAN_IHO <chr>, LATITUDE <dbl>, LONGITUDE <dbl>,
#> #   SITE_COORDINATE_SYSTEM <chr>, ALTITUDE_VALUE <dbl>, ALTITUDE_UNIT <chr>,
#> #   ENTERED_BY <chr>, ENTERED_DATE <chr>, SITE_COMMENT <chr>
```

## Variables

### Site Code - String, free, mandatory

`SITE_CODE`

A short, unique code identifying the sampled site. Although formatting
is not enforced on this field, we recommend using an abbreviated
combination of the campaign, long form site name and any details
relevant to the site. For example:

“Arctic Monitoring Program; Pelagic Sampling Point 37” -\>
`AMP-Pelagic-37`. The site code is the primary key for sites data and is
used as a foreign key in the
[Samples](https://NIVANorge.github.io/eDataDRF/articles/samples_data.md)
and
[Measurements](https://NIVANorge.github.io/eDataDRF/articles/measurements_data.md)
data tables.

### Site Name - String, free, mandatory

`SITE_NAME`

A longer form name of the site, potentially including details such as
address, region, site type, etc. May be fully copied from source to
enable easy tracing back of the relevant details.

### Site Geographic Feature - String, controlled, mandatory

`SITE_GEOGRAPHIC_FEATURE`

Categorisation of site type allows for broad comparisons to be made.
Site Geographic feature is based on a variety of existing land-use
taxonomy to facilitate conversion and comparison:

- [LUCAS Land Use Cover
  Hierachy](https://ec.europa.eu/eurostat/statistics-explained/index.php?title=LUCAS_-_Land_use_and_land_cover_survey)
  (EU)
- [CORINE Land Cover
  inventory](https://land.copernicus.eu/en/products/corine-land-cover)
  (EU)
- Water Framework Directive water body types
- Marine Strategic Framework Directive water types

These are summarised in the table below

| Value                             | Description                                                                | LUCAS | CORINE | WFD | MSFD |
|-----------------------------------|----------------------------------------------------------------------------|-------|--------|-----|------|
| Not relevant                      | Use when geographic feature is not applicable                              |       |        |     |      |
| Not reported                      | Use when information exists but was not reported                           |       |        |     |      |
| River, stream, canal              | Flowing water bodies                                                       | G20   | 5.1.1  |     |      |
| Lake, pond, pool, reservoir       | Standing water bodies                                                      | G10   | 5.1.2  |     |      |
| Ocean, sea, territorial waters    | Marine waters                                                              | G40   | 5.2.3  |     |      |
| Coastal, fjord                    | Coastal waters out to territorial water boundaries                         | G30   | 5.2.1  |     |      |
| Estuary                           | Estuaries                                                                  |       | 5.2.2  |     |      |
| Drainage, sewer, artificial water | Human-made water channels                                                  |       |        |     |      |
| Swamp, wetland                    | Water-saturated land                                                       | H00   | 4      |     |      |
| Groundwater, aquifer              | Subsurface water bodies                                                    |       |        |     |      |
| WWTP                              | Wastewater treatment plant                                                 | U321  | 1.2.1  |     |      |
| Artificial Land/Urban Areas       | Built environment                                                          | A00   | 1      |     |      |
| Landfills                         | Sites officially designated or functionally used for the disposal of waste | A00   | 1      |     |      |
| Cropland                          | Agricultural land                                                          | B00   | 2      |     |      |
| Woodland, forest                  | Tree-covered areas                                                         | C00   | 3.1    |     |      |
| Shrubland                         | Areas dominated by shrubs                                                  | D00   | 3.2    |     |      |
| Grassland                         | Areas dominated by grasses                                                 | E00   |        |     |      |
| Bare land and lichen/moss         | Sparsely vegetated areas                                                   | F00   | 3.3    |     |      |
| Other                             | Specify details in [SITE_COMMENT](#site-comment)                           |       |        |     |      |

#### Controlled Vocabulary

``` r
geographic_features_vocabulary()
#>  [1] "Not relevant"                      "Not reported"                     
#>  [3] "River, stream, canal"              "Lake, pond, pool, reservoir"      
#>  [5] "Ocean, sea, territorial waters"    "Coastal, fjord"                   
#>  [7] "Estuary"                           "Drainage, sewer, artificial water"
#>  [9] "Swamp, wetland"                    "Groundwater, aquifer"             
#> [11] "WWTP"                              "Artificial Land/Urban Areas"      
#> [13] "Landfills"                         "Cropland"                         
#> [15] "Woodland, forest"                  "Shrubland"                        
#> [17] "Grassland"                         "Bare land and lichen/moss"        
#> [19] "Glacier"                           "Other"
```

### Site Geographic Feature Sub - String, controlled, mandatory

`SITE_GEOGRAPHIC_FEATURE_SUB`

In some cases geographic feature vocabulary may not have enough
resolution to capture sampling sites. For example, in bodies of water,
it may be important to distinguish between samples from the benthos,
water column, water surface, etc. In this case, sub-features can be used
to add additional precision.

#### Controlled Vocabulary

``` r
geographic_features_sub_vocabulary()
#> [1] "Not relevant"               "Not reported"              
#> [3] "Water surface"              "Water column, pelagic zone"
#> [5] "Water benthos"              "Other"
```

### ISO Country - String, controlled, mandatory

`COUNTRY_ISO`

Although the sheer size of countries makes them at times poor
identifiers of geographical location, they remain useful data. Although
this variable is marked as mandatory, it is possible to enter “Not
relevant” when sites are out of the territory of any nation (e.g. in
international waters). The [ISO 3166 set of country
codes](https://www.iso.org/iso-3166-country-codes.html) is used, via the
R package `{iso}`.

#### Controlled Vocabulary

``` r
countries_vocabulary()
#>   [1] "Not relevant"                                
#>   [2] "Not reported"                                
#>   [3] "Aruba"                                       
#>   [4] "Afghanistan"                                 
#>   [5] "Angola"                                      
#>   [6] "Anguilla"                                    
#>   [7] "Åland Islands"                               
#>   [8] "Albania"                                     
#>   [9] "Andorra"                                     
#>  [10] "United Arab Emirates"                        
#>  [11] "Argentina"                                   
#>  [12] "Armenia"                                     
#>  [13] "American Samoa"                              
#>  [14] "Antarctica"                                  
#>  [15] "French Southern Territories"                 
#>  [16] "Antigua and Barbuda"                         
#>  [17] "Australia"                                   
#>  [18] "Austria"                                     
#>  [19] "Azerbaijan"                                  
#>  [20] "Burundi"                                     
#>  [21] "Belgium"                                     
#>  [22] "Benin"                                       
#>  [23] "Bonaire, Sint Eustatius and Saba"            
#>  [24] "Burkina Faso"                                
#>  [25] "Bangladesh"                                  
#>  [26] "Bulgaria"                                    
#>  [27] "Bahrain"                                     
#>  [28] "Bahamas"                                     
#>  [29] "Bosnia and Herzegovina"                      
#>  [30] "Saint Barthélemy"                            
#>  [31] "Belarus"                                     
#>  [32] "Belize"                                      
#>  [33] "Bermuda"                                     
#>  [34] "Bolivia, Plurinational State of"             
#>  [35] "Brazil"                                      
#>  [36] "Barbados"                                    
#>  [37] "Brunei Darussalam"                           
#>  [38] "Bhutan"                                      
#>  [39] "Bouvet Island"                               
#>  [40] "Botswana"                                    
#>  [41] "Central African Republic"                    
#>  [42] "Canada"                                      
#>  [43] "Cocos (Keeling) Islands"                     
#>  [44] "Switzerland"                                 
#>  [45] "Chile"                                       
#>  [46] "China"                                       
#>  [47] "Côte d'Ivoire"                               
#>  [48] "Cameroon"                                    
#>  [49] "Congo, The Democratic Republic of the"       
#>  [50] "Congo"                                       
#>  [51] "Cook Islands"                                
#>  [52] "Colombia"                                    
#>  [53] "Comoros"                                     
#>  [54] "Cabo Verde"                                  
#>  [55] "Costa Rica"                                  
#>  [56] "Cuba"                                        
#>  [57] "Curaçao"                                     
#>  [58] "Christmas Island"                            
#>  [59] "Cayman Islands"                              
#>  [60] "Cyprus"                                      
#>  [61] "Czechia"                                     
#>  [62] "Germany"                                     
#>  [63] "Djibouti"                                    
#>  [64] "Dominica"                                    
#>  [65] "Denmark"                                     
#>  [66] "Dominican Republic"                          
#>  [67] "Algeria"                                     
#>  [68] "Ecuador"                                     
#>  [69] "Egypt"                                       
#>  [70] "Eritrea"                                     
#>  [71] "Western Sahara"                              
#>  [72] "Spain"                                       
#>  [73] "Estonia"                                     
#>  [74] "Ethiopia"                                    
#>  [75] "Finland"                                     
#>  [76] "Fiji"                                        
#>  [77] "Falkland Islands (Malvinas)"                 
#>  [78] "France"                                      
#>  [79] "Faroe Islands"                               
#>  [80] "Micronesia, Federated States of"             
#>  [81] "Gabon"                                       
#>  [82] "United Kingdom"                              
#>  [83] "Georgia"                                     
#>  [84] "Guernsey"                                    
#>  [85] "Ghana"                                       
#>  [86] "Gibraltar"                                   
#>  [87] "Guinea"                                      
#>  [88] "Guadeloupe"                                  
#>  [89] "Gambia"                                      
#>  [90] "Guinea-Bissau"                               
#>  [91] "Equatorial Guinea"                           
#>  [92] "Greece"                                      
#>  [93] "Grenada"                                     
#>  [94] "Greenland"                                   
#>  [95] "Guatemala"                                   
#>  [96] "French Guiana"                               
#>  [97] "Guam"                                        
#>  [98] "Guyana"                                      
#>  [99] "Hong Kong"                                   
#> [100] "Heard Island and McDonald Islands"           
#> [101] "Honduras"                                    
#> [102] "Croatia"                                     
#> [103] "Haiti"                                       
#> [104] "Hungary"                                     
#> [105] "Indonesia"                                   
#> [106] "Isle of Man"                                 
#> [107] "India"                                       
#> [108] "British Indian Ocean Territory"              
#> [109] "Ireland"                                     
#> [110] "Iran, Islamic Republic of"                   
#> [111] "Iraq"                                        
#> [112] "Iceland"                                     
#> [113] "Israel"                                      
#> [114] "Italy"                                       
#> [115] "Jamaica"                                     
#> [116] "Jersey"                                      
#> [117] "Jordan"                                      
#> [118] "Japan"                                       
#> [119] "Kazakhstan"                                  
#> [120] "Kenya"                                       
#> [121] "Kyrgyzstan"                                  
#> [122] "Cambodia"                                    
#> [123] "Kiribati"                                    
#> [124] "Saint Kitts and Nevis"                       
#> [125] "Korea, Republic of"                          
#> [126] "Kuwait"                                      
#> [127] "Lao People's Democratic Republic"            
#> [128] "Lebanon"                                     
#> [129] "Liberia"                                     
#> [130] "Libya"                                       
#> [131] "Saint Lucia"                                 
#> [132] "Liechtenstein"                               
#> [133] "Sri Lanka"                                   
#> [134] "Lesotho"                                     
#> [135] "Lithuania"                                   
#> [136] "Luxembourg"                                  
#> [137] "Latvia"                                      
#> [138] "Macao"                                       
#> [139] "Saint Martin (French part)"                  
#> [140] "Morocco"                                     
#> [141] "Monaco"                                      
#> [142] "Moldova, Republic of"                        
#> [143] "Madagascar"                                  
#> [144] "Maldives"                                    
#> [145] "Mexico"                                      
#> [146] "Marshall Islands"                            
#> [147] "North Macedonia"                             
#> [148] "Mali"                                        
#> [149] "Malta"                                       
#> [150] "Myanmar"                                     
#> [151] "Montenegro"                                  
#> [152] "Mongolia"                                    
#> [153] "Northern Mariana Islands"                    
#> [154] "Mozambique"                                  
#> [155] "Mauritania"                                  
#> [156] "Montserrat"                                  
#> [157] "Martinique"                                  
#> [158] "Mauritius"                                   
#> [159] "Malawi"                                      
#> [160] "Malaysia"                                    
#> [161] "Mayotte"                                     
#> [162] "Namibia"                                     
#> [163] "New Caledonia"                               
#> [164] "Niger"                                       
#> [165] "Norfolk Island"                              
#> [166] "Nigeria"                                     
#> [167] "Nicaragua"                                   
#> [168] "Niue"                                        
#> [169] "Netherlands"                                 
#> [170] "Norway"                                      
#> [171] "Nepal"                                       
#> [172] "Nauru"                                       
#> [173] "New Zealand"                                 
#> [174] "Oman"                                        
#> [175] "Pakistan"                                    
#> [176] "Panama"                                      
#> [177] "Pitcairn"                                    
#> [178] "Peru"                                        
#> [179] "Philippines"                                 
#> [180] "Palau"                                       
#> [181] "Papua New Guinea"                            
#> [182] "Poland"                                      
#> [183] "Puerto Rico"                                 
#> [184] "Korea, Democratic People's Republic of"      
#> [185] "Portugal"                                    
#> [186] "Paraguay"                                    
#> [187] "Palestine, State of"                         
#> [188] "French Polynesia"                            
#> [189] "Qatar"                                       
#> [190] "Réunion"                                     
#> [191] "Romania"                                     
#> [192] "Russian Federation"                          
#> [193] "Rwanda"                                      
#> [194] "Saudi Arabia"                                
#> [195] "Sudan"                                       
#> [196] "Senegal"                                     
#> [197] "Singapore"                                   
#> [198] "South Georgia and the South Sandwich Islands"
#> [199] "Saint Helena, Ascension and Tristan da Cunha"
#> [200] "Svalbard and Jan Mayen"                      
#> [201] "Solomon Islands"                             
#> [202] "Sierra Leone"                                
#> [203] "El Salvador"                                 
#> [204] "San Marino"                                  
#> [205] "Somalia"                                     
#> [206] "Saint Pierre and Miquelon"                   
#> [207] "Serbia"                                      
#> [208] "South Sudan"                                 
#> [209] "Sao Tome and Principe"                       
#> [210] "Suriname"                                    
#> [211] "Slovakia"                                    
#> [212] "Slovenia"                                    
#> [213] "Sweden"                                      
#> [214] "Eswatini"                                    
#> [215] "Sint Maarten (Dutch part)"                   
#> [216] "Seychelles"                                  
#> [217] "Syrian Arab Republic"                        
#> [218] "Turks and Caicos Islands"                    
#> [219] "Chad"                                        
#> [220] "Togo"                                        
#> [221] "Thailand"                                    
#> [222] "Tajikistan"                                  
#> [223] "Tokelau"                                     
#> [224] "Turkmenistan"                                
#> [225] "Timor-Leste"                                 
#> [226] "Tonga"                                       
#> [227] "Trinidad and Tobago"                         
#> [228] "Tunisia"                                     
#> [229] "Türkiye"                                     
#> [230] "Tuvalu"                                      
#> [231] "Taiwan, Province of China"                   
#> [232] "Tanzania, United Republic of"                
#> [233] "Uganda"                                      
#> [234] "Ukraine"                                     
#> [235] "United States Minor Outlying Islands"        
#> [236] "Uruguay"                                     
#> [237] "United States"                               
#> [238] "Uzbekistan"                                  
#> [239] "Holy See (Vatican City State)"               
#> [240] "Saint Vincent and the Grenadines"            
#> [241] "Venezuela, Bolivarian Republic of"           
#> [242] "Virgin Islands, British"                     
#> [243] "Virgin Islands, U.S."                        
#> [244] "Viet Nam"                                    
#> [245] "Vanuatu"                                     
#> [246] "Wallis and Futuna"                           
#> [247] "Samoa"                                       
#> [248] "Yemen"                                       
#> [249] "South Africa"                                
#> [250] "Zambia"                                      
#> [251] "Zimbabwe"
```

### IHO Ocean/Sea - String, controlled, mandatory

`OCEAN_IHO`

As with countries, oceans are not necessarily the best geographical
identifiers, but they provide useful, human-readable data for
understanding sampling sites. The [International Hydrographic
Organisation’s version 3 Sea Areas](https://doi.org/10.14284/323)
dataset is used to provide a reasonably-standardised set of names for
seas and oceans. As with [ISO Country](#iso-country), Ocean is mandatory
but should be marked as “Not relevant” when the site is on land.

Where sampling sites are located in national territory but also in or
near (intentionally vague) an ocean or sea, we recommend recording both
variables.

#### Controlled Vocabulary

``` r
areas_vocabulary()
#>   [1] "Not relevant"                "Not reported"               
#>   [3] "Other"                       "Torres Strait"              
#>   [5] "Tasman Sea"                  "Solomon Sea"                
#>   [7] "Ross Sea"                    "Coral Sea"                  
#>   [9] "Bismarck Sea"                "Bellingshausen Sea"         
#>  [11] "Bass Strait"                 "Amundsen Sea"               
#>  [13] "Timor Sea"                   "Sunda Strait"               
#>  [15] "Sumba Strait"                "Sulu Sea"                   
#>  [17] "Sulawesi Sea"                "South China Sea"            
#>  [19] "Singapore Strait"            "Seram Sea"                  
#>  [21] "Sawu Sea"                    "Natuna Sea"                 
#>  [23] "Mindanao Sea"                "Maluku Sea"                 
#>  [25] "Makasar Strait"              "Joseph Bonaparte Gulf"      
#>  [27] "Jawa Sea"                    "Halmahera Sea"              
#>  [29] "Gulf of Tonkin"              "Gulf of Tomini"             
#>  [31] "Gulf of Thailand"            "Gulf of Carpentaria"        
#>  [33] "Gulf of Bone"                "Gulf of Berau"              
#>  [35] "Flores Sea"                  "Banda Sea"                  
#>  [37] "Bali Sea"                    "Aru Sea"                    
#>  [39] "Arafura Sea"                 "South Pacific Ocean"        
#>  [41] "Yellow Sea"                  "Taiwan Strait"              
#>  [43] "Seto Naikai"                 "Sea of Okhotsk"             
#>  [45] "Philippine Sea"              "Liaodong Gulf"              
#>  [47] "Japan Sea"                   "Gulf of Tartary"            
#>  [49] "Gulf of Panama"              "Gulf of California"         
#>  [51] "Gulf of Alaska"              "East China Sea"             
#>  [53] "Coastal waters of SE Alaska" "Bo Sea"                     
#>  [55] "Bering Sea"                  "Anadyrskiy Gulf"            
#>  [57] "North Pacific Ocean"         "Pacific Ocean"              
#>  [59] "Weddell Sea"                 "Scotia Sea"                 
#>  [61] "Rio de la Plata"             "Lazarev Sea"                
#>  [63] "Drake Passage"               "South Atlantic Ocean"       
#>  [65] "Skagerrak"                   "Scotland Sea"               
#>  [67] "North Sea"                   "Labrador Sea"               
#>  [69] "Irish Sea"                   "Gulf of St. Lawrence"       
#>  [71] "Gulf of Mexico"              "Gulf of Guinea"             
#>  [73] "Greenland Sea"               "English Channel"            
#>  [75] "Celtic Sea"                  "Caribbean Sea"              
#>  [77] "Canarias Sea"                "Bristol Channel"            
#>  [79] "Bay of Fundy"                "Bay of Biscay"              
#>  [81] "North Atlantic Ocean"        "Atlantic Ocean"             
#>  [83] "Tirreno Sea"                 "Strait of Sicilia"          
#>  [85] "Strait of Gibraltar"         "Sea of Marmara"             
#>  [87] "Sea of Azov"                 "Ligure Sea"                 
#>  [89] "Ionian Sea"                  "Black Sea"                  
#>  [91] "Balear Sea"                  "Alboran Sea"                
#>  [93] "Aegean Sea"                  "Adriatic Sea"               
#>  [95] "Western Basin"               "Eastern Basin"              
#>  [97] "Mediterranean Sea"           "Mediterranean Region"       
#>  [99] "Riiser-Larsen Sea"           "Red Sea"                    
#> [101] "Prydz Bay"                   "Persian Gulf"               
#> [103] "Palk Bay, Palk Strait"       "Mozambique Channel"         
#> [105] "Malacca Strait"              "Lakshadweep Sea"            
#> [107] "Gulf of Suez"                "Gulf of Oman"               
#> [109] "Gulf of Mannar"              "Gulf of Aqaba"              
#> [111] "Gulf of Aden"                "Great Australian Bight"     
#> [113] "Cosmonaut Sea"               "Burma Sea, Andaman Sea"     
#> [115] "Bay of Bengal"               "Arabian Sea"                
#> [117] "Indian Ocean"                "The Sound"                  
#> [119] "The Little Belt"             "The Great Belt"             
#> [121] "Kattegat"                    "Gulf of Riga"               
#> [123] "Gulf of Finland"             "Gulf of Bothnia"            
#> [125] "Baltic Sea"                  "White Sea"                  
#> [127] "Norwegian Sea"               "Northwestern Passages"      
#> [129] "North Greenland Sea"         "Lincoln Sea"                
#> [131] "Laptev Sea"                  "Kara Sea"                   
#> [133] "Iceland Sea"                 "Hudson Strait"              
#> [135] "Hudson Bay"                  "East Siberian Sea"          
#> [137] "Davis Strait"                "Chukchi Sea"                
#> [139] "Beaufort Sea"                "Barents Sea"                
#> [141] "Baffin Bay"                  "Arctic Ocean"
```

### Latitude - Numeric, free, mandatory

`LATITUDE`

Site latitude (north-south position, also known as northing, between
-90.0° and +90.0°) is recorded in decimal decimal degrees. Arbitrary
precision (within the bounds of R’s numeric data type) is possible, but
the degree of precision reported (i.e. decimal places) should be
appropriate to the actual sampling. 3 decimal places corresponds to
approximately 111 m accuracy, and 4 to within 11 m. Under some
circumstances this can cause somewhat confusing combinations of
coordinates and site types; for example, a site may be reported as being
on land but with coordinates that are clearly in the ocean. In future,
we plan to include an explicit metric of spatial uncertainty. A latitude
is always associated with a [Coordinate Reference
System](#coordinate-reference-system).

### Longitude - Numeric, free, mandatory

`LONGITUDE`

Site longitude (east-west position, also known as easting, between
-180.0° and +180.0°) is recorded in decimal decimal degrees. See
[Latitude](#latitude) for further details. A longitude is always
associated with a [Coordinate Reference
System](#coordinate-reference-system).

### Coordinate Reference System - String, controlled, mandatory

`SITE_COORDINATE_SYSTEM`

A site’s latitude and longitude are calculated using a reference system
“placed” at a given point on the globe and parameterised within a given
region. This Coordinate Reference System (CRS) is a necessary component
of any geographical coordinate data. In most global datasets, the World
Geodetic System, 1984 version (WGS 84) is used. However, national or
other local datasets may use a variety of CRS, such as the Universal
Transverse Mercator (UTM), which projects the Earth into a series of
square or rectangular zones; in this case, it is necessary to know the
CRS and the grid number.

This controlled vocabulary uses the package `{crsuggest}`, which in turn
uses the EPSG Dataset v10.019, (product of the International Association
of Oil & Gas Producers, [terms of
use](https://epsg.org/terms-of-use.html)). However, because the full
6000+ CRS included would be impractically large for the associated UI,
we filter this down to a small set of systems relevant to the test cases
used with the format so far. In future, CRS metadata will be used to
automatically filter available CRS based on the desired geographical
scope.

#### Controlled Vocabulary

``` r
coordinate_systems_vocabulary(common_only = TRUE)
#> [1] "Not relevant"          "Not reported"          "Other"                
#> [4] "WGS 84"                "ETRS89"                "WGS 84 / UTM zone 32N"
#> [7] "WGS 84 / UTM zone 33N" "WGS 84 / UTM zone 34N" "WGS 84 / UTM zone 35N"
```

### Altitude Value - Numeric, free, mandatory

`ALTITUDE_VALUE`

Altitude value above or below sea level, including depth of water
sampling (but *not* depth of ice or sediment cores). This data is
frequently not available for sampling sites, in which case it can be
reported as 0. Associated with an [altitude unit](#altitude-unit).

### Altitude Unit - String, controlled, mandatory

`ALTITUDE_UNIT`

Unit associated with [altitude
value](#altitude-value---numeric-free-mandatory).

#### Controlled Vocabulary

``` r
altitude_units_vocabulary()
#> [1] "km" "m"  "cm" "mm"
```

### Entered By - String, free, mandatory

`ENTERED_BY`

The name or email address of the user entering data.

### Entered Date - Date (ISO), free, mandatory

`ENTERED_DATE`

The date that site data were entered.

### Site Comment - String, free, optional

`SITE_COMMENT`

Space for the recording of any additional notes or comments about the
site deemed relevant, particularly any operations performed by the user
on sites data, such as merging sites, converting a sampling region to a
discrete point, or estimating point coordinates from a map.
