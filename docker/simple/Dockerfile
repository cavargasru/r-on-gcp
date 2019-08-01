FROM rocker/geospatial

RUN apt-get update

RUN install2.r --error \
    -r 'http://cran.rstudio.com' \
    googleAuthR googleCloudStorageR googleComputeEngineR bigQueryR

RUN install2.r --error \
    -r 'https://inla.r-inla-download.org/R/stable' \
    INLA

ADD rstudio/key.json /home/rstudio/
ADD rstudio/.Renviron /home/rstudio/