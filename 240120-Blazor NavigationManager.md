NavigationManager methods | [c#] [blazor] 


```cs
NavigationManager.Uri
```
`https://localhost:5001/counter/3?q=hi`

```cs
NavigationManager.BaseUri
```
 https://localhost:5001/

```cs
NavigationManager.NavigateTo("http://new location")
```
 Navigates to new location

```cs
NavigationManager.LocationChanged
```
 An event that fires when the navigation location has changed.

```cs
NavigationManager.ToAbsoluteUri("pepe")
```
 https://localhost:5001/pepe

```cs
NavigationManager.ToBaseRelativePath(MyNavigationManager.Uri)
```
 counter/3?q=hi

```cs
Helper: AddQueryParm( "q2", "bye" ) // (*1)
```
 https://localhost:5001/counter/3?q=hi&q2=bye

```cs
Helper: GetQueryParm( "q" )
```
 hi