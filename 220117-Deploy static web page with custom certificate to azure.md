Process of setting up a static web app to azure 

<img style="" src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Microsoft_Azure.svg/1200px-Microsoft_Azure.svg.png" alt="drawing" width="200"/>


1. Create a storage account
    - Name it and use rest as default options
2. Go to static website option in the storage account.
3. Enable and set index document name to ex "index.html".
4. Upload static web page to storage $web folder.
5. Go to Azure CDN, create a new endpoint with static website as origin hostname.
6. Open the deployed endpoint and add a custom domain pointing to your own domain. 
    - This requires the custom hostname to have a CNAME entry at the DNS provider.
7. After creating the custom domain in the endpoint, select it and set custom domain https to "On". Select "Use my own certificate" and select certificate from your azure key vault.
    - This requires your certificate to be present in the available azure key vault
    - Make sure to read the information box in the custom domain page, it contains a step for setting Azure CDN permission in your Azure Active Directory which is necessary for allowing Azure CDN to access the key vault 