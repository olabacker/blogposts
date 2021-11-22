Global usings, file scoped namespace and const interpolated strings


## Global usings

Simply add the global keyword to make a using statement global.

```cs
global using System.Text.Json;
```

It can also be added to the csproj-file.

```xml
<Using Include="System.Text.Json">
```

## File scoped namespaces

Entire file gets the namespace, indentation gets removed.

```cs
namespace TestApp.Model;

internal record User(string Name);
```

## Constant interpolated strings

It is now allowed to have interpolated strings as const.

```cs
const string S1 = $"Hello";
const string S2 = $"{S1}, welcome!";
```