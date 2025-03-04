Improve reflection performance | [c#]



```csharp
private static readonly MethodInfo _methodInfo = typeof(CoolClass).GetMethod("ToString");

private static readonly Func<CoolClass, string> _compiledDelegate = (Func<CoolClass, string>)Delegate.CreateDelegate(typeof(Func<CoolClass, string>), _methodInfo);


private static string CallToString(CoolClass coolClass)
{
    return _compiledDelegate(coolClass);
}
```