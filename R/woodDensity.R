# fetch wood density for a batch of trees using the biomass package.

retrieveWoodDensityTester <- function () {
  json = '
  [ 
    {  "plot": "NRI_P005", "genus": "Millettia", "species": "laurentii", "family": "Fabaceae" },
     {  "plot": "NRI_P005", "genus": "", "species": "", "family": "Indet" },
     {  "plot": "NRI_P005", "genus": "Macaranga", "species": "sp.", "family": "Euphorbiaceae" },
     {  "plot": "NRI_P005", "genus": "", "species": "sp.", "family": "Anacardiaceae" },
    {  "plot": "NRI_P005", "genus": "Ricinodendron", "species": "heudelotii", "family": "Euphorbiaceae" }
  ]'
  library(jsonlite)
  trees=fromJSON(json)
  
  retrieveWoodDensity(trees)
} 


retrieveWoodDensity <- function(trees) {
  library(BIOMASS)
  wd = BIOMASS::getWoodDensity(genus=trees$genus, species=trees$species, family=trees$family, region="AfricaTrop", stand=trees$plot )
  wd
}

autoWD = retrieveWoodDensityTester()