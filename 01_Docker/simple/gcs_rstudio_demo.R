Sys.setenv("GCS_AUTH_FILE" = "~/modelling-dev.json") # use your own key
library(googleCloudStorageR)
library(raster)
library(httr)

# this is just an example
covariatesObjects <- gcs_list_objects(bucket = "malaria-incidence-rate-map-modelling-dev", detail = c("summary"), prefix = "malaria-incidence-rate/COVARIATES", delimiter = "population")
populationObject <- gcs_list_objects(bucket = "malaria-incidence-rate-map-modelling-dev", detail = c("summary"), prefix = "malaria-incidence-rate/COVARIATES/population")
population <- gcs_get_object(populationObject$name[[1]])
populationString = toString(populationObject$name[[1]])
gcs_get_object(populationObject$name[[1]], saveToDisk = "population.tif")
#rres <- as.raster(rawToBits(population))

for(i in 1:nrow(objects)){
  covariate <- raster::crop(gcs_get_object(objects[i,3]))
}

