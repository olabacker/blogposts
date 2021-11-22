My most useful extension methods to have for any project 🖖


## Random first

Get a random element from an enumeration

```cs
public static T RandomFirst<T>(this IEnumerable<T> sequence)
{
    var random = new Random((int)DateTime.Now.Ticks);

    if (sequence == null)
    {
        throw new ArgumentNullException();
    }

    if (!sequence.Any())
    {
        throw new ArgumentException("The sequence is empty.");
    }

    //optimization for ICollection<T>
    if (sequence is ICollection<T>)
    {
        ICollection<T> col = (ICollection<T>)sequence;
        return col.ElementAt(random.Next(col.Count));
    }

    int count = 1;
    T selected = default(T);

    foreach (T element in sequence)
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

## IsItFriday

```cs
public static bool IsItFriday(this DateTime dt)
{
    return dt.DayOfWeek == DayOfWeek.Friday;
}
```