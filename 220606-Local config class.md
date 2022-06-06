Useful generic for quick saving/reading of configuration stored on local machine | [dotnet]

```cs
internal class ConfigService<T> where T : new()
{
    private readonly string applicationPath;

    public ConfigService(string applicationPath)
    {
        this.applicationPath = applicationPath;
    }

    public async Task Save(T configEntity)
    {
        string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), applicationPath, "config.json");

        Directory.CreateDirectory(Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), applicationPath));

        await File.WriteAllTextAsync(path, JsonSerializer.Serialize(configEntity));
    }

    public async Task<T> Get()
    {
        string path = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData), applicationPath, "config.json");

        if (File.Exists(path))
        {
            var text = await File.ReadAllTextAsync(path);

            return JsonSerializer.Deserialize<T>(text) ?? new();
        }

        return new();
    }
}
```