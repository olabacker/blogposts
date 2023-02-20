

## Indices and ranges

Get a set range from an array

### Starts at

```cs
var last = array[6..]; // starts at
```

### Range between

To get items in between a start and end index the syntax is `x..y`.

```cs
var range = array[2..4]; // range between
```

```cs
var allWords = array[..];  // all
```

### Ends at

```cs
var firstFour = array[..4]; // until
```


### From end

A typical implementation of getting the last index is to get the length - 1 inside the array bracket like this

```cs
var item = array[array.Length -1];
```

This can however be simplified to 

```cs
var item = array[^1];
```


Using `^x` means from end instead. The following range results in the last two elements.

```cs
var lastTwo = array[^2..^0];
```