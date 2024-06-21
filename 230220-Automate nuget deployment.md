📦Publish nuget packages easily through github actions  | [nuget] [ghactions]

## Setting up

When you have decided the project which should be published as a nuget package it is a good idea to decorate its csproj file with a couple of properties which show up in the nuget.  

```xml
<PropertyGroup>
    <!-- Other project properties -->
	<PackageProjectUrl>https://github.com/olabacker/[repoUrl]</PackageProjectUrl>
	<RepositoryUrl>https://github.com/olabacker/[repoUrl]</RepositoryUrl>
	<PackageIcon>icon.png</PackageIcon>
	<PackageTags>Fun Jolly</PackageTags>
	<Description>Package description</Description>
	<PackageLicenseExpression>MIT</PackageLicenseExpression>
	<Authors>Ola Bäcker</Authors>
	<Owners>olabacker</Owners>
  <PackageReadmeFile>README.md</PackageReadmeFile>
</PropertyGroup>

  <ItemGroup>
    <None Include="docs\README.md" Pack="true" PackagePath="\"/>
  </ItemGroup>
```

If the package icon is not an url, you should make sure the csproj understand that it should be included in the project.

```xml
<ItemGroup>
	<None Include="icon.png" Pack="true" PackagePath="\"/>
</ItemGroup>
```

## Github actions

When the setup is all done, create the github action workflow file in github. For this to work, you need to supply github with a nuget.org api token and store it as a secret accessible by the workflow with the key `NUGET_API_KEY`.

Since I do not want to release a new package every push the workflow is set to run only on dispatch with the `workflow_dispatch` keyword. This means that the workflow needs to be manually triggered to run.

The workflow dispatch also takes the `version` as an input which will be the version number published on nuget.org.

```yml
name: Build and publish NuGet Package

on:
  workflow_dispatch:
    inputs:
      version:
        description: 'nuget version'
        required: true
        type: string

jobs:
  build-and-publish:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup .NET
        uses: actions/setup-dotnet@v4

      - name: Build package
        run: dotnet pack ./[csproj path] -p:PackageVersion=${{inputs.version}}  --configuration Release

      - name: Publish package to NuGet
        run: dotnet nuget push ./[..]/bin/Release/*.nupkg --api-key ${{ secrets.NUGET_API_KEY }} --source https://api.nuget.org/v3/index.json
```

## Run the workflow

 Now when the workflow is set we can run it. This can be done on the github page but the easiest and quickest is to use the Github cli. Simply run the following when in the git folder.

```sh
gh workflow run
```

You get to set the version and then the workflow will run and deploy the package to nuget.org. 