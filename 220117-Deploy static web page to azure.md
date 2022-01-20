Process of setting up a static web app on azure with custom DNS and certificate

<img style="" src="https://ms-azuretools.gallerycdn.vsassets.io/extensions/ms-azuretools/vscode-azurestaticwebapps/0.9.0/1636755230878/Microsoft.VisualStudio.Services.Icons.Default" alt="drawing" width="100"/>


## Azure storage account and static web pages

Create a storage account, name it and the rest as default options. 

Go to static website option in the storage account. Enable and set index document name to the start page of the static web page. Upload the static web page to the storages $web folder.

At this point the hosting of the web page itself is complete and an endpoint supplied by azure is given to access it. Congrats! 

However, if we have a custom certificate and dns which we want to use, some additional steps are required.

## Key vault 🔑

First off, create a key vault. Under the key vault, go to certificates, create a new entry and upload the existing the pfx-file and its key. 

## Azure CDN

Now we need to create a CDN profile. This improves performance and availability of the storage with caching and distribution to edge servers. It is also needed for redirecting our custom domain to the storage and serving the certificate from the key vault.

Go to Azure CDN within the storage account, create a new endpoint with static website as origin hostname. Open the deployed endpoint and add a custom domain pointing to your own domain. This requires the custom hostname to have a CNAME entry at the DNS provider.

After creating the custom domain in the endpoint, select it and set custom domain https to "On". Select "Use my own certificate" and select certificate from your azure key vault. This requires your certificate to be present in the available azure key vault from the previous step. 

## Giving CDN permission to access key vault

If it is the first time the azure account is setup with a custom certificate, another step for setting Azure CDN permission in your Azure Active Directory which is required for allowing Azure CDN to access the key vault. Execute the following command in Azure powershell.

```ps
New-AzADServicePrincipal -ApplicationId "205478c0-bd83-4e1b-a9d6-db63a3e1e1c8
```

After this it is required to grant Azure CDN service the permission to access the secrets in your Key vault. Go to "Access policies" from your Key vault to add a new policy, then grant "Microsoft.AzureFrontDoor-Cdn" service principal a "get-secret" permission.

## Result

The static web page should now be hosted under your custom domain with your own certificate on azure, just like this page you're on! 🍾 
