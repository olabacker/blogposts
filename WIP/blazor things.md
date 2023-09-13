


```
MyNavigationManager.Uri
#> https://localhost:5001/counter/3?q=hi

MyNavigationManager.BaseUri
#> https://localhost:5001/

MyNavigationManager.NavigateTo("http://new location")
#> Navigates to new location

MyNavigationManager.LocationChanged
#> An event that fires when the navigation location has changed.

MyNavigationManager.ToAbsoluteUri("pepe")
#> https://localhost:5001/pepe

MyNavigationManager.ToBaseRelativePath(MyNavigationManager.Uri)
#> counter/3?q=hi

Helper: AddQueryParm( "q2", "bye" ) // (*1)
#> https://localhost:5001/counter/3?q=hi&q2=bye

Helper: GetQueryParm( "q" )
#> hi
```