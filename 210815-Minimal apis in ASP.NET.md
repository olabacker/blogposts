Examples of how to utilize the minimal api syntax

## Simple GET response

Hello world!

```cs
var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

app.MapGet("/hello", () => "Hello, World!");

app.Run();
```

## Serve file

Endpoint to serve files.

```cs
app.MapGet("/download", () =>
{
    string txt = "Download test file";
    byte[] data = Encoding.UTF8.GetBytes(txt);
    return Results.File(data, "application/octet-stream", "file.md");
});
```

## Crud Api

Simple example of creating endpoints for full CRUD capabilities in a minimal api.

```cs
var builder = WebApplication.CreateBuilder(args);

builder.Services.AddDbContext(opt => opt.UseInMemoryDatabase("api"));
builder.Services.AddScoped<IReportService, ReportService>();

var app = builder.Build();

app.MapGet("/reports", async (IReportService reportService) 
    => await reportService.GetReports());

app.MapGet("/reports/{id}", async (int id, IReportService reportService) 
    => await reportService.GetReportById(id));

app.MapPost("/reports", async (ReportRequest reportRequest, IReportService reportService) 
    => await reportService.CreateReport(reportRequest));

app.MapPut("/reports/{id}", async (int id, ReportRequest reportRequest, IReportService reportService) 
    => await reportService.UpdateReport(id, reportRequest));

app.MapDelete("/reports/{id}", async (int id, IReportService reportService) 
    => await reportService.DeleteReport(id));

app.Run();
```

## OpenApi/Swagger capabilities

If adding OpenApi capabilities to the api is required it is easy to do.   

```cs
var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new() { Title = builder.Environment.ApplicationName,
        Version = "v1" });
});

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json",
        $"{builder.Environment.ApplicationName} v1"));
}

app.MapGet("/swag", () => "Hello Swagger!");

app.Run();
```