# Run RStudio from Cloud Shell Session
<walkthrough-watcher-constant value="~/r-on-gcp/01-setup" key="directory"></walkthrough-watcher-constant>

## Let's get started!

This guide will show you how to specify a custom Docker image that runs an RStudio environment during the session.

**Time to complete**:
<walkthrough-tutorial-duration duration="15"></walkthrough-tutorial-duration>

## Open the Cloud Shell

Cloud Shell is a built-in, command-line tool for the console. You're going to use Cloud Shell to deploy an RStudio environment during the session.

Open Cloud Shell by clicking the
<walkthrough-cloud-shell-icon></walkthrough-cloud-shell-icon> in the navigation bar at the top of the console.

Change your working directory to `{{directory}}`.
```bash
cd {{directory}}
```
## Build a Docker image and Add the image to Container Registry
For this quickstart, build the Docker image in `{{directory}}`. 
This Docker image contains the necessary elements to run a Rstudio instance.

### Build image
```bash
docker build -t map-rstudio .
```
### Run container
```bash
docker run -d -p 8787:8787 -e PASSWORD=localdevpw --name "map-rstudio" map-rstudio
```
## Previewing R studio from Cloud Shell
Click on the Web Preview icon Server icon in the Cloud Shell toolbar <walkthrough-web-preview-icon></walkthrough-web-preview-icon> and choose port 8787. 
A tab in your browser opens and connects to the server you just started.

## Conclusion

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>
