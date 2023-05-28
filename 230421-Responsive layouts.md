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
.flexible-grid {
  display: flex;
  flex-wrap: wrap;
  gap: 1rem;
}

.flexible-grid > * {
  flex: 1 ;
}
```

## Reel

```css
.reel{
  --gap: 1rem;
  display: grid;
  gap: var(--gap);
  grid-auto-flow: column;
  grid-auto-columns: 30%;
  overflow-x: scroll;
  scroll-snap-type: x mandatory;
  scroll-padding: var(--gap);
}

.reel > * {
  scroll-snap-align: start;
}
```
```