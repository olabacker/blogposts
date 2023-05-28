Responsive layouts | [css]


## Cluster

```css
.cluster {
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
}
```


## Auto grid

```css
.auto-grid {
  --min-col-size: 22rem;
  display: grid;
  gap: 1rem;
  grid-template-columns: repeat(auto-fit, minmax(var(--min-col-size), 1fr));
}
```

## Flexible grid

```css

```