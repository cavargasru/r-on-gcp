FROM rocker/geospatial

RUN apt-get update

RUN install2.r --error \
    -r 'http://cran.rstudio.com' \
    googleAuthR googleCloudStorageR bigQueryR

RUN install2.r --error \
    -r 'https://inla.r-inla-download.org/R/stable' \
    INLA
