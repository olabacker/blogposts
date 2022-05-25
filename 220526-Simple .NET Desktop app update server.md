Update server in docker for a c# client built with github actions

## Squirrel

The library used for this method is [Clowd.Squirrel](https://www.nuget.org/packages/Clowd.Squirrel/) which is a fork of Squirrel.Windows which is actually being actively developed with alot of improvements over its origin. The library takes a nuget package for creating the updates and setup files. 

## Client integration

First off, implement the updating procedure into the client wherever you want.

```cs
public async Task Update(string endPoint)
{
    ReleaseEntry newVersion = null;
    try
    {
        using var mgr = new UpdateManager(endPoint);
        newVersion = await mgr.UpdateApp(progress =>
        {
            // display progress with progress var
        });
    }
    catch (Exception e)
    {
        // handle failure!
    }

    // optionally restart the app automatically, or ask the user if/when they want to restart
    if (newVersion != null)
    {
        UpdateManager.RestartApp();
        return;
    }

    // No update!
}
```

## The update server

The update server is a simple asp net minimal api with only the following code present in the program file. The only thing it will do is serve the files produced from squirrel.

```cs
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/{fileName}", (string fileName) =>
{
    var path = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Releases", fileName);

    return Results.File(path, "application/octet-stream");
});

app.Run();
```

After creating the update server the default dockerfile created by visual studio when requesting docker support is sufficient. The only modification needed is to add a `COPY` instruction which makes the squirrel files be copied into the docker image.

```dockerfile
COPY ["Releases/", "{{ClientFolderName}}/Releases"]
```


## Github actions

The following github action will checkout, publish a nuget package, produce a release with Squirrel and integrate it into the docker image which will serve the update and setup files.

```yml
name: Build

on:
  push:
    branches: [ main ]

jobs:
  build-client:
    runs-on: windows-latest

    steps:
    - uses: actions/checkout@v3
      with:
        submodules: 'true'
        token: ${{ secrets.GH_ACTIONS_TOKEN }}

    - name: Setup .NET
      uses: actions/setup-dotnet@v2
      with:
        dotnet-version: 6.0.x

    - name: Publish client
      run: dotnet publish {{csprojFile}}.csproj -c Release -a x86

    - name: Squirrel 
      shell: pwsh
      run: {PathToSquirrel.exe} pack --packId "{AppName}" --packVersion "1.0.${{github.run_number}}" --packDirectory "{{publishDirectory}}" --allowUnaware

    - uses: actions/upload-artifact@master
      with:
        name: client-release
        path: Releases
        retention-days: 1
  build-updateserver:
    needs: build-client
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
      with:
        submodules: 'true'
        token: ${{ secrets.GH_ACTIONS_TOKEN }}
    
    - uses: actions/download-artifact@master
      with:
        name: client-release
        path: Releases

    - name: Docker login
      run: docker login -u {dockerUser} -p ${{ secrets.DOCKER_HUB_TOKEN }}

    - name: Build the Docker image
      run: docker build . --file .\Dockerfile --tag {imageName}:1.0.${{github.run_number}}

    - name: Push the Docker image
      run: docker image push {imageName}:1.0.${{github.run_number}}
```

## Conclusion

In the end we got a standalone update server for a .NET application without much effort. Now place the docker image where it gets automatic updates from the docker repo!