blazor component render speed

```cs
@code { 
    Stopwatch renderWatch = Stopwatch.StartNew();

    protected override bool ShouldRender() 
    { 
        if (base.ShouldRender()) 
        { 
            renderWatch = Stopwatch.StartNew(); 
            return true;
        } 
        return false; 
    } 

    protected override void OnAfterRender(bool firstRender) 
    { 
        renderWatch.Stop(), Console.WriteLine($"Took {renderWatch.ElapsedMilliseconds} (ms) to render."); 
    }
```