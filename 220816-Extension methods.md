The most useful extension methods! 🪄 | [dotnet] [c#]

# Extension methods


# When to use extension methods

Extension methods are a great way to add functionality to existing classes without having to inherit from them. This is useful when you want to add functionality to a class that you don't have access to or don't want to inherit from.

It is also a great way to add certain functionality to classes in certain contexts. For example, you can add a method to a class that is only available in a certain namespace.


# Generic static methods

## Validate

```cs
public static bool Validate<T>(this T @this, params Func<T, bool>[] predicates) =>
    predicates.All(x => x(@this));
```
Instead of multiple if statements of bloating when checking for validity, just add statements making the code very readable.  


## ApplyOps

Aggregate is a useful LINQ-method which certainly has its niche. In this case it clarifies when chaining lambdas continuously against any object.

```cs
public static T ApplyOps<T>(this T @this, params Func<T,T>[] f) =>
    f.Aggregate(@this, (acc, x) => x(acc));
```

## IEnumerable

## Random first

Get a random element from an enumeration

```cs
 public static T RandomFirst<T>(this IEnumerable<T> sequence)
{
    var random = new Random((int)DateTime.Now.Ticks);

    if (sequence == null)
    {
        throw new ArgumentNullException(nameof(sequence));
    }

    if (!sequence.Any())
    {
        throw new ArgumentException("The sequence is empty.");
    }

    //optimization for ICollection<T>
    if (sequence is ICollection<T> col)
    {
        return col.ElementAt(random.Next(col.Count));
    }

    var count = 1;
    var selected = default(T);

    foreach (var element in sequence)
    {
        if (random.Next(count++) == 0)
        {
            //Select the current element with 1/count probability
            selected = element;
        }
    }

    return selected;
}
```

## Shuffle

Extension method for shuffling an enumerable.
```cs
public static IEnumerable<T> Shuffle<T>(this IEnumerable<T> list) 
{
    var r = new Random((int)DateTime.Now.Ticks);
    var shuffledList = list.Select(x => new { Number = r.Next(), Item = x })
        .OrderBy(x => x.Number)
        .Select(x => x.Item);
    return shuffledList.ToList();
}
```


# Datetime 

## IsItFriday

```cs
public static bool IsItFriday(this DateTime dt)
{
    return dt.DayOfWeek == DayOfWeek.Friday;
}
```

## Next()

```cs
public static DateTime Next(this DateTime @this, DayOfWeek dayOfWeek)
{
    int offsetDays = dayOfWeek - @this.DayOfWeek;
    if (offsetDays <= 0)
    {
        offsetDays += 7;
    }

    return current.AddDays(offsetDays);
}
```

## IterateUntil

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


# Conclusion

Extension methods are very useful and allows for many improvements on the codebase.

I recommend watching the [NDC seminar by Simon Painter](https://www.youtube.com/watch?v=0ial6pfgV9g) for interesting look into interesting uses for extension methods.