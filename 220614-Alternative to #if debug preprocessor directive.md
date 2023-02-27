Check if the application is in debug mode with an alternate method | [dotnet]

By writing the following

```cs
#if DEBUG
..
#else
..
#endif
```

you can specify code which should run while in debug mode and release respectively.

The draws with this method is that the code in its non-respective block doesn't get compiled when in a specific mode. While it might be a good thing that debug code doesn't get compiled in release it might also gives headaches when builds doesn't complete because it wasn't compiled when running locally in debug. So, when it doesn't really matter I rather use something like this to check if debugging mode is active.

```cs
public static class BuildConfiguration
{
    private static bool debugging;

    public static bool IsDebug()
    {
        RunInDebug();
        return debugging;
    }

    [Conditional("DEBUG")]
    private static void RunInDebug()
    {
        debugging = true;
    }
}
```

