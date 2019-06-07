library(googleComputeEngineR)

project <- "modelling-dev" # change to your own project
zone <- "europe-west1-b"
account_key <- "~/modelling-dev-gce-key.json" # change to your own key
Sys.setenv(GCE_AUTH_FILE = account_key,
           GCE_DEFAULT_PROJECT_ID = project,
           GCE_DEFAULT_ZONE = zone)
options(googleAuthR.scopes.selected = "https://www.googleapis.com/auth/cloud-platform")

gce_auth()

gce_global_project(project)
gce_global_zone(zone)

default_project <- gce_get_project("map-modelling-dev") # change to your own key
default_project$name

vm <- gce_vm(template = "rstudio", # use this public template for now! custom templates for map to be add soon
             name = "rstudio-map-demo",
             username = "map",
             password = "localdevpw",
             predefined_type = "n1-standard-1")

map_rstudio <- gce_vm("rstudio-map-demo")

stop <- gce_vm_stop("rstudio-map-demo")
