# GCP Project Setup
<walkthrough-watcher-constant value="~/r-on-gcp/docker/simple" key="directory"></walkthrough-watcher-constant>
## Let's get started!

This guide will show you how to configure a Google Cloud Project. It'll also walk you through generating a service account key JSON file.

**Time to complete**:
<walkthrough-tutorial-duration duration="5"></walkthrough-tutorial-duration>

## Select a GCP Project
<walkthrough-project-billing-setup></walkthrough-project-billing-setup>
<walkthrough-project-permissions permissions="compute.instances.create"></walkthrough-project-permissions>

## Turn on Google Cloud APIs

<walkthrough-enable-apis apis="compute.googleapis.com,storage_component,storage_api">
</walkthrough-enable-apis>

## Download a service acount key JSON file

1. Open the API & SERVICES screen.
<walkthrough-menu-navigation sectionid="API_SECTION"></walkthrough-menu-navigation>
2. In the left nav, click [Credentials][spotlight-credentials-menu]
3. Look for the [Create credentials][spotlight-create-credentials-menu] dropdown to create a key. Click the ```Service account key``` option in the dropdown menu.
4. Select ```Compute Engine Default service account``` as Service account
5. Select ```JSON``` as Key type.
6. Click ```Create```

This will download a JSON Service account key file to your local computer. You will need this for next tutorials.

## Conclusion

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

[spotlight-credentials-menu]: walkthrough://spotlight-pointer?cssSelector=#cfctest-section-nav-item-credentials
[spotlight-create-credentials-menu]: walkthrough://spotlight-pointer?cssSelector=.jfk-button-primary