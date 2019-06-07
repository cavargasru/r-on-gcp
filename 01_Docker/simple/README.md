# docker-rstudio-map

1. Enable Compute Engine and Cloud Storage API
https://console.cloud.google.com/flows/enableapi?apiid=compute,storage

2. create a folder

```
mkdir ~/rstudio
```
3. Download a service acount key JSON file in the folder created in 2

Follow the steps in:
https://cloud.google.com/iam/docs/creating-managing-service-account-keys#iam-service-account-keys-create-console

Make sure that the key type is google compute


(Do not performed this yet!) To run this from the CLI:
```
gcloud iam service-accounts keys create ~/key.json
  --iam-account [SA-NAME]@[PROJECT-ID].iam.gserviceaccount.com
```

3. Build image

```
docker build -t map-rocker-geospatial .
```

4. Run container

```
docker run -d -p 8787:8787 -v ~/rstudio:/home/rstudio -e PASSWORD=localdevpw --name "map-rstudio-app" map-rocker-geospatial
```

5. Connect to localhost:8787
