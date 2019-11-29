# 1. Setup

## <a name="1-1"></a> 1.1 Configure GCP Project
[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://console.cloud.google.com/console/open?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2Fcavargasru%2Fr-on-gcp&cloudshell_tutorial=01-setup%2Fset-gcp-project.md)

## 1.2 Set an RStudio in GCP Cloud Shell (Optional)
If you do not have a local RStudio, alternatively, you can specify a custom Docker image that runs an RStudio environment during the Cloud Shell session.
Note that this creates a temporary environment with a scratch home directory that will be deleted on session end.

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://console.cloud.google.com/console/open?cloudshell_git_repo=https%3A%2F%2Fgithub.com%2Fcavargasru%2Fr-on-gcp&cloudshell_tutorial=01-setup%2Fr-studio-server-cloud-shell-session.md)


## 1.3 Set your local RStudio
To set your local RStudio you will need:
* The project ID of the GCP Project you set in [1.1](#1-1).
* Your preferred geographical zone to launch VMs e.g. europe-west1-a
* The Service Account Key json file you downloaded in [1.1](#1-1).

The simplest way to set yor local R session is to set setup details in an .Renviron file.

1. Upload the Service Account Key json file you downloaded in [1.1](#1-1) to the RStudio home directory.
2. Create .Renviron File. The easiest way to find the right home directory is within RStudio, to click on the Home button in RStudio’s file explorer. Create a file via File > New file > Text File, save and call it .Renviron
3. Add the following content to the file and change accordingly 
```
GCE_AUTH_FILE="{{/full/path/to/your.key.json}}" 
GCE_DEFAULT_PROJECT_ID="{{project-id}}"
GCE_DEFAULT_ZONE="{{your.project.zone}}"
```

If you cannot use an .Renviron you can set environment files within the script via Sys.setenv:
```R
Sys.setenv("GCE_AUTH_FILE" = "/fullpath/to/auth.json")
Sys.setenv("GCE_DEFAULT_PROJECT_ID" = "{{project-id}}")
Sys.setenv("GCE_DEFAULT_ZONE" = "{{your.project.zone}}")
```

## 2 Create an RStudio server VM

4. Install the googleComputeEngineR from CRAN
```R
install.packages("googleComputeEngineR")
```
5. Load the library
```R
library(googleComputeEngineR)
```