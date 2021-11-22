Useful reflection methods 🪞


Get all subclasses by type

```cs

public static IEnumerable<Type> GetSubClasses<T>() => typeof(T)
    .Assembly.GetTypes()
    .Where(t => t.IsSubclassOf(typeof(T)) && !t.IsAbstract)

```