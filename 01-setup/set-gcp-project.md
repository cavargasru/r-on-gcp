# GCP Project setup

Google Cloud Platform organises resources into projects. This allows you to
collect all the related resources for a single application in one place.

<walkthrough-project-billing-setup></walkthrough-project-billing-setup>

## Turn on Google Cloud APIs

<walkthrough-enable-apis apis="compute.googleapis.com,storage_component,storage_api">
</walkthrough-enable-apis>

## Download a service acount key JSON file

1. Open the the API & SERVICES screen.
<walkthrough-menu-navigation sectionid="API_SECTION"></walkthrough-menu-navigation>
2. In the left nav, click [Credentials][spotlight-credentials-menu]
3. Look for the [Create credentials][spotlight-create-credentials-menu] dropdown to create a key. Click the ```Service account key``` option in the dropdown menu.
4. Select ```Compute Engine Default service account``` as Service account
5. Select ```JSON``` as Key type.
6. Click ```Create```

This will download a JSON Service account key file to your local computer.