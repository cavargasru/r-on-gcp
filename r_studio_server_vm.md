# RStudio server VM

## Create an RStudio server VM

<walkthrough-tutorial-duration duration="15"></walkthrough-tutorial-duration>

In this quickstart, you'll use googleComputeEngineR to create an RStudio server VM.

googleComputeEngineR provides an R interface to the Google Cloud Compute Engine API, for launching virtual machines.

This tutorial will walk you through:

* Configure a Google Cloud Project.
* Download a service acount key JSON file.
* Put your default project, zone and JSON file location in your .Renviron
* Run library(googleComputeEngineR) and auto-authenticate
* Run vm <- gce_vm(template = "rstudio", name = "rstudio-server", username = "mark", password = "mark1234") (or other credentials) to start up an RStudio Server.
* Wait for it to install, login via the returned URL.

## Project setup

Google Cloud Platform organises resources into projects. This allows you to
collect all the related resources for a single application in one place.

<walkthrough-project-billing-setup permissions="compute.instances.create"></walkthrough-project-billing-setup>

### Part 1

Part One Instructions.

### Part 2

Part Two Instructions.

## Conclusion

Done!
