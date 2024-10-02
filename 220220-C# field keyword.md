Field keyword | [c#]

The `field` keyword generates a backing field in an property automatically.

The following is an example of how you can check the incoming value in a set method property for `null` without having to create a backing field.

```cs
public string PropertyConstraint {
    get;
    set => field = value ?? throw new ArgumentNullException();
} = "";
```
