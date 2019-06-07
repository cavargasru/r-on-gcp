# docker-rstudio-map

1. Enable Compute Engine API

<button class="button-save large">Big Fat Button</button>

[![Enable APIs](http://gstatic.com/cloudssh/images/open-btn.png)](http://gstatic.com/cloudssh/images/)

https://console.cloud.google.com/flows/enableapi?apiid=compute
1. Download a service acount key JSON file

```
gcloud iam service-accounts keys create ~/key.json
  --iam-account [SA-NAME]@[PROJECT-ID].iam.gserviceaccount.com
```

Build image

```
docker build -t map-rocker-geospatial .
```

Run container

```
docker run -d -p 8787:8787 -v $(pwd):/home/rstudio -e PASSWORD=localdevpw --name "map-rstudio-app" map-rocker-geospatial
```
