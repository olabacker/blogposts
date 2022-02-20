Use github actions to deploy a blazor application to azure static web pages

## Retreive Azure Service Principal 

Run the following command in az pwsh after replacing {subscription-id}, {resource-group} with the subscription, resource group details

```ps
az ad sp create-for-rbac --name "myApp" --role contributor --scopes /subscriptions/{subscription-id}/resourceGroups/{resource-group} --sdk-auth
```

The command should output a JSON object similar to this:

```json
  {
    "clientId": "<GUID>",
    "clientSecret": "<GUID>",
    "subscriptionId": "<GUID>",
    "tenantId": "<GUID>",
    (...)
  }
```

Place the resulting json object as a secret in your github action project under the key AZURE_CREDENTIALS.

## Example github actions file

Use the following workflow file as a base and replace the variables with your own values. 

```yml
name: BlazorCDCI

on: [push, workflow_dispatch]

env:
  AZURE_RESOURCE_GROUP: res_group
  BLOB_STORAGE_ACCOUNT_NAME: storage_acc

defaults:
  run:
    working-directory: src/Client

jobs:
  build:
    if: (github.event_name == 'push' || github.event_name == 'workflow_dispatch') && contains(toJson(github.event.commits), '***NO_CI***') == false && contains(toJson(github.event.commits), '[ci skip]') == false && contains(toJson(github.event.commits), '[skip ci]') == false
    name: Build
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - name: Setup .NET Core
      uses: actions/setup-dotnet@v1
      with:
        dotnet-version: 6.0.101

    - name: Restore
      run: dotnet restore

    - name: Build with dotnet
      run: dotnet build --configuration Release --no-restore
    
    - name: Publish with dotnet
      run: dotnet publish --configuration Release -o ../published_app --no-build
    
    - name: Publish artifacts
      uses: actions/upload-artifact@v2
      with:
        name: webapp
        path: src/published_app/wwwroot

  deploy:
    needs: build
    name: Deploy
    runs-on: ubuntu-latest
    steps:

    # Download artifacts
    - name: Download artifacts
      uses: actions/download-artifact@v2
      with:
        name: webapp

    # Authentication
    - name: Authenticate with Azure
      uses: azure/login@v1
      with:
        creds: ${{ secrets.AZURE_CREDENTIALS }}

    # Deploy to storage using CLI
    - name: Deploy to storage using CLI
      uses: azure/CLI@v1
      with:
        azcliversion: latest
        inlineScript: | 
          # show azure account being used
          az account show
          # az storage account upload
          az storage blob upload-batch --account-name ${{ env.BLOB_STORAGE_ACCOUNT_NAME }} -s . -d \$web
    # Azure logout 
    - name: logout
      working-directory: .
      run: |
        az logout
```
