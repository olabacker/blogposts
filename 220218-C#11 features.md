Bang bang (!!) operator 🤠

## Bang bang operator !! 

Before C# 11 null checking an argument in a method was done by throwing an `ArgumentNullException` manually. 
```cs
void Foo(object arg)
{
    if (arg is null)
    {
        throw new ArgumentNullException(nameof(arg));
    }        
}
```

In C# 11 the same is achieved by adding `!!` after the argument name. 
```cs
void Foo(object arg!!)
{
    // will throw if arg is null!!
}
```

## Field keyword

The `field` keyword generates a backing field in an property automaticly.

```cs
public string PropertyConstraint {
    get;
    set => field = value ?? throw new ArgumentNullException();
} = "";
```
