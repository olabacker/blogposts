Useful 🪞 methods to be used with much care! | [dotnet] 

## Get all subclasses by type

```cs
public static IEnumerable<Type> GetSubClasses<T>() => 
    typeof(T)
    .Assembly.GetTypes()
    .Where(t => t.IsSubclassOf(typeof(T)) && !t.IsAbstract)
```

## Access private member 

Coworker told you that you may not make his private member public and accessible to you (and everyone else)? No worries, just steal it with reflection 👍

```cs
var field = typeof(PrivacyHolder)
    .GetField("privateMember",
        BindingFlags.Instance |
        BindingFlags.NonPublic
    );

var value = field.GetValue(privacyHolderInstance);
```

## Invoking a generic method

Somehow you ended up with a non-typed object in runtime and the api you need to call only accept generics. Good news, just invoke the method with 🪞 instead!

```cs
var method =  typeof(CoolClass)
    .GetMethod(nameof(CoolClass.GenericMethod),
        BindingFlags.Instance |
        BindingFlags.Public 
    );

var generic = method
    .MakeGenericMethod(coolRuntimeType)
    .Invoke(instanceOfCoolClass, args);
```

## Get all properties of a type

```cs
var properties = typeof(CoolClass)
    .GetProperties(
        BindingFlags.Instance |
        BindingFlags.Public
    );
```
