Switch expression, indices and ranges | [c#]

## Indices and ranges

Get a set range from an array

```cs
var range = array[2..4]; // range between
var allWords = array[..];  // all
var firstFour = array[..4]; // until
var last = array[6..]; // starts at
```

Using `^x` means from end instead. The following range results in the last two elements.

```cs
var lastTwo = array[^2..^0];
```

## Switch expression

Switch expression is a more pleasing syntax in comparison to the standard switch.

```cs
public static Orientation ToOrientation(Direction direction) => direction switch
{
    Direction.Up    => Orientation.North,
    Direction.Right => Orientation.East,
    Direction.Down  => Orientation.South,
    Direction.Left  => Orientation.West,
    _ => throw new ArgumentOutOfRangeException(nameof(direction), $"Not expected direction value: {direction}"),
};
```