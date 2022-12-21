Include references projects in nuget packages | [nuget]

## Problem

By default, 'dotnet pack' doesn't include referenced projects. The project references will instead be treated as a nuget package reference. So when a nuget package containing only a project reference is installed with this default behaviour, it will try to look for the referenced project in your specified nuget sources instead. 

In cases where you don't want to expose the referenced library in another nuget package there are other solutions to include the packaged reference in the nuget package.

## Csproj solution

The referenced projects in the csproj file needs an additional attribute 'PrivateAssets' which needs the value set to 'All'.

```xml
<ItemGroup>
    <ProjectReference Include="..\Referenced.Project.csproj" PrivateAssets="All" />
</ItemGroup>
```

The csproj file also needs the following 

```xml
<PropertyGroup>
    <TargetsForTfmSpecificBuildOutput>$(TargetsForTfmSpecificBuildOutput);CopyProjectReferencesToPackage</TargetsForTfmSpecificBuildOutput>
</PropertyGroup>

<Target Name="CopyProjectReferencesToPackage" DependsOnTargets="BuildOnlySettings;ResolveReferences">
    <ItemGroup>
      <_ReferenceCopyLocalPaths Include="@(ReferenceCopyLocalPaths->WithMetadataValue('ReferenceSourceTarget', 'ProjectReference')->WithMetadataValue('PrivateAssets', 'All'))"/>
    </ItemGroup>

    <Message Text="Batch for .nupkg: ReferenceCopyLocalPaths = @(_ReferenceCopyLocalPaths), ReferenceCopyLocalPaths.DestinationSubDirectory = %(_ReferenceCopyLocalPaths.DestinationSubDirectory) Filename = %(_ReferenceCopyLocalPaths.Filename) Extension = %(_ReferenceCopyLocalPaths.Extension)" Importance="High" Condition="'@(_ReferenceCopyLocalPaths)' != ''" />

    <ItemGroup>
      <BuildOutputInPackage Include="@(_ReferenceCopyLocalPaths)" TargetPath="%(_ReferenceCopyLocalPaths.DestinationSubDirectory)"/>
    </ItemGroup>
</Target>
```


## Nuspec solution

The same result can be achieved if using a nuspec instead by including the dll manually in the `<Files>` tag. Multiple dlls (and therefore projects) can be added by using a wildcard in the `src` value.

```xml
<?xml version="1.0"?>
<package >
  <metadata>
    ...
  </metadata>
   <files>
     <file src="bin\Release\net7.0\Referenced.Project.dll" target="lib\net7.0" />
  </files>
</package>
```

## Resolution

After packaging the nuget with either approach, it will contain the referenced projects as dlls and will be usable by the package consumer.