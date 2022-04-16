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

Metadata with assembly type as string

