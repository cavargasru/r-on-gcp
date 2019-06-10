# RStudio server VM

<walkthrough-watcher-constant value="01_Docker/simple" key="directory"></walkthrough-watcher-constant>

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

### Create a directory for your Renviron
```
mkdir ~/rstudio

```
Download the servicea account key using the following steps in:
https://cloud.google.com/iam/docs/creating-managing-service-account-keys#iam-service-account-keys-create-console

Make sure that the key type is google compute.

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

### Previewing R studio
Click on the Web Preview icon Server icon in the Cloud Shell toolbar <walkthrough-web-preview-icon></walkthrough-web-preview-icon> and choose port 8787. 
A tab in your browser opens and connects to the server you just started.
## Conclusion

Done!
