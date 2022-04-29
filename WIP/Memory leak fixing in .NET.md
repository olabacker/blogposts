Memory leak fixing in .NET

dotMemory

## Premise

I've been working on a project where the production environment has been moved to docker containers from self-hosted windows servers. 

It was apparent that windows is way less aggressive towards high memeory processes. Processes can use alot of memory and reach maximum available memory and still will just try to keep it running. This instead lead to the process itself running into `OutOfMemoryException`.

After moving to docker we learned that linux oom killer is really aggressive towards memory hungry processes. The sudden memory surges which was accepted in windows was not gonna go well with linux. This led to me doing detective work trying to find culprits and decrease overall memory usage and surges in the code base. 

## ToArray(), ToList() vs IEnumerable




## Predetermine collection sizes

## Span<T>


## Stack vs Heap allocation

reference types => heap

value type declared as variable in method => stack
value type declared as parameter in method => stack
value type declared as member of class => heap
value type declared as member of struct => wherever parent is allocated
ref struct => stack





## Empty collections



## Duplicate strings


In one case objects containing only metadata of actual objects which was not currently read into memory. It looked like similar to this class below. 

```cs
var meta = new Metadata(id, type);

class Metadata
{
    private int _id;
    private string _objectType;

    public Metadata(int id, Type type)
    {
        _id = id;
        _objectType = type.AssemblyQualifiedName;
    }
}
```

At first glance the class might look innocent but turned out to be a major memory hog. The usage of `type.AssemblyQualifiedName` causes a heap allocation to store the `_objectType` string for every created `Metadata` object. Whilst this might not be that bad for a very low amount of objects and with varied types we had the opposite.

After this discovery switching the constructor immediately was changed to use a reference from a mapped dictionary of the type name instead.

```cs
var meta = new Metadata(id, typeToAssemblyQualMap[type]);

class Metadata
{
    private int _id;
    private string _objectType;

    public Metadata(int id, string type)
    {
        _id = id;
        _objectType = type.AssemblyQualifiedName;
    }
}
```

This caused no extra string duplication at all vastly lowering memory usage by these objects and some speed performance as well due to the fewer allocations.