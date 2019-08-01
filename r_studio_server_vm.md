# RStudio server VM
<walkthrough-watcher-constant value="~/r-on-gcp/docker/simple" key="directory"></walkthrough-watcher-constant>

## Create an RStudio server VM

<walkthrough-tutorial-duration duration="15"></walkthrough-tutorial-duration>

In this quickstart, you'll use googleComputeEngineR to create an RStudio server VM.

googleComputeEngineR provides an R interface to the Google Cloud Compute Engine API, for launching virtual machines.

This tutorial will walk you through:

* Configure a Google Cloud Project.
* Download a service acount key JSON file.
* Put your default project, zone and JSON file location in your .Renviron
* Start up an RStudio Server.
* Wait for it to install, login via the returned URL.

## Project setup

Google Cloud Platform organises resources into projects. This allows you to
collect all the related resources for a single application in one place.

<walkthrough-project-billing-setup></walkthrough-project-billing-setup>
<walkthrough-project-permissions permissions="compute.instances.create"></walkthrough-project-permissions>

### Set up Compute Engine

To use Compute Engine, turn on the Cloud Compute Engine APIs and open the Cloud Shell.

### Turn on Google Cloud APIs

<walkthrough-enable-apis apis="compute.googleapis.com,storage_component,storage_api">
</walkthrough-enable-apis>

### Open the Cloud Shell

Cloud Shell is a built-in, command-line tool for the console. You're going to use
Cloud Shell to deploy your app.

Open Cloud Shell by clicking the
<walkthrough-cloud-shell-icon></walkthrough-cloud-shell-icon> in the navigation bar at the top of the console.

## Download a service acount key JSON file

1. Open the the API & SERVICES screen.
<walkthrough-menu-navigation sectionid="API_SECTION"></walkthrough-menu-navigation>
2. In the left nav, click [Credentials][spotlight-credentials-menu]
3. Look for the [Create credentials][spotlight-create-credentials-menu] dropdown to create a key. Click the ```Service account key``` option in the dropdown menu.
4. Select ```Compute Engine Default service account``` as Service account
5. Select ```JSON``` as Key type.
6. Click ```Create```

This will download a JSON Service account key file to your local computer.

## Set up R environment
### Change directory
Change your working directory to `{{directory}}`.
```bash
cd {{directory}}
```
### Create a directory for your Renviron
```
mkdir rstudio
```
### Upload JSON File
1. Click the button [More][spotlight-more-cloud-shell-menu] in the Cloud Shell, and then click Upload file.
2. Move JSON Key File into ```rstudio```
```bash
mv ~/file.json rstudio/
```
### Create .Renviron File
0. Change directyory
```
cd rstudio
```
1. Create .Renviron File
```bash
nano .Renviron
```
2. Add the following content to the file and change accordingly 
```
GCE_AUTH_FILE="/home/rstudio/your.key.json" 
GCE_DEFAULT_PROJECT_ID="{{project-id}}"
GCE_DEFAULT_ZONE="your.project.zone"
```
3. ```Ctrl + S``` to save file
4. ```Ctrl + X``` to exit ```nano```
5. check that the file has been well created
```bash
cat .Renviron
```
## Build a Docker image and Add the image to Container Registry
For this quickstart, build the Docker image in `{{directory}}`. This Docker image contains the necessary elements to run a Rstudio instance capable to create VM in Google Compute Engine, and get data from Google Cloud Storage and Google BigQuery .
Change your working directory to `{{directory}}`.
```bash
cd {{directory}}
```
### Build image
```bash
docker build -t map-rocker-geospatial .
```
### Tag the image with a registry name
Before you push the Docker image to Container Registry, you need to tag it with its registry name. Tagging the Docker image with a registry name configures the docker push command to push the image to a specific location. 
To tag the Docker image, run the following command:
```bash
docker tag map-rocker-geospatial gcr.io/{{project-id}}/map-rocker-geospatial:tag1
```
### Push the image to Container Registry
Once docker has been configured to use gcloud as a credential helper, and the local image is tagged with the registry name, you can push it to Container Registry.
To push the Docker image, run the following command:
```bash
docker push gcr.io/{{project-id}}/map-rocker-geospatial:tag1
```

## Start R studio from Cloud Shell

### Change directory
Change your working directory to `{{directory}}`.
```bash
cd {{directory}}
```

### Run container
```bash
docker run -d -p 8787:8787 -e PASSWORD=localdevpw --name "map-rstudio-app" map-rocker-geospatial
```

### Previewing R studio from Cloud Shell

Click on the Web Preview icon Server icon in the Cloud Shell toolbar <walkthrough-web-preview-icon></walkthrough-web-preview-icon> and choose port 8787. 
A tab in your browser opens and connects to the server you just started.

### Start R studio on a Google Cloud Compute Engine VM

```R
library(googleComputeEngineR)

default_project <- gce_get_project("{{project-id}}") # change to your own key
default_project$name

vm <- gce_vm(template = "rstudio", # use this public template for now! custom templates for map specific modelling to be added soon
             name = "rstudio-map-demo-tag1",
             username = "rstudio",
             password = "localdevpw",
             predefined_type = "n1-standard-1",
             dynamic_image = gce_tag_container("map-rocker-geospatial:tag1", project = "{{project-id}}")
```

### Check VM status
```R
map_rstudio <- gce_vm("rstudio-map-demo")
```

### Connect to the VM via External IP
You can view the external IP for an instance via ```gce_get_external_ip()```
```R
gce_get_external_ip("rstudio-map-demo-tag1"
```
Open the IP in a new browser, that will connect to the RStudio instance you just create. Use the credentials define with the ```gce_vm()``` command.

### Check Google Cloud Storage Bucket
```R
library(googleComputeEngineR)
library(googleCloudStorageR)
# List objects in bucket
objects <- gcs_list_objects(bucket = "YOUR_BUCKET_NAME", detail = c("summary"))
```
### Stop R studio on a VM
```R
stop <- gce_vm_stop("rstudio-map-demo")
```
## Conclusion

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

You’re all set!

**Optional: Don’t forget to clean up after yourself**: If you created test projects, be sure to delete them to avoid unnecessary charges. Use 
```bash
gcloud projects delete {{project-id}}
```
[spotlight-credentials-menu]: walkthrough://spotlight-pointer?cssSelector=#cfctest-section-nav-item-credentials
[spotlight-more-cloud-shell-menu]: walkthrough://spotlight-pointer?cssSelector=.p6n-devshell-more-settings
[spotlight-create-credentials-menu]: walkthrough://spotlight-pointer?cssSelector=.jfk-button-primary