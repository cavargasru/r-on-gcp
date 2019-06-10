# RStudio server VM



<walkthrough-watcher-constant value="~/r-on-gcp/01_Docker/simple" key="directory"></walkthrough-watcher-constant>

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
2. In the left nav, click ```Credentials```.
The [Credentials][spotlight-credentials-menu]
3. Look for the ```Create credentials``` dropdown to create a key. Click the ```Service account key``` option in the dropdown menu.
4. Select ```Compute Engine Default service account``` as Service account
5. Select ```JSON``` as Key type.
6. Click ```Create```

This will download a JSON Service account key file to your local computer.

## Set up R environment
### Create a directory for your Renviron
```
mkdir ~/rstudio
cd ~/rstudio
```
### Upload JSON File
1. Click the More button <walkthrough-more-vert-icon> </walkthrough-more-vert-icon> in the Cloud Shell, and then click Upload file.
2. Upload JSON Key File into ```~/rstudio```

### Create .Renviron File
1. Create .Renviron File
```
nano .Renviron
```
2. Add the content 
```
GCE_AUTH_FILE="/home/rstudio/your.key.json"
GCE_DEFAULT_PROJECT_ID="your.project"
GCE_DEFAULT_ZONE="your.project.zone"
```
3. ```Ctrl + S``` to save file
4. ```Ctrl + X``` to exit ```nano```
## Start R studio on Cloud Shell

### Change directory
Change your working directory to `{{directory}}`.
```bash
cd {{directory}}
```

### Build image
```
docker build -t map-rocker-geospatial .
```

### Run container
```
docker run -d -p 8787:8787 -v ~/rstudio:/home/rstudio -e PASSWORD=localdevpw --name "map-rstudio-app" map-rocker-geospatial
```

## Previewing R studio
Click on the Web Preview icon Server icon in the Cloud Shell toolbar <walkthrough-web-preview-icon></walkthrough-web-preview-icon> and choose port 8787. 
A tab in your browser opens and connects to the server you just started.

### Start R studio on a VM

```R
library(googleComputeEngineR)

default_project <- gce_get_project("map-modelling-dev") # change to your own key
default_project$name

vm <- gce_vm(template = "rstudio", # use this public template for now! custom templates for map specific modelling to be added soon
             name = "rstudio-map-demo",
             username = "map",
             password = "localdevpw",
             predefined_type = "n1-standard-1")
```

### Check VM status
```R
map_rstudio <- gce_vm("rstudio-map-demo")
```

### Stop R studio on a VM
```R
stop <- gce_vm_stop("rstudio-map-demo")
```

## Conclusion

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

You’re all set!

**Don’t forget to clean up after yourself**: If you created test projects, be sure to delete them to avoid unnecessary charges. Use 
```
gcloud projects delete {{project-id}}
```
[spotlight-credentials-menu]: walkthrough://spotlight-pointer?cssSelector=#cfctest-section-nav-item-credentials

