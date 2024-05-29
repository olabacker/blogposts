Enable scalar ui in asp net 9 | [aspnet]

Since swagger is not included in asp net 9 by default, you have to manually add ui for the api. You can use the scalar ui to display the open api documentation in a nice way and without having to install any nuget packages.

## Add open api

This will make the open api documentation available at `/openapi/{documentName}.json`. Default document name is `v1`.

```cs
builder.Services.AddOpenApi();
```

```cs
app.MapOpenApi()
    .AllowAnonymous();
```

## Add scalar ui

This will make the scalar ui available at `/scalar/{documentName}`, so if you have a document named `v1` the url will be `/scalar/v1`.

```cs
public static IEndpointConventionBuilder MapScalar(this IEndpointRouteBuilder endpoints)
{
    return endpoints.MapGet("/scalar/{documentName}", (string documentName) => Results.Content($$"""
            <!doctype html>
            <html>
            <head>
                <title>Serenity api reference -- {{documentName}}</title>
                <meta charset="utf-8" />
                <meta
                name="viewport"
                content="width=device-width, initial-scale=1" />
            </head>
            <body>
                <script
                id="api-reference"
                data-url="/openapi/{{documentName}}.json"></script>
                <script>
                var configuration = {
                    theme: 'purple',
                }
            
                document.getElementById('api-reference').dataset.configuration =
                    JSON.stringify(configuration)
                </script>
                <script src="https://cdn.jsdelivr.net/npm/@scalar/api-reference"></script>
            </body>
            </html>
            """, "text/html"))
        .ExcludeFromDescription()
        .AllowAnonymous();
}
```


## Document endpoints

Make sure to add the `Produces` attribute to the endpoint to make sure the documentation is correct. You can also add a tag and description to the endpoint, this will be displayed in the scalar ui.

```cs
app.MapGet("/weatherforecast", () => new[] { new WeatherForecast() })
    .Produces<WeatherForecast[]>()
    .Tag("Weather")
    .Description("Get the weather forecast");
```
