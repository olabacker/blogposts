Steps to create a dotnet tool from a console application | [dotnet]

# Introduction

A dotnet tool is a cli application built in .NET which is distibuted through a nuget source and can be invoked as a standalone application with its own alias. 

A dotnet tool is installed using the 'dotnet tool install' command.

```sh
dotnet tool install -g cooltool
```

After installing the tool it can be invoked with the alias.

```sh
cooltool args
```

# Create the application

Create the application you want to turn into a dotnet tool, it should be a console application targeting at least .NET Core 3.

# Add to csproj

Add the following to the .csproj file of a console application. This allows the application to be packed as a tool rather than as a library.

```xml
<PackAsTool>true</PackAsTool>
<ToolCommandName>botsay</ToolCommandName>
<PackageOutputPath>./nupkg</PackageOutputPath>
```

# Build

```sh
dotnet pack -p:PackageVersion=$version /p:Version=$version
```

# Push to source

```sh
dotnet nuget push -s [customnugetsource/index.json] [nugetfile.nupkg]
```

# Conclusion

Using these two in a powershell script makes for a quick way to distribute an useful cli application. As an example, I use it to easily distribute an internal database import/export tool among the developers in my company.