Memory leak fixing | [dotnet]

## Premise

I've been working on a project where the production environment has been moved to docker containers from self-hosted windows servers. 

It was apparent that windows is way less aggressive towards high memeory processes. Processes can use alot of memory and reach maximum available memory and still will just try to keep it running. This instead lead to the process itself running into `OutOfMemoryException` eventually.

After moving to docker we learned that linux oom killer is really aggressive towards memory hungry processes. The sudden memory surges which was accepted in windows was not gonna go well with linux. This led to some detective work trying to find the culprits which increased memory usage over time as well as the sudden memory surges in the code base. 

## dotMemory

To my help at the time I tried to use the Visual Studio memory profiler initially. It simply didn't work at the time of investigation so I had to use JetBrains dotMemory instead which fortunately is superior in pretty much every way anyway..

## ToArray(), ToList() vs IEnumerable/IReadOnlyCollection

We had certain hot paths where `ToArray()` and `ToList()` were used extensively. Whilst they didn't cause the most trouble they certainly kept the GC on its toes. Here the solution was simple since the explicit types wasn't really needed, simply changing some return types to `IEnumerable` did the trick. 

## Predetermine collection sizes

While starting up the processes alot of objects are loaded into memory, specifically into lists and dictionaries. The objects were read from a database and the amount of objects is known at the point of loading. Lists were initialized using the empty constuctor which means that the initial capacity of the collection is 0. After an element is added it will be 4 after which every time the capacity is reach the internal array will copy itself and double in capacity. This causes some unnecessary allocations.

 A simple solution for this is to use [the constructor](https://docs.microsoft.com/en-us/dotnet/api/system.collections.generic.list-1.-ctor?view=net-6.0#system-collections-generic-list-1-ctor(system-int32))
 which sets the initial capacity. Now the elements added will not require the extra allocations happening when using the empty constructor. 

<!-- ## Span<T>


## Stack vs Heap allocation

| Type        | Allocation           
| -----------|:-------------|
| reference types | heap
| value type declared as variable in method | stack  |  
| value type declared as parameter in method | stack |
| value type declared as member of class | heap |
| value type declared as member of struct | wherever parent is allocated|
| ref struct | stack | -->

<!-- ## Empty collections

While encountering a property with a collection you might need to check it for null or try to rid of the problem by using the auto-property initializer to make sure the collection never is (at least less likely) null. What if the class which the auto-property initializer was set on has 1M+ objects allocated in memory? Then   -->

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