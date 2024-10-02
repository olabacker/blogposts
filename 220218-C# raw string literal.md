Raw string literal | [c#]

When copying in strings like json into code you usually have to escape some characters either with the help of `\` or with `@`. Now you can just use `"""` triple double-quotes to produce the raw string literal syntax and no longer need to escape anything.

```cs
var json = 
"""
{
  "name" : "ola",
  "mail" : "mail@olabacker.net" 
}
""";
```


