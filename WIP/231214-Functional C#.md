writing functional oriented c# | [functional] [c#]

```cs
public static T IterateUntil<T>(T seed, Func<T, T> func, Func<T, bool> predicate)
{
    var current = seed;
    while (!predicate(current))
    {
        current = func(current);
    }
    return current;
}
```

