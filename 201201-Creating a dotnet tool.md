Steps to create a dotnet tool from a console application

# Add to csproj

```xml
<PackAsTool>true</PackAsTool>
<ToolCommandName>botsay</ToolCommandName>
<PackageOutputPath>./nupkg</PackageOutputPath>
```

# Build

```ps
dotnet pack -p:PackageVersion=$version /p:Version=$version
```

# Push to source

```ps
dotnet nuget push -s [customnugetsource/index.json] [nugetfile.nupkg]
```