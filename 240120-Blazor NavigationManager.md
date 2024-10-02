NavigationManager methods | [c#] [blazor] 


```
NavigationManager.Uri
#> https://localhost:5001/counter/3?q=hi

NavigationManager.BaseUri
#> https://localhost:5001/

NavigationManager.NavigateTo("http://new location")
#> Navigates to new location

NavigationManager.LocationChanged
#> An event that fires when the navigation location has changed.

NavigationManager.ToAbsoluteUri("pepe")
#> https://localhost:5001/pepe

NavigationManager.ToBaseRelativePath(MyNavigationManager.Uri)
#> counter/3?q=hi

Helper: AddQueryParm( "q2", "bye" ) // (*1)
#> https://localhost:5001/counter/3?q=hi&q2=bye

Helper: GetQueryParm( "q" )
#> hi
```