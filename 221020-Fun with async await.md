Collected notes about some async/await practices | [dotnet] [c#]

## ConfigureAwait(false)

`ConfigureAwait(false)` allows for another thread to continue the execution after the `await` has been completed. This allows for better thread context switching since the executing thread is not required to continue the execution, allowing for more optimized thread scheduling. Returning to the same originating thread is mostly useful when working with the gui/main thread.

```cs
await httpClient.GetStringAsync("..").ConfigureAwait(false);  
```

## ValueTask

If you have a method returning a `Task<T>` with a hot path which returns without awaiting anything, consider returning a `ValueTask<T>` instead. Since `ValueTask` is a value type it will be created on the stack instead of the heap. So, use `Task` for methods usually or always going to be genuinely asynchronous, `ValueTask` when the method usually will be synchronous. 

```cs
async ValueTask<string> GetTextAsync(){

    if(cachedValue is not null)
        return cachedValue;

    return await httpClient.GetStringAsync("..");  
}
```

There is a lot of debate on this topic whether `ValueTask` should be used almost exclusively but it also has some caveats. They should never be awaited multiple times, concurrently and calling `.GetAwaiter().GetResult()` on it when not completed doesn't support blocking. There is a lot more to read on this topic [here](https://devblogs.microsoft.com/dotnet/understanding-the-whys-whats-and-whens-of-valuetask/).

## Return `Task` instead of awaiting

Consider simply returning the task instead of awaiting when possible. The method consumer needs to await the `Task` in the end resulting in one less context switch.  

```cs
Task<string> GetStringData()
{
    return httpClient.GetStringAsync("..");  
}
```

The cases where you still should `await` is when it is intended to capture an exception. Simply returning the `Task` would return before executing inside the `try-catch` block, making the exception throw at the consumers execution instead. 

```cs
async Task<string> GetStringData()
{
    try
    {
        return await httpClient.GetStringAsync("..");
    }
    catch
    {
        // exception
    }
}
```