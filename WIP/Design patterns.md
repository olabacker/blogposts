Design patterns


## Singleton 

The Singleton pattern ensures that a class has only one instance and provides a global point of access to it. This pattern is often used for logging, driver objects, or for managing a single connection to a shared resource.

To implement the singleton pattern, you should define a private constructor so that the class cannot be instantiated from outside of itself. Also, you should define a private static instance variable to hold the singleton object and a public static method to provide global access to the singleton object.

Here is an example of a simple singleton class:

```cs
public class Singleton
{
    private static Singleton _instance;

    private Singleton() { }

    public static Singleton Instance
    {
        get
        {
            if (_instance == null)
            {
                _instance = new Singleton();
            }
            return _instance;
        }
    }
}
```


## Observer

The Observer pattern allows objects to be notified when the state of another object changes. This pattern is often used in event-driven systems, such as user interfaces, to update multiple objects when a particular event occurs.

To implement the observer pattern, you should define a subject interface that allows objects to attach and detach themselves as observers. Also, you should define an observer interface that defines the update method. Finally, you should create a concrete subject class that implements the subject interface, and maintains a list of observers.

Here is an example of a simple observer pattern using interfaces and delegates:
```cs
public interface IObserver
{
    void Update();
}

public interface ISubject
{
    void Attach(IObserver observer);
    void Detach(IObserver observer);
    void Notify();
}

public class ConcreteSubject : ISubject
{
    private List<IObserver> _observers = new List<IObserver>();

    public void Attach(IObserver observer)
    {
        _observers.Add(observer);
    }

    public void Detach(IObserver observer)
    {
        _observers.Remove(observer);
    }

    public void Notify()
    {
        foreach (var observer in _observers)
        {
            observer.Update();
        }
    }
}

```

Decorator: This pattern allows behavior to be added to an individual object, either statically or dynamically, without affecting the behavior of other objects from the same class. It is often used to add new functionality to an existing class without changing its source code.

Factory: This pattern defines an interface for creating an object, but lets subclasses decide which class to instantiate. It is often used to create objects that belong to a particular class hierarchy.

Command: This pattern encapsulates a request as an object, which allows the request to be treated as a method call, with support for undo/redo, auditing, and deferred execution.

Adapter: This pattern allows two incompatible interfaces to work together by wrapping an instance of one class with an adapter class that conforms to the interface of the other class.

Facade: This pattern provides a simplified interface to a complex system or library. It is often used to make a large, complex system more manageable by hiding its internal complexity behind a simple, easy-to-use interface.